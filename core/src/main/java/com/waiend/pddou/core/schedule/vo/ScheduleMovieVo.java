package com.waiend.pddou.core.schedule.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author end
 * @date 2023年03月28日 14:57
 */
@Data
public class ScheduleMovieVo {

    private Integer id;

    private String hallName;

    private String showDate;

    private String showTime;

    private BigDecimal price;

    private String seatInfo;
}
