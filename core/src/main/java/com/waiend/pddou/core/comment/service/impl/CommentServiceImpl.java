package com.waiend.pddou.core.comment.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.comment.entity.CommentEntity;
import com.waiend.pddou.core.comment.mapper.CommentMapper;
import com.waiend.pddou.core.comment.service.CommentService;
import com.waiend.pddou.core.comment.vo.CommentVo;
import com.waiend.pddou.core.comment.vo.WatchedMovieVo;
import com.waiend.pddou.core.user.entity.UserEntity;
import com.waiend.pddou.core.user.mapper.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, CommentEntity> implements CommentService {

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private UserMapper userMapper;

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
    public List<CommentVo> getAllUserPassComment(Integer movieId, Long userId) {
        return commentMapper.selectPassCommentList(movieId, userId);
    }

    @Override
    public CommentVo getUserComment(Integer movieId, Long userId) {
        CommentEntity commentEntity = commentMapper.selectOne(new QueryWrapper<CommentEntity>().lambda()
                                                                .eq(CommentEntity::getMovieId, movieId)
                                                                .eq(CommentEntity::getUserId, userId));

        if (Objects.isNull(commentEntity)) {
            return null;
        }

        CommentVo commentVo = BeanUtil.copyProperties(commentEntity, CommentVo.class);

        UserEntity userEntity = userMapper.selectById(userId);

        commentVo.setAvatar(userEntity.getAvatar());
        commentVo.setUsername(userEntity.getUsername());

        return commentVo;
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

    @Override
    public void updateUserSupport(CommentEntity commentEntity) {
        commentMapper.updateById(commentEntity);
    }
}
