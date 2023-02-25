package com.waiend.pddou.core.cinema.entity;

import java.time.LocalDateTime;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
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
@TableName("pddou_cinema")
public class CinemaEntity extends BaseEntity {

    /**
     * 影院名称
     */
    @TableField(value = "cinema_name")
    private String cinemaName;

    /**
     * 影院电话
     */
    @TableField(value = "cinema_phone")
    private String cinemaPhone;

    /**
     * 影院所在省份
     */
    private String province;

    /**
     * 影院所在市
     */
    private String city;

    /**
     * 影院所在区县
     */
    private String county;

    /**
     * 影院详细地址
     */
    @TableField(value = "specified_address")
    private String specifiedAddress;

    /**
     * 员工ID（法定代表人）
     */
    @TableField(value = "employee_id")
    private Long employeeId;

    /**
     * 影院是否被拉黑（0-false，1-true）
     */
    @TableField(value = "is_block")
    private Boolean isBlock;

    /**
     * 审核（HAVING_APPLY-审核中，FAIL-审核失败，ON_ACTIVITY-审核通过）
     */
    @TableField(value = "is_examine")
    private ExamineType isExamine;

    /**
     * 审核人ID
     */
    @TableField(value = "check_employee_id")
    private Long checkEmployeeId;

    /**
     * 审核时间
     */
    @TableField(value = "check_time")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime checkTime;

    public enum ExamineType {

        /**
         * 审核中
         */
        HAVING_APPLY,

        /**
         * 审核失败
         */
        FAIL,

        /**
         * 审核通过
         */
        ON_ACTIVITY
    }
}