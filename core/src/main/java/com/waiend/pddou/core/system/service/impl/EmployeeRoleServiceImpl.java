package com.waiend.pddou.core.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.system.entity.EmployeeRoleEntity;
import com.waiend.pddou.core.system.mapper.EmployeeRoleMapper;
import com.waiend.pddou.core.system.service.EmployeeRoleService;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class EmployeeRoleServiceImpl extends ServiceImpl<EmployeeRoleMapper, EmployeeRoleEntity> implements EmployeeRoleService {

    @Resource
    private EmployeeRoleMapper employeeRoleMapper;
}
