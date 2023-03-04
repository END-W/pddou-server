package com.waiend.pddou.web.wishmovie;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.wishmovie.service.WishMovieService;
import com.waiend.pddou.web.base.resolver.UserId;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年03月04日 21:49
 */
@RestController
@RequestMapping("wishMovie")
public class WishMovieController {

    @Resource
    private WishMovieService wishMovieServiceImpl;

    /**
     * 获取个人想看电影
     *
     * @param userId 用户ID
     * @return Result
     */
    @GetMapping("getWishMovieByUserId")
    public Result getWishMovieByUserId(@UserId Long userId) {
        return ResultFactory.buildSuccessResult(wishMovieServiceImpl.getWishMovieByUserId(userId));
    }

    /**
     * 获取个人评论的电影
     *
     * @param userId 用户ID
     * @return Result
     */
    @GetMapping("getIsWatchedMovieByUserId")
    public Result getIsWatchedMovieByUserId(@UserId Long userId) {
        return ResultFactory.buildSuccessResult(wishMovieServiceImpl.getIsWatchedMovieByUserId(userId));
    }
}
