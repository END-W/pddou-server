package com.waiend.pddou.admin.system;

import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.admin.system.dto.LoginDto;
import com.waiend.pddou.core.system.service.EmployeeService;
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

    @PostMapping("/login")
    public Result login(LoginDto loginDto, HttpServletRequest request) {
        return ResultFactory.buildSuccessResult(employeeServiceImpl.login(
                loginDto.getUsername(), loginDto.getPassword(), request));
    }

    @PostMapping("/logout")
    public Result logout() {
        employeeServiceImpl.logout();
        return ResultFactory.buildSuccessResult("退出登录成功");
    }
}
