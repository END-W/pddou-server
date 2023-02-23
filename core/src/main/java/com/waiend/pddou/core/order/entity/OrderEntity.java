package com.waiend.pddou.core.order.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Data
@Accessors(chain = true)
@TableName("pddou_order")
public class OrderEntity {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    @TableField(value = "user_id")
    private Long userId;

    /**
     * 场次id
     */
    @TableField(value = "schedule_id")
    private Integer scheduleId;

    /**
     * 订单号
     */
    @TableField(value = "order_num")
    private String orderNum;

    /**
     * 订单日期
     */
    @TableField(value = "order_date")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime orderDate;

    /**
     * 票数
     */
    @TableField(value = "ticket_num")
    private Byte ticketNum;

    /**
     * 总票价
     */
    @TableField(value = "ticket_total_price")
    private BigDecimal ticketTotalPrice;

    /**
     * 座位号
     */
    @TableField(value = "order_seat_info")
    private String orderSeatInfo;

    /**
     * 支付类型（NO_PAID-未支付-默认，PAID-已支付，FAILED-支付失败，RETURN-退票）
     */
    @TableField(value = "pay_type")
    private PayType payType;

    /**
     * 取票码
     */
    @TableField(value = "ticket_code")
    private String ticketCode;

    /**
     * 商家（0-false-默认，1-true）
     */
    @TableField(value = "is_delete")
    private Boolean isDelete;

    /**
     * 用户（0-false-默认，1-true）
     */
    @TableField(value = "is_delete1")
    private Boolean isDelete2;

    public enum PayType {

        /**
         * 未支付
         */
        NO_PAID,

        /**
         * 已支付
         */
        PAID,

        /**
         * 支付失败
         */
        FAILED,

        /**
         * 退票
         */
        RETURN
    }
}