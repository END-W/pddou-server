package com.waiend.pddou.admin.comment;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.comment.service.CommentService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author end
 * @date 2023年02月21日 21:54
 */
@RestController
@RequestMapping("admin/comment")
public class CommentController {

    @Resource
    private CommentService commentServiceImpl;

    /**
     * 评论列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param movieName 电影名
     * @param isPass 通过/未通过
     * @return Result
     */
    @GetMapping("list")
    public Result commentList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                              String username, String movieName, String isPass) {
        return ResultFactory.buildSuccessResult(commentServiceImpl.commentList(page, limit, username, movieName, isPass));
    }

    /**
     * 评论审核-通过/未通过
     *
     * @param map map
     * @return Result
     */
    @RequiresOperationLog(description = "评论审核-通过/未通过操作")
    @PostMapping("changeStatus")
    public Result changeStatus(@RequestBody Map<String, String> map) {
        Integer commentId = Integer.valueOf(map.get("commentId"));
        Boolean isPass = Boolean.valueOf(map.get("isPass"));
        commentServiceImpl.changeStatus(commentId, isPass);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 删除用户影评
     *
     * @param commentId 评论ID
     * @return Result
     */
    @RequiresOperationLog(description = "删除用户影评操作")
    @DeleteMapping("delete")
    public Result removeCommentById(Integer commentId) {
        commentServiceImpl.removeCommentById(commentId);
        return ResultFactory.buildSuccessResult();
    }
}
