package com.waiend.pddou.core.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waiend.pddou.core.base.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_employee_role")
public class EmployeeRoleEntity extends BaseEntity {

    /**
    * 平台id
    */
    private Long employeeId;

    /**
    * 角色id
    */
    private Integer roleId;
}