package com.waiend.pddou.web.wishmovie;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.wishmovie.service.WishMovieService;
import com.waiend.pddou.web.base.resolver.UserId;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.web.bind.annotation.*;

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
     * 判断用户是否想看电影
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     * @return Result
     */
    @GetMapping("isWishMovie")
    public Result isWishMovie(Integer movieId, @UserId Long userId) {
        return ResultFactory.buildSuccessResult(wishMovieServiceImpl.isWishMovie(movieId, userId));
    }

    /**
     * 想看电影
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     * @return Result
     */
    @PostMapping("wishMovie")
    public Result wishMovie(Integer movieId, @UserId Long userId) {
        wishMovieServiceImpl.wishMovie(movieId, userId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 取消想看电影
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     * @return Result
     */
    @PutMapping("cancelWishMovie")
    public Result cancelWishMovie(Integer movieId, @UserId Long userId) {
        wishMovieServiceImpl.cancelWishMovie(movieId, userId);
        return ResultFactory.buildSuccessResult();
    }
}
