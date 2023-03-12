package com.waiend.pddou.core.cinema.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author end
 * @date 2023年03月12日 19:54
 */
@Data
public class CinemaScheduleVo {

    private Integer id;

    private String cinemaName;

    private String specifiedAddress;

    private String showDate;

    private BigDecimal lng;

    private BigDecimal lat;

    private BigDecimal distance;
}
