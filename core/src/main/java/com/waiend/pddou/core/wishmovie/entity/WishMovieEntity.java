package com.waiend.pddou.core.wishmovie.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("pddou_wish_movie")
public class WishMovieEntity {

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
     * 是否删除（0-false-默认，1-true）
     */
    @TableField(value = "is_delete")
    private Boolean isDelete;
}