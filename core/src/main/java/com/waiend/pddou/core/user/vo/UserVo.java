package com.waiend.pddou.core.user.vo;

import com.waiend.pddou.core.base.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author end
 * @date 2023年02月18日 14:31
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UserVo extends BaseEntity {

    private String username;

    private String phone;

    private String gender;

    private String birthday;

    private String sign;

    private Integer points;

    private Boolean locked;
}
