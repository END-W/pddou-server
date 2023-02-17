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
     * @return map
     */
    Map<String, Object> info(Long employeeId);

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

    /**
     * 员工列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param phone 电话
     * @param employeeId 员工ID
     * @return map
     */
    Map<String, Object> employeeList(Integer page, Integer limit, String username, String phone, Long employeeId);

    /**
     * 添加员工
     *
     * @param employeeEntity 员工实体
     * @param employeeId
     */
    void addEmployee(EmployeeEntity employeeEntity, Long employeeId);

    /**
     * 更新员工信息
     * @param employeeEntity 员工实体
     */
    void updateEmployee(EmployeeEntity employeeEntity);

    /**
     * 删除员工
     *
     * @param employeeId 员工ID
     */
    void removeEmployeeById(Long employeeId);

    /**
     * 账号是否锁定
     *
     * @param employeeId 员工ID
     * @param locked 锁定状态
     */
    void changeStatus(Long employeeId, Boolean locked);
}
