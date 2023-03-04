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
import java.util.Map;

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

    /**
     * 更新用户昵称
     *
     * @param map map
     * @param userId 用户ID
     * @return Result
     */
    @PostMapping("updateUserName")
    public Result updateUserName(@RequestBody Map<String, String> map, @UserId Long userId) {
        String username = map.get("username");
        userServiceImpl.updateUserName(username, userId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 更新用户性别
     *
     * @param map map
     * @param userId 用户ID
     * @return Result
     */
    @PostMapping("updateUserGender")
    public Result updateUserGender(@RequestBody Map<String, String> map, @UserId Long userId) {
        String gender = map.get("gender");
        userServiceImpl.updateUserGender(gender, userId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 更新用户生日
     *
     * @param map map
     * @param userId 用户ID
     * @return Result
     */
    @PostMapping("updateUserBirthday")
    public Result updateUserBirthday(@RequestBody Map<String, String> map, @UserId Long userId) {
        String birthday = map.get("birthday");
        userServiceImpl.updateUserBirthday(birthday, userId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 更新用户手机号
     *
     * @param map map
     * @param userId 用户ID
     * @return Result
     */
    @PostMapping("updateUserPhone")
    public Result updateUserPhone(@RequestBody Map<String, String> map, @UserId Long userId) {
        String phone = map.get("phone");
        userServiceImpl.updateUserPhone(phone, userId);
        return ResultFactory.buildSuccessResult();
    }
}
