package com.waiend.pddou.core.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.system.entity.EmployeeRoleEntity;

import java.util.List;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface EmployeeRoleMapper extends BaseMapper<EmployeeRoleEntity> {

    List<String> selectRolesByEmployeeId(Long id);
}