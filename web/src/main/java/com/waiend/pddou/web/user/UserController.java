package com.waiend.pddou.web.user;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.common.constant.RedisConstants;
import com.waiend.pddou.core.common.util.RandomUtils;
import com.waiend.pddou.core.common.util.RedisUtils;
import com.waiend.pddou.core.user.dto.LoginUserDto;
import com.waiend.pddou.core.user.service.UserService;
import com.waiend.pddou.web.base.resolver.UserId;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年03月03日 15:37
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Resource
    private UserService userServiceImpl;

    @Resource
    private RedisUtils redisUtils;

    /**
     * 手机登录
     *
     * @param loginUserDto 登录实体
     * @return Result
     */
    @PostMapping("phoneLogin")
    public Result phoneLogin(@RequestBody LoginUserDto loginUserDto) {
        return ResultFactory.buildSuccessResult(userServiceImpl.phoneLogin(loginUserDto));
    }

    /**
     * 获取手机验证码
     *
     * @param phone 手机号码
     * @return Result
     */
    @GetMapping("getPhoneCode")
    public Result getPhoneCode(String phone) {
        if (StringUtils.hasText(phone)) {
            String code = RandomUtils.generateVerCode();
            redisUtils.set(RedisConstants.PHONE_CODE_KEY + phone, code, 60 * 5L);
            System.out.println(code);
            return ResultFactory.buildSuccessResult(code);
        }

        return ResultFactory.buildErrorResult();
    }

    /**
     * 获取用户信息
     *
     * @param userId 用户ID
     * @return Result
     */
    @GetMapping("getUserInfo")
    public Result getUserInfo(@UserId Long userId) {
        return ResultFactory.buildSuccessResult(userServiceImpl.getUserInfo(userId));
    }
}
