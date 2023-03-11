package com.waiend.pddou.core.cinema.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author end
 * @date 2023年03月09日 22:45
 */
@Data
public class SelectCinemaVo {

    private Integer id;

    private String cinemaName;

    private String specifiedAddress;

    private BigDecimal lng;

    private BigDecimal lat;

    private BigDecimal distance;
}
