package com.waiend.pddou.core.comment.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.comment.entity.CommentEntity;
import com.waiend.pddou.core.comment.vo.CommentVo;
import com.waiend.pddou.core.comment.vo.WatchedMovieVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface CommentMapper extends BaseMapper<CommentEntity> {

    /**
     * 统计评论总记录数
     *
     * @param username 用户名
     * @param movieName 电影名
     * @param isPass 通过/未通过
     * @return int
     */
    int selectCountComment(@Param("username") String username,
                            @Param("movieName") String movieName,
                            @Param("isPass") String isPass);

    /**
     * 查询评论列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param movieName 电影名
     * @param isPass 通过/未通过
     * @return
     */
    List<CommentVo> selectCommentList(@Param("page") int page, @Param("limit") Integer limit,
                                   @Param("username") String username, @Param("movieName") String movieName,
                                   @Param("isPass") String isPass);

    /**
     * 获取个人评论的电影
     *
     * @param userId 用户ID
     * @return List<WatchedMovieVo>
     */
    List<WatchedMovieVo> selectIsWatchedMovieListByUserId(@Param("userId") Long userId);

    /**
     * 获取所有用户通过审核的评论
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     * @return List<CommentVo>
     */
    List<CommentVo> selectPassCommentList(@Param("movieId") Integer movieId, @Param("userId") Long userId);
}