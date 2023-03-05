package com.waiend.pddou.web.comment;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.comment.entity.CommentEntity;
import com.waiend.pddou.core.comment.service.CommentService;
import com.waiend.pddou.web.base.resolver.UserId;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年03月05日 17:05
 */
@RestController
@RequestMapping("comment")
public class CommentController {

    @Resource
    private CommentService commentServiceImpl;

    /**
     * 获取个人评论的电影
     *
     * @param userId 用户ID
     * @return Result
     */
    @GetMapping("getIsWatchedMovieByUserId")
    public Result getIsWatchedMovieByUserId(@UserId Long userId) {
        return ResultFactory.buildSuccessResult(commentServiceImpl.getIsWatchedMovieByUserId(userId));
    }

    /**
     * 获取所有用户通过审核的评论
     *
     * @param movieId 电影ID
     * @return Result
     */
    @GetMapping("getAllUserPassComment")
    public Result getAllUserPassComment(Integer movieId) {
        return ResultFactory.buildSuccessResult(commentServiceImpl.getAllUserPassComment(movieId));
    }

    /**
     * 获取当前用户评论
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     * @return Result
     */
    @GetMapping("getUserComment")
    public Result getUserComment(Integer movieId, @UserId Long userId) {
        return ResultFactory.buildSuccessResult(commentServiceImpl.getUserComment(movieId, userId));
    }

    /**
     * 更新当前用户评论
     *
     * @param commentEntity 评论实体
     * @param userId 用户ID
     * @return Result
     */
    @PostMapping("updateUserComment")
    public Result updateUserComment(@RequestBody CommentEntity commentEntity, @UserId Long userId) {
        commentServiceImpl.updateUserComment(commentEntity, userId);
        return ResultFactory.buildSuccessResult();
    }
}
