package com.waiend.pddou.core.comment.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.comment.entity.CommentEntity;
import com.waiend.pddou.core.comment.mapper.CommentMapper;
import com.waiend.pddou.core.comment.service.CommentService;
import com.waiend.pddou.core.comment.vo.CommentVo;
import com.waiend.pddou.core.comment.vo.WatchedMovieVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, CommentEntity> implements CommentService {

    @Resource
    private CommentMapper commentMapper;

    @Override
    public Map<String, Object> commentList(Integer page, Integer limit, String username, String movieName, String isPass) {
        Map<String, Object> map = new HashMap<>();

        int total = commentMapper.selectCountComment(username, movieName, isPass);
        List<CommentVo> commentList = commentMapper.selectCommentList((page - 1) * limit, limit, username, movieName, isPass);

        map.put("list", commentList);
        map.put("total", total);

        return map;
    }

    @Override
    public void changeStatus(Integer commentId, Boolean isPass) {
        CommentEntity commentEntity = new CommentEntity();
        commentEntity.setId(commentId);
        commentEntity.setIsPass(isPass);

        commentMapper.updateById(commentEntity);
    }

    @Override
    public void removeCommentById(Integer commentId) {
        commentMapper.deleteById(commentId);
    }

    @Override
    public List<WatchedMovieVo> getIsWatchedMovieByUserId(Long userId) {
        return commentMapper.selectIsWatchedMovieListByUserId(userId);
    }

    @Override
    public List<CommentVo> getAllUserPassComment(Integer movieId) {
        return commentMapper.selectPassCommentList(movieId);
    }

    @Override
    public CommentEntity getUserComment(Integer movieId, Long userId) {
        return commentMapper.selectOne(new QueryWrapper<CommentEntity>().lambda());
    }

    @Override
    public void updateUserComment(CommentEntity commentEntity, Long userId) {
        commentEntity.setIsPass(false);

        int i = commentMapper.update(commentEntity, new QueryWrapper<CommentEntity>().lambda()
                                    .eq(CommentEntity::getMovieId, commentEntity.getMovieId())
                                    .eq(CommentEntity::getUserId, userId));

        if (i == 0) {
            commentEntity.setUserId(userId);
            commentMapper.insert(commentEntity);
        }
    }
}
