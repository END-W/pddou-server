package com.waiend.pddou.core.comment.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.comment.entity.CommentEntity;
import com.waiend.pddou.core.comment.vo.CommentVo;
import com.waiend.pddou.core.comment.vo.WatchedMovieVo;

import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface CommentService extends IService<CommentEntity> {

    /**
     * 评论列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param movieName 电影名
     * @param isPass 通过/未通过
     * @return map
     */
    Map<String, Object> commentList(Integer page, Integer limit, String username, String movieName, String isPass);

    /**
     * 评论审核-通过/未通过
     *
     * @param commentId 评论ID
     * @param isPass 通过/未通过
     */
    void changeStatus(Integer commentId, Boolean isPass);

    /**
     * 删除用户影评
     *
     * @param commentId 评论ID
     */
    void removeCommentById(Integer commentId);

    /**
     * 获取个人评论的电影
     *
     * @param userId 用户ID
     * @return List<WatchedMovieVo>
     */
    List<WatchedMovieVo> getIsWatchedMovieByUserId(Long userId);

    /**
     * 获取所有用户通过审核的评论
     *
     * @param movieId 电影ID
     * @return List<CommentEntity>
     */
    List<CommentVo> getAllUserPassComment(Integer movieId);

    /**
     * 获取当前用户评论
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     * @return CommentEntity
     */
    CommentEntity getUserComment(Integer movieId, Long userId);

    /**
     * 更新当前用户评论
     *
     * @param commentEntity 评论实体
     * @param userId 用户ID
     */
    void updateUserComment(CommentEntity commentEntity, Long userId);
}
