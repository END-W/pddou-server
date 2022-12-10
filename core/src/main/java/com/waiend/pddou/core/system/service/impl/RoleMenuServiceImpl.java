package com.waiend.pddou.core.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.system.mapper.RoleMenuMapper;
import com.waiend.pddou.core.system.entity.RoleMenuEntity;
import com.waiend.pddou.core.system.service.RoleMenuService;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenuEntity> implements RoleMenuService{

    @Resource
    private RoleMenuMapper roleMenuMapper;
}
