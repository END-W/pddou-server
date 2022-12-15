package com.waiend.pddou.admin.system;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.system.dto.LoginEmployeeDto;
import com.waiend.pddou.core.system.service.EmployeeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author end
 * @date 2022年12月09日 22:19
 */
@RestController
@RequestMapping("admin/auth")
public class AuthController {

    @Resource
    private EmployeeService employeeServiceImpl;

    @RequiresOperationLog(description = "登录操作")
    @PostMapping("/login")
    public Result login(LoginEmployeeDto loginEmployeeDto, HttpServletRequest request) {
        return ResultFactory.buildSuccessResult(employeeServiceImpl.login(loginEmployeeDto, request));
    }

    @GetMapping("info")
    public Result info() {
        return ResultFactory.buildSuccessResult("info");
    }

    @RequiresOperationLog(description = "注销操作")
    @PostMapping("/logout")
    public Result logout() {
        employeeServiceImpl.logout();
        return ResultFactory.buildSuccessResult("注销成功");
    }
}
