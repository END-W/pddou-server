package com.waiend.pddou.core.schedule.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author end
 * @date 2023年02月24日 15:37
 */
@Data
public class ScheduleVo {

    private Integer id;

    private String movieName;

    private String hallName;

    private String showDate;

    private String showTime;

    private BigDecimal price;
}
