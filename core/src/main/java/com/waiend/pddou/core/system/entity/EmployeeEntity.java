package com.waiend.pddou.core.system.entity;

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
@TableName("sys_employee")
public class EmployeeEntity extends BaseEntity {

    /**
    * 用户名
    */
    private String username;

    /**
    * 密码
    */
    private String password;

    /**
    * 姓名
    */
    private String name;

    /**
    * 邮箱
    */
    private String email;

    /**
    * 手机号
    */
    private String phone;

    /**
    * 性别（男-MALE，女-FEMALE，保密-SECRET-默认）
    */
    private Gender gender;

    /**
    * 账号类型（平台-ADMINISTRATION，商家-MERCHANT）
    */
    private Type type;

    /**
    * 用户类型（超级管理员-SUPERADMIN，普通管理员-ADMIN，商家-STORE，员工-STAFF）
    */
    private UserType userType;

    /**
    * 父账号Id
    */
    private Long parentId;

    /**
    * 锁定（0-false-默认，1-true）
    */
    private Boolean locked;

    /**
    * 头像
    */
    private String avatar;

    public enum Gender {

        /**
         * 男
         */
        MALE,

        /**
         * 女
         */
        FEMALE,

        /**
         * 保密
         */
        SECRET
    }

    public enum Type {

        /**
         * 平台
         */
        ADMINISTRATION,

        /**
         * 商家
         */
        MERCHANT
    }

    public enum UserType {

        /**
         * 超级管理员
         */
        SUPERADMIN,

        /**
         * 普通管理员
         */
        ADMIN,

        /**
         * 商家
         */
        STORE,

        /**
         * 员工
         */
        STAFF
    }
}