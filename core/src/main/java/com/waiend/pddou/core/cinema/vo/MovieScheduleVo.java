package com.waiend.pddou.core.cinema.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author end
 * @date 2023年03月17日 16:38
 */
@Data
public class MovieScheduleVo {

    private Integer cinemaId;

    private Integer movieId;

    private Integer scheduleId;

    private String showDate;

    private String showTime;

    private String language;

    private String movieLong;

    private String hallName;

    private BigDecimal price;
}
