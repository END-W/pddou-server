package com.waiend.pddou.core.user.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.user.entity.UserEntity;
import com.waiend.pddou.core.user.service.UserService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.user.mapper.UserMapper;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserEntity> implements UserService {

    @Resource
    private UserMapper userMapper;
}
