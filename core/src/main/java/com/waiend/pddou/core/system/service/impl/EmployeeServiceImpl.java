package com.waiend.pddou.core.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.base.password.PasswordManager;
import com.waiend.pddou.core.common.constant.RedisConstants;
import com.waiend.pddou.core.common.util.IPUtils;
import com.waiend.pddou.core.common.util.JwtTokenUtils;
import com.waiend.pddou.core.common.util.RedisUtils;
import com.waiend.pddou.core.operationlog.entity.OperationLogEntity;
import com.waiend.pddou.core.operationlog.mapper.OperationLogMapper;
import com.waiend.pddou.core.system.dto.LoginEmployeeDto;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.entity.EmployeeRoleEntity;
import com.waiend.pddou.core.system.entity.RoleEntity;
import com.waiend.pddou.core.system.mapper.EmployeeMapper;
import com.waiend.pddou.core.system.mapper.EmployeeRoleMapper;
import com.waiend.pddou.core.system.mapper.RoleMapper;
import com.waiend.pddou.core.system.service.EmployeeService;
import com.waiend.pddou.core.system.vo.EmployeeVo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    private RoleMapper roleMapper;

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
        operationLogEntity.setOperationId(employeeEntity.getId())
                          .setUrl(request.getRequestURL().toString())
                          .setIp(IPUtils.getIpAddr(request))
                          .setParams(param)
                          .setOperationType(OperationLogEntity.OperationType.ADMIN)
                          .setDescription("登录操作");

        operationLogMapper.insert(operationLogEntity);

        Map<String, String> map = new HashMap<>();
        String token = jwtTokenUtils.generateToken(employeeEntity.getId());
        map.put("token", token);

        return map;
    }

    @Override
    public Map<String, Object> info(Long employeeId) {
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        Map<String, Object> map = new HashMap<>();
        map.put("name", employeeEntity.getName());
        map.put("avatar", employeeEntity.getAvatar());

        // 员工角色集合
        List<String> roles = employeeRoleMapper.selectRolesByEmployeeId(employeeId);
        map.put("roles", roles);

        return map;
    }

    @Override
    public void logout() {
    }

    @Override
    public void changePassword(Long employeeId, String password, String newPassword) {
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        boolean match = bCryptPasswordManager.match(employeeEntity.getPassword(), password);
        if (!match) {
            throw new IllegalArgumentException("密码错误");
        }
        employeeEntity = new EmployeeEntity();
        employeeEntity.setPassword(bCryptPasswordManager.hash(newPassword))
                      .setId(employeeId);
        employeeMapper.updateById(employeeEntity);
    }

    @Override
    public Map<String, Object> employeeList(Integer page, Integer limit, String username, String phone, Long employeeId) {
        ArrayList<EmployeeVo> employeeList = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();
        Page<EmployeeEntity> pages = new Page<>(page, limit);

        QueryWrapper<EmployeeEntity> queryWrapper = new QueryWrapper<>();

        List<Integer> roleIds = (List<Integer>) redisUtils.get(RedisConstants.EMPLOYEE_ROLES_KEY + employeeId);

        if (Objects.nonNull(roleIds)) {
            if (StringUtils.hasText(username)) {
                queryWrapper.like("username", username);
            }

            if (StringUtils.hasText(phone)) {
                queryWrapper.eq("phone", phone);
            }

            List<String> roles = roleMapper.selectBatchIds(roleIds).stream()
                                            .map(RoleEntity::getName)
                                            .collect(Collectors.toList());
            // 管理员权限
            if (roles.contains(EmployeeEntity.UserType.ADMIN.name())) {
                queryWrapper.eq("type", EmployeeEntity.Type.MERCHANT);
            } else if (roles.contains(EmployeeEntity.UserType.STORE.name())) { // 商家权限
                queryWrapper.eq("type", EmployeeEntity.Type.MERCHANT);
                queryWrapper.eq("parent_id", employeeId);
            } else if (roles.contains(EmployeeEntity.UserType.SUPERADMIN.name())) { // 超级管理员权限
                queryWrapper.in("user_type", EmployeeEntity.UserType.ADMIN,
                                                     EmployeeEntity.UserType.STORE,
                                                     EmployeeEntity.UserType.STAFF);
            } else { // 无权限
                map.put("list", employeeList);
                map.put("total", 0);
                return map;
            }

            queryWrapper.orderByDesc("create_time");

            employeeMapper.selectPage(pages, queryWrapper);

            for (EmployeeEntity e: pages.getRecords()) {
                EmployeeVo employeeVo = BeanUtil.copyProperties(e, EmployeeVo.class);
                employeeList.add(employeeVo);
            }

            map.put("list", employeeList);
            map.put("total", pages.getTotal());
        }

        return map;
    }

    @Transactional
    @Override
    public void addEmployee(EmployeeEntity employeeEntity, Long employeeId) {
        QueryWrapper<RoleEntity> queryWrapper = new QueryWrapper<>();
        if (EmployeeEntity.UserType.SUPERADMIN.name().equals(employeeEntity.getUserType().name())) {
            employeeEntity.setType(EmployeeEntity.Type.ADMINISTRATION);
            employeeEntity.setUserType(EmployeeEntity.UserType.ADMIN);
            queryWrapper.lambda().eq(RoleEntity::getName, EmployeeEntity.UserType.ADMIN);
        } else if (EmployeeEntity.UserType.STORE.name().equals(employeeEntity.getUserType().name())) {
            employeeEntity.setType(EmployeeEntity.Type.MERCHANT);
            employeeEntity.setUserType(EmployeeEntity.UserType.STAFF);
            employeeEntity.setParentId(employeeId);
            queryWrapper.lambda().eq(RoleEntity::getName, EmployeeEntity.UserType.STAFF);
        } else {
            return;
        }

        employeeEntity.setPassword(bCryptPasswordManager.hash(employeeEntity.getPassword()));

        employeeMapper.insert(employeeEntity);

        EmployeeRoleEntity employeeRoleEntity = new EmployeeRoleEntity();
        RoleEntity roleEntity = roleMapper.selectOne(queryWrapper);
        employeeRoleEntity.setEmployeeId(employeeEntity.getId());
        employeeRoleEntity.setRoleId(Math.toIntExact(roleEntity.getId()));

        employeeRoleMapper.insert(employeeRoleEntity);
    }

    @Override
    public void updateEmployee(EmployeeEntity employeeEntity) {
        employeeMapper.updateById(employeeEntity);
    }

    @Transactional
    @Override
    public void removeEmployeeById(Long employeeId) {
        employeeMapper.deleteById(employeeId);
        employeeRoleMapper.delete(new QueryWrapper<EmployeeRoleEntity>().lambda()
                                    .eq(EmployeeRoleEntity::getEmployeeId, employeeId));
    }

    @Override
    public void changeStatus(Long employeeId, Boolean locked) {
        EmployeeEntity employeeEntity = new EmployeeEntity();
        employeeEntity.setId(employeeId);
        employeeEntity.setLocked(locked);
        employeeMapper.updateById(employeeEntity);
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
