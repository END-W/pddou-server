package com.waiend.pddou.admin.order;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.admin.base.resolver.EmployeeId;
import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.order.service.OrderService;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.service.EmployeeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author end
 * @date 2023年02月22日 19:18
 */
@RestController
@RequestMapping("admin/order")
public class OrderController {

    @Resource
    private OrderService orderServiceImpl;

    @Resource
    private EmployeeService employeeServiceImpl;

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
     * @return Result
     */
    @GetMapping("list")
    public Result commentList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                              String username, String movieName, String cinemaName, String orderNum,
                              String payType, @EmployeeId Long employeeId, String userType) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        return ResultFactory.buildSuccessResult(orderServiceImpl.orderList(page, limit, username, movieName, cinemaName,
                                                                            orderNum, payType, employeeId, userType));
    }

    /**
     * 商家删除订单
     *
     * @param orderId 订单ID
     * @return Result
     */
    @RequiresOperationLog(description = "商家删除订单操作")
    @DeleteMapping("deleteByStore")
    public Result deleteOrderByStore(Integer orderId) {
        orderServiceImpl.deleteOrderByStore(orderId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 退票
     *
     * @param map
     * @return Result
     */
    @RequiresOperationLog(description = "退票操作")
    @PostMapping("returnTicket")
    public Result returnTicketById(@RequestBody Map<String, String> map) {
        Integer orderId = Integer.valueOf(map.get("orderId"));
        orderServiceImpl.returnTicketById(orderId);
        return ResultFactory.buildSuccessResult();
    }

}
