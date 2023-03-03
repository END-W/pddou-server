package com.waiend.pddou.admin.system;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.admin.base.resolver.EmployeeId;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.system.dto.LoginEmployeeDto;
import com.waiend.pddou.core.system.service.EmployeeService;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月09日 22:19
 */
@RestController
@RequestMapping("admin/auth")
public class AuthController {

    @Resource
    private EmployeeService employeeServiceImpl;

    // 由字母、数字、特殊字符，任意2种组成，6-30位
    private final static String PASSWORD_REGEX = "^(?![a-zA-Z]+$)(?!\\d+$)(?![^\\da-zA-Z\\s]+$).{6,30}$";

    /**
     * 登录
     *
     * @param loginEmployeeDto 登录实体
     * @param request 请求体
     * @return Result
     */
    @PostMapping("login")
    public Result login(@RequestBody LoginEmployeeDto loginEmployeeDto, HttpServletRequest request) {
        return ResultFactory.buildSuccessResult(employeeServiceImpl.login(loginEmployeeDto, request));
    }

    /**
     * 员工信息
     *
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("info")
    public Result info(@EmployeeId Long employeeId) {
        return ResultFactory.buildSuccessResult(employeeServiceImpl.info(employeeId));
    }

    /**
     * 注销
     *
     * @return Result
     */
    @RequiresOperationLog(description = "注销操作")
    @PostMapping("logout")
    public Result logout() {
        employeeServiceImpl.logout();
        return ResultFactory.buildSuccessResult("注销成功");
    }

    /**
     * 修改密码
     *
     * @param employeeId 员工ID
     * @param param map
     * @return Result
     */
    @RequiresOperationLog(description = "修改密码")
    @PostMapping("changePwd")
    public Result changePwd(@EmployeeId Long employeeId, @RequestBody Map<String, String> param) {
        String password = param.get("password");
        String newPassword = param.get("newPassword");
        if (!StringUtils.hasText(password) || !StringUtils.hasText(newPassword)) {
            return ResultFactory.buildErrorResult("密码格式错误");
        }
        employeeServiceImpl.changePassword(employeeId, password, newPassword);
        return ResultFactory.buildSuccessResult("修改密码成功");
    }
}
