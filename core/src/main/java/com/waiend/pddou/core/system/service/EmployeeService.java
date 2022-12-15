package com.waiend.pddou.core.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.system.dto.LoginEmployeeDto;
import com.waiend.pddou.core.system.entity.EmployeeEntity;

import javax.servlet.http.HttpServletRequest;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface EmployeeService extends IService<EmployeeEntity> {

    String login(LoginEmployeeDto loginEmployeeDto, HttpServletRequest request);

    void logout();
}
