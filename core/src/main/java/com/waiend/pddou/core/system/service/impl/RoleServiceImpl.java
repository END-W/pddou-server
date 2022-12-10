package com.waiend.pddou.core.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.system.entity.RoleEntity;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.system.mapper.RoleMapper;
import com.waiend.pddou.core.system.service.RoleService;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, RoleEntity> implements RoleService {

    @Resource
    private RoleMapper roleMapper;

}
