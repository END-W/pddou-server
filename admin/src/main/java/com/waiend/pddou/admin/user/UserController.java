package com.waiend.pddou.admin.user;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.user.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author end
 * @date 2023年02月18日 14:24
 */
@RestController
@RequestMapping("admin/user")
public class UserController {

    @Resource
    private UserService userServiceImpl;

    /**
     * 用户列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param phone 电话
     * @return Result
     */
    @GetMapping("list")
    public Result userList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                           @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                           String username, String phone) {
        return ResultFactory.buildSuccessResult(userServiceImpl.userList(page, limit, username, phone));
    }

    /**
     * 删除用户
     *
     * @param userId 用户ID
     * @return Result
     */
    @RequiresOperationLog(description = "删除用户操作")
    @DeleteMapping("delete")
    public Result removeUserById(Long userId) {
        userServiceImpl.removeUserById(userId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 账号锁定/未锁定
     *
     * @param map map
     * @return Result
     */
    @RequiresOperationLog(description = "用户账号锁定/未锁定操作")
    @PostMapping("changeStatus")
    public Result changeStatus(@RequestBody Map<String, String> map) {
        Long userId = Long.valueOf(map.get("userId"));
        Boolean locked = Boolean.valueOf(map.get("locked"));
        userServiceImpl.changeStatus(userId, locked);
        return ResultFactory.buildSuccessResult();
    }
}
