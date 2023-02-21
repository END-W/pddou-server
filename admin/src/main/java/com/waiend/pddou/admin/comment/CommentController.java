package com.waiend.pddou.admin.comment;

import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.comment.service.CommentService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

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
}
