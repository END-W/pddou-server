package com.waiend.pddou.core.comment.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.comment.entity.CommentEntity;

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
}
