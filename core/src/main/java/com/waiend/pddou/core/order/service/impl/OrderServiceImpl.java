package com.waiend.pddou.core.order.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.mapper.CinemaMapper;
import com.waiend.pddou.core.order.vo.OrderVo;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.mapper.EmployeeMapper;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.order.mapper.OrderMapper;
import com.waiend.pddou.core.order.entity.OrderEntity;
import com.waiend.pddou.core.order.service.OrderService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:02
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, OrderEntity> implements OrderService {

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private CinemaMapper cinemaMapper;

    @Override
    public Map<String, Object> orderList(Integer page, Integer limit, String username, String movieName, String cinemaName, String orderNum, String payType, Long employeeId, String userType) {
        Map<String, Object> map = new HashMap<>();
        Long cinemaId = null;

        if (EmployeeEntity.UserType.STORE.name().equals(userType)
                || EmployeeEntity.UserType.STAFF.name().equals(userType)) {
            CinemaEntity cinemaEntity = cinemaMapper.selectOne(new QueryWrapper<CinemaEntity>().lambda()
                                                    .eq(CinemaEntity::getEmployeeId, employeeId));
            cinemaId = cinemaEntity.getId();
        }

        int total = orderMapper.selectCountOrder(username, movieName, cinemaName, orderNum, payType, cinemaId);
        List<OrderVo> orderList = orderMapper.selectOrderList((page - 1) * limit, limit, username, movieName, cinemaName, orderNum, payType, cinemaId);

        map.put("list", orderList);
        map.put("total", total);

        return map;
    }

    @Override
    public void deleteOrderByStore(Integer orderId) {
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setId(orderId);
        orderEntity.setIsDelete(true);

        orderMapper.updateById(orderEntity);
    }
}