package com.waiend.pddou.core.system.service.impl;

import com.waiend.pddou.core.order.mapper.OrderMapper;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.mapper.EmployeeMapper;
import com.waiend.pddou.core.system.service.BoxOfficeService;
import com.waiend.pddou.core.system.vo.BoxOfficeMovieTypeVo;
import com.waiend.pddou.core.system.vo.BoxOfficeTop10Vo;
import com.waiend.pddou.core.system.vo.BoxOfficeVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author end
 * @date 2023年05月17日 23:56
 */
@Service
public class BoxOfficeServiceImpl implements BoxOfficeService {

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Override
    public List<BoxOfficeVo> getBoxOfficeData(String role, Long employeeId) {
        if (EmployeeEntity.UserType.STORE.name().equals(role)) {
            return orderMapper.selectBoxOfficeByStore(employeeId);
        } else if (EmployeeEntity.UserType.STAFF.name().equals(role)) {
            EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
            return orderMapper.selectBoxOfficeByStore(employeeEntity.getParentId());
        }
        return orderMapper.selectBoxOffice();
    }

    @Override
    public List<BoxOfficeMovieTypeVo> getBoxOfficeDataByMovieType(String role, Long employeeId) {
        if (EmployeeEntity.UserType.STORE.name().equals(role)) {
            return orderMapper.selectBoxOfficeDataByMovieTypeWithStore(employeeId);
        } else if (EmployeeEntity.UserType.STAFF.name().equals(role)) {
            EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
            return orderMapper.selectBoxOfficeDataByMovieTypeWithStore(employeeEntity.getParentId());
        }
        return orderMapper.selectBoxOfficeDataByMovieType();
    }

    @Override
    public List<BoxOfficeTop10Vo> getBoxOfficeTop10(String role, Long employeeId) {
        if (EmployeeEntity.UserType.STORE.name().equals(role)) {
            return orderMapper.selectBoxOfficeTop10ByStore(employeeId);
        } else if (EmployeeEntity.UserType.STAFF.name().equals(role)) {
            EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
            return orderMapper.selectBoxOfficeTop10ByStore(employeeEntity.getParentId());
        }
        return orderMapper.selectBoxOfficeTop10();
    }
}
