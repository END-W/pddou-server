package com.waiend.pddou.core.user.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.user.entity.UserEntity;
import com.waiend.pddou.core.user.mapper.UserMapper;
import com.waiend.pddou.core.user.service.UserService;
import com.waiend.pddou.core.user.vo.UserVo;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserEntity> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public Map<String, Object> userList(Integer page, Integer limit, String username, String phone) {
        ArrayList<UserVo> userList = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();
        Page<UserEntity> pages = new Page<>(page, limit);

        QueryWrapper<UserEntity> queryWrapper = new QueryWrapper<>();

        if (StringUtils.hasText(username)) {
            queryWrapper.eq("username", username);
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
}
