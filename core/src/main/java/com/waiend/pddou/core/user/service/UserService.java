package com.waiend.pddou.core.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.user.entity.UserEntity;

import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface UserService extends IService<UserEntity> {

    /**
     * 用户列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param phone 电话
     * @return map
     */
    Map<String, Object> userList(Integer page, Integer limit, String username, String phone);

    /**
     * 删除用户
     *
     * @param userId 用户ID
     */
    void removeUserById(Long userId);

    /**
     * 账号是否锁定
     *
     * @param userId 用户ID
     * @param locked 锁定状态
     */
    void changeStatus(Long userId, Boolean locked);
}
