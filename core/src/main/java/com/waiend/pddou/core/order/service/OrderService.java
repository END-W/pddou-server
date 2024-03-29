package com.waiend.pddou.core.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.order.entity.OrderEntity;
import com.waiend.pddou.core.order.vo.OrderVo;

import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:02
 */
public interface OrderService extends IService<OrderEntity> {

    /**
     * 订单列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param movieName 电影名
     * @param cinemaName 影院名称
     * @param orderNum 订单号
     * @param payType 支付类型（NO_PAID-未支付-默认，PAID-已支付，FAILED-支付失败，RETURN-退票）
     * @param employeeId 员工ID
     * @param userType 用户类型
     * @return map
     */
    Map<String, Object> orderList(Integer page, Integer limit, String username, String movieName, String cinemaName, String orderNum, String payType, Long employeeId, String userType);

    /**
     * 商家删除订单
     *
     * @param orderId 订单ID
     */
    void deleteOrderByStore(Integer orderId);

    /**
     * 获取个人订单信息
     *
     * @param userId 用户ID
     * @return List<OrderVo>
     */
    List<OrderVo> getOrderByUserId(Long userId);

    /**
     * 删除个人订单信息
     *
     * @param orderId 订单ID
     * @param userId 用户ID
     */
    void delOrderByUserId(Integer orderId, Long userId);

    /**
     * 用户下单
     *
     * @param orderEntity 订单实体
     * @param userId 用户ID
     * @return String
     */
    String order(OrderEntity orderEntity, Long userId);
}
