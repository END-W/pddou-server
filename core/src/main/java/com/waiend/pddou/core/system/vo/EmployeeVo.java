package com.waiend.pddou.core.system.vo;

import com.waiend.pddou.core.base.entity.BaseEntity;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author end
 * @date 2023年02月16日 19:05
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class EmployeeVo extends BaseEntity {

    private String username;

    private String name;

    private String email;

    private String phone;

    private EmployeeEntity.Gender gender;

    private EmployeeEntity.Type type;

    private EmployeeEntity.UserType userType;

    private Boolean locked;

    private String avatar;
}
