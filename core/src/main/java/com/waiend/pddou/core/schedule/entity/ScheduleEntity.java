package com.waiend.pddou.core.schedule.entity;

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
@TableName("pddou_schedule")
public class ScheduleEntity {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
    * 电影id
    */
    @TableField(value = "movie_id")
    private Integer movieId;

    /**
    * 影院id
    */
    @TableField(value = "cinema_id")
    private Integer cinemaId;

    /**
    * 影厅名
    */
    @TableField(value = "hall_name")
    private String hallName;

    /**
    * 放映日期
    */
    @TableField(value = "show_date")
    private String showDate;

    /**
    * 放映时间
    */
    @TableField(value = "show_time")
    private String showTime;

    /**
    * 座位信息
    */
    @TableField(value = "seat_info")
    private String seatInfo;
}