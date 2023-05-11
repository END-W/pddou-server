package com.waiend.pddou.web.order;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.order.entity.OrderEntity;
import com.waiend.pddou.core.order.service.OrderService;
import com.waiend.pddou.web.base.resolver.UserId;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年03月04日 19:22
 */
@RestController
@RequestMapping("order")
public class OrderController {

    @Resource
    private OrderService orderServiceImpl;

    /**
     * 获取个人订单信息
     *
     * @param userId 用户ID
     * @return Result
     */
    @GetMapping("getOrderByUserId")
    public Result getOrderByUserId(@UserId Long userId) {
        return ResultFactory.buildSuccessResult(orderServiceImpl.getOrderByUserId(userId));
    }

    /**
     * 删除个人订单信息
     *
     * @param orderId 订单ID
     * @param userId 用户ID
     * @return Result
     */
    @DeleteMapping("delOrderByUserId")
    public Result delOrderByUserId(Integer orderId, @UserId Long userId) {
        orderServiceImpl.delOrderByUserId(orderId, userId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 用户下单
     *
     * @param orderEntity 订单实体
     * @param userId 用户ID
     * @return Result
     */
    @PostMapping("order")
    public Result order(@RequestBody OrderEntity orderEntity, @UserId Long userId) {
        return ResultFactory.buildSuccessResult(orderServiceImpl.order(orderEntity, userId));
    }
}
