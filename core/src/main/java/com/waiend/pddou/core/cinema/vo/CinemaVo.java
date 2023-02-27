package com.waiend.pddou.core.cinema.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author end
 * @date 2023年02月25日 20:59
 */
@Data
public class CinemaVo {

    private Integer id;

    private String cinemaName;

    private String cinemaPhone;

    private String province;

    private String city;

    private String specifiedAddress;

    private String legalPerson;

    private BigDecimal lng;

    private BigDecimal lat;

    private Boolean isBlock;

    private String isExamine;

    private String checkPerson;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime checkTime;
}
