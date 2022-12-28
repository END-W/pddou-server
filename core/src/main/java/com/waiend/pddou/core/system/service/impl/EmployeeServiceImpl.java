package com.waiend.pddou.core.system.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.base.password.PasswordManager;
import com.waiend.pddou.core.common.constant.RedisConstants;
import com.waiend.pddou.core.common.util.IPUtils;
import com.waiend.pddou.core.common.util.JwtTokenUtils;
import com.waiend.pddou.core.common.util.RedisUtils;
import com.waiend.pddou.core.operationlog.entity.OperationLogEntity;
import com.waiend.pddou.core.operationlog.mapper.OperationLogMapper;
import com.waiend.pddou.core.system.dto.LoginEmployeeDto;
import com.waiend.pddou.core.system.entity.EmployeeRoleEntity;
import com.waiend.pddou.core.system.mapper.EmployeeRoleMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.waiend.pddou.core.system.mapper.EmployeeMapper;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.service.EmployeeService;
import org.springframework.util.Assert;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, EmployeeEntity> implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private EmployeeRoleMapper employeeRoleMapper;

    @Resource
    private OperationLogMapper operationLogMapper;

    @Resource
    private RedisUtils redisUtils;

    @Resource
    private JwtTokenUtils jwtTokenUtils;

    @Resource
    private PasswordManager bCryptPasswordManager;

    @Value("${token.expire}")
    private long expire;

    private final String LOGIN_LOCK_KEY = "login:lock:";

    @Override
    public Map<String, String> login(LoginEmployeeDto loginEmployeeDto, HttpServletRequest request) {
        String ip = IPUtils.getIpAddr(request);

        Assert.isTrue(!isLock(loginEmployeeDto.getUsername(), ip), "密码错误已达五次，账号已锁定，请24小时后重试");
        EmployeeEntity employeeEntity = employeeMapper.selectOne(Wrappers.<EmployeeEntity>lambdaQuery().
                                        eq(EmployeeEntity::getUsername, loginEmployeeDto.getUsername()));

        // 可尝试次数
        Integer ATTEMPT_NUMBER = 5;
        if (Objects.isNull(employeeEntity)) {
            Integer integer = updateFailNumber(loginEmployeeDto.getUsername(), ip);
            throw new IllegalArgumentException("用户名或密码不正确,剩余尝试次数为:" + (ATTEMPT_NUMBER - integer) + "次");
        }

        boolean match = bCryptPasswordManager.match(employeeEntity.getPassword(), loginEmployeeDto.getPassword());
        if (!match) {
            Integer integer = updateFailNumber(loginEmployeeDto.getUsername(), ip);
            throw new IllegalArgumentException("用户名或密码不正确,剩余尝试次数为:" + (ATTEMPT_NUMBER - integer) + "次");
        }

        Assert.isTrue(!employeeEntity.getLocked(), "账号已被锁定");

        // 缓存员工角色
        List<EmployeeRoleEntity> roles = employeeRoleMapper.selectList(Wrappers.<EmployeeRoleEntity>lambdaQuery()
                                                .eq(EmployeeRoleEntity::getEmployeeId, employeeEntity.getId()));
        List<Integer> roleIds = roles.stream().map(EmployeeRoleEntity::getRoleId).collect(Collectors.toList());
        redisUtils.set(RedisConstants.EMPLOYEE_ROLES_KEY + employeeEntity.getId(), roleIds, expire);

        // 记录操作日志
        // 获取请求参数信息
        String param = JSON.toJSONString(request.getParameterMap(),
                SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteMapNullValue);

        OperationLogEntity operationLogEntity = new OperationLogEntity();
        operationLogEntity.setOperationId(employeeEntity.getId());
        operationLogEntity.setUrl(request.getRequestURL().toString());
        operationLogEntity.setIp(IPUtils.getIpAddr(request));
        operationLogEntity.setParams(param);
        operationLogEntity.setOperationType(OperationLogEntity.OperationType.ADMIN);
        operationLogEntity.setDescription("登录操作");

        operationLogMapper.insert(operationLogEntity);

        Map<String, String> map = new HashMap<>();
        String token = jwtTokenUtils.generateToken(employeeEntity.getId());
        map.put("token", token);

        return map;
    }

    @Override
    public Map<String, String> info(Long employeeId) {
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        Map<String, String> map = new HashMap<>();
        map.put("name", employeeEntity.getName());
        map.put("avatar", employeeEntity.getAvatar());

        // 员工角色集合
        List<String> roles = employeeRoleMapper.selectRolesByEmployeeId(employeeId);
        map.put("roles", "admin");

        return map;
    }

    @Override
    public void logout() {
    }

    /**
     * 账号是否被锁定
     *
     * @param username 用户名
     * @param ip       地址
     * @return true 锁定，false 未锁定
     */
    private boolean isLock(String username, String ip) {
        ip = ip.replaceAll("\\.", "");
        String key = LOGIN_LOCK_KEY + username + ":" + ip;
        Integer value = (Integer) redisUtils.get(key);
        return Objects.nonNull(value) && value >= 5;
    }

    /**
     * 添加失败次数
     *
     * @param username 用户名
     * @param ip       地址
     * @return 失败次数
     */
    private Integer updateFailNumber(String username, String ip) {
        ip = ip.replaceAll("\\.", "");
        String key = LOGIN_LOCK_KEY + username + ":" + ip;
        Integer value = (Integer) redisUtils.get(key);
        if (Objects.isNull(value)) {
            redisUtils.set(key, 1, 60 * 60 * 24L);
            value = 1;
        } else {
            redisUtils.incr(key, 1);
            value += 1;
        }
        return value;
    }
}
