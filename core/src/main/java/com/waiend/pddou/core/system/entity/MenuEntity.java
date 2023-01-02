package com.waiend.pddou.core.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waiend.pddou.core.base.entity.BaseEntity;
import java.util.Date;
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
@TableName("sys_menu")
public class MenuEntity extends BaseEntity {

    /**
    * 父节点（默认为0）
    */
    private Integer parentId;

    /**
    * 菜单名
    */
    private String name;

    /**
    * 路由路径
    */
    private String router;

    /**
    * 权限表达式
    */
    private String perms;

    /**
    * 1为展示（默认），0为不展示
    */
    private Byte isShow;

    /**
    * 类型 0：目录（默认）1：菜单 2：按钮
    */
    private Byte type;
}