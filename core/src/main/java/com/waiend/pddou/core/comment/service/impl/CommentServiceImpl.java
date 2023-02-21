package com.waiend.pddou.core.comment.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.comment.entity.CommentEntity;
import com.waiend.pddou.core.comment.mapper.CommentMapper;
import com.waiend.pddou.core.comment.service.CommentService;
import com.waiend.pddou.core.comment.vo.CommentVo;
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
public class CommentServiceImpl extends ServiceImpl<CommentMapper, CommentEntity> implements CommentService{

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
}
