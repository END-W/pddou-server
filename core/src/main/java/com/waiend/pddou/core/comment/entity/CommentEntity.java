package com.waiend.pddou.core.comment.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Data
@Accessors(chain = true)
@TableName("pddou_comment")
public class CommentEntity {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
    * 用户id
    */
    @TableField(value = "user_id")
    private Long userId;

    /**
    * 电影id
    */
    @TableField(value = "movie_id")
    private Integer movieId;

    /**
    * 用户评分
    */
    @TableField(value = "user_score")
    private BigDecimal userScore;

    /**
    * 用户评论内容
    */
    private String content;

    /**
    * 评论日期
    */
    @TableField(value = "comment_date")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime commentDate;

    /**
    * 点赞数
    */
    @TableField(value = "support_num")
    private Integer supportNum;

    /**
     * 点赞用户数组
     */
    @TableField(value = "support_user", updateStrategy = FieldStrategy.IGNORED)
    private String supportUser;

    /**
    * 评论是否通过审核（默认0）
    */
    @TableField(value = "is_pass")
    private Boolean isPass;

    /**
    * 父id（默认0）
    */
    @TableField(value = "parent_id")
    private Integer parentId;
}