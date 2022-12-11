package com.waiend.pddou.core.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.waiend.pddou.core.system.mapper.EmployeeMapper;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.service.EmployeeService;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, EmployeeEntity> implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;

    /**
     * 可尝试次数
     */
    private final Integer ATTEMPT_NUMBER = 5;

    @Override
    public String login(String username, String password, HttpServletRequest request) {
        return null;
    }

    @Override
    public void logout() {

    }
}
