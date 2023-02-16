package com.waiend.pddou.admin.system;

import com.waiend.pddou.admin.base.resolver.EmployeeId;
import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.service.EmployeeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author end
 * @date 2023年02月16日 18:23
 */
@RestController
@RequestMapping("admin/employee")
public class EmployeeController {

    @Resource
    private EmployeeService employeeServiceImpl;

    /**
     * 员工列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param phone 电话
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("list")
    public Result employeeList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                               @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                               String username, String phone,
                               @EmployeeId Long employeeId) {
        return ResultFactory.buildSuccessResult(employeeServiceImpl.employeeList(page, limit, username, phone, employeeId));
    }

    /**
     * 添加员工
     *
     * @param employeeEntity 员工实体
     * @return Result
     */
    @PostMapping("add")
    public Result addEmployee(@RequestBody EmployeeEntity employeeEntity) {
        employeeServiceImpl.addEmployee(employeeEntity);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 更新员工信息
     *
     * @param employeeEntity 员工实体
     * @return Result
     */
    @PutMapping("update")
    public Result updateEmployee(@RequestBody EmployeeEntity employeeEntity) {
        employeeServiceImpl.updateEmployee(employeeEntity);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 删除员工
     *
     * @param employeeId 员工ID
     * @return Result
     */
    @DeleteMapping("delete")
    public Result removeEmployeeById(Long employeeId) {
        employeeServiceImpl.removeEmployeeById(employeeId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 账号是否锁定
     *
     * @param map map
     * @return Result
     */
    @PostMapping("changeStatus")
    public Result changeStatus(@RequestBody Map<String, String> map) {
        Long employeeId = Long.valueOf(map.get("employeeId"));
        Boolean locked = Boolean.valueOf(map.get("locked"));
        employeeServiceImpl.changeStatus(employeeId, locked);
        return ResultFactory.buildSuccessResult();
    }
}