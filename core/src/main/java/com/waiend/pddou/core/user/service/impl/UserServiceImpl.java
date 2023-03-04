package com.waiend.pddou.core.user.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.common.constant.RedisConstants;
import com.waiend.pddou.core.common.util.JwtTokenUtils;
import com.waiend.pddou.core.common.util.RedisUtils;
import com.waiend.pddou.core.user.dto.LoginUserDto;
import com.waiend.pddou.core.user.entity.UserEntity;
import com.waiend.pddou.core.user.mapper.UserMapper;
import com.waiend.pddou.core.user.service.UserService;
import com.waiend.pddou.core.user.vo.UserVo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserEntity> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private RedisUtils redisUtils;

    @Resource
    private JwtTokenUtils jwtTokenUtils;


    @Override
    public Map<String, Object> userList(Integer page, Integer limit, String username, String phone) {
        ArrayList<UserVo> userList = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();
        Page<UserEntity> pages = new Page<>(page, limit);

        QueryWrapper<UserEntity> queryWrapper = new QueryWrapper<>();

        if (StringUtils.hasText(username)) {
            queryWrapper.like("username", username);
        }

        if (StringUtils.hasText(phone)) {
            queryWrapper.eq("phone", phone);
        }

        queryWrapper.orderByDesc("create_time");

        userMapper.selectPage(pages, queryWrapper);

        for (UserEntity e: pages.getRecords()) {
            UserVo userVo = BeanUtil.copyProperties(e, UserVo.class);
            userList.add(userVo);
        }

        map.put("list", userList);
        map.put("total", pages.getTotal());

        return map;
    }

    @Override
    public void removeUserById(Long userId) {
        userMapper.deleteById(userId);
    }

    @Override
    public void changeStatus(Long userId, Boolean locked) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setLocked(locked);
        userMapper.updateById(userEntity);
    }

    @Override
    public Map<String, String> phoneLogin(LoginUserDto loginUserDto) {
        String code = (String) redisUtils.get(RedisConstants.PHONE_CODE_KEY);
        if (!Objects.isNull(code) && !code.equals(loginUserDto.getCode())) {
            throw new IllegalArgumentException("验证码错误");
        }

        UserEntity userEntity = userMapper.selectOne(new QueryWrapper<UserEntity>().lambda()
                                            .eq(UserEntity::getPhone, loginUserDto.getPhone()));

        // 未注册
        if (Objects.isNull(userEntity)) {
            userEntity = new UserEntity();
            userEntity.setUsername(loginUserDto.getPhone())
                      .setPassword("$2a$10$e7/hVq5w6Qqn20z07KrMdOgWwob2XL0hIJhbqxy5E.2krqaJUevGq")
                      .setPhone(loginUserDto.getPhone());

            userMapper.insert(userEntity);
        }

        Map<String, String> map = new HashMap<>();
        String token = jwtTokenUtils.generateToken(userEntity.getId());
        map.put("token", token);

        return map;
    }

    @Override
    public UserVo getUserInfo(Long userId) {
        UserEntity userEntity = userMapper.selectById(userId);

        return BeanUtil.copyProperties(userEntity, UserVo.class);
    }

    @Override
    public void updateUserName(String username, Long userId) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setUsername(username);

        userMapper.updateById(userEntity);
    }

    @Override
    public void updateUserGender(String gender, Long userId) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setGender(gender);

        userMapper.updateById(userEntity);
    }

    @Override
    public void updateUserBirthday(String birthday, Long userId) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setBirthday(birthday);

        userMapper.updateById(userEntity);
    }

    @Override
    public void updateUserPhone(String phone, Long userId) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setPhone(phone);

        userMapper.updateById(userEntity);
    }
}
