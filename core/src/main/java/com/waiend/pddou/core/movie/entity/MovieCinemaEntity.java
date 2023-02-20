package com.waiend.pddou.core.movie.entity;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Data
@Accessors(chain = true)
@TableName("pddou_movie_cinema")
public class MovieCinemaEntity {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
    * 电影ID
    */
    @TableField(value = "movie_id")
    private Long movieId;

    /**
    * 影院ID
    */
    @TableField(value = "cinema_id")
    private Long cinemaId;

    /**
    * 票价
    */
    private BigDecimal price;
}