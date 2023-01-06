package com.waiend.pddou.core.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.system.dto.LoginEmployeeDto;
import com.waiend.pddou.core.system.entity.EmployeeEntity;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface EmployeeService extends IService<EmployeeEntity> {

    /**
     * 登录
     *
     * @param loginEmployeeDto 登录实体
     * @param request 请求体
     * @return map
     */
    Map<String, String> login(LoginEmployeeDto loginEmployeeDto, HttpServletRequest request);

    /**
     * 员工信息
     *
     * @param employeeId 员工ID
     * @return
     */
    Map<String, String> info(Long employeeId);

    /**
     * 注销
     */
    void logout();

    /**
     * 修改密码
     *  @param employeeId 员工ID
     * @param password
     * @param newPassword 新密码
     */
    void changePassword(Long employeeId, String password, String newPassword);
}
