package com.waiend.pddou.core.movie.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.waiend.pddou.core.base.entity.BaseEntity;
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
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("pddou_movie")
public class MovieEntity extends BaseEntity {

    /**
    * 电影名称
    */
    private String name;

    /**
    * 电影海报
    */
    private String poster;

    /**
    * 导演
    */
    private String director;

    /**
    * 主演
    */
    private String actor;

    /**
    * 电影片长
    */
    @TableField(value = "movie_long")
    private String movieLong;

    /**
    * 电影语言版本
    */
    private String language;

    /**
    * 电影简介
    */
    private String intro;

    /**
    * 电影类型
    */
    private String type;

    /**
    * 电影上映时间
    */
    @TableField(value = "public_date")
    private String publicDate;

    /**
    * 想看人数
    */
    @TableField(value = "wish_num")
    private Integer wishNum;

    /**
    * 电影综合评分
    */
    private BigDecimal score;
}