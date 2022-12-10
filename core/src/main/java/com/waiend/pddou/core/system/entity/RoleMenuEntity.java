package com.waiend.pddou.core.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waiend.pddou.core.base.entity.BaseEntity;
import java.util.Date;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_role_menu")
public class RoleMenuEntity extends BaseEntity {

    /**
    * 角色id
    */
    private Integer roleId;

    /**
    * 菜单id
    */
    private Integer menuId;
}