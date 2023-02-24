package com.waiend.pddou.core.schedule.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
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
