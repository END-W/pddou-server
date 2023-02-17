package com.waiend.pddou.core.user.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waiend.pddou.core.base.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("pddou_user")
public class UserEntity extends BaseEntity {

    /**
    * 用户名
    */
    private String username;

    /**
    * 用户头像
    */
    private String avatar;

    /**
    * 用户密码
    */
    private String password;

    /**
    * 用户手机号码
    */
    private String phone;

    /**
    * 用户性别
    */
    private String gender;

    /**
    * 用户出生年月日
    */
    private String birthday;

    /**
    * 用户签名
    */
    private String sign;

    /**
    * 用户积分
    */
    private Integer points;

    /**
    * 锁定（0-false-默认，1-true）
    */
    private Boolean locked;
}