package com.waiend.pddou.admin.schedule;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.admin.base.resolver.EmployeeId;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.schedule.entity.ScheduleEntity;
import com.waiend.pddou.core.schedule.service.ScheduleService;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.service.EmployeeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年02月24日 14:53
 */
@RestController
@RequestMapping("admin/schedule")
public class ScheduleController {

    @Resource
    private ScheduleService scheduleServiceImpl;

    @Resource
    private EmployeeService employeeServiceImpl;

    /**
     * 商家场次列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param movieName 电影名
     * @param hallName 影厅名称
     * @param isShelf 上架/下架
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("listByStore")
    public Result scheduleListByStore(@RequestParam(value = "page", defaultValue = "1") Integer page,
                               @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                               String movieName, String hallName, Integer isShelf, @EmployeeId Long employeeId) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        return ResultFactory.buildSuccessResult(scheduleServiceImpl.scheduleListByStore(page, limit, movieName,
                                                                    hallName, isShelf, employeeId));
    }

    /**
     * 商家获取电影信息
     *
     * @param name 电影名
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("getMovieByStore")
    public Result getMovieByStore(String name, @EmployeeId Long employeeId) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        return ResultFactory.buildSuccessResult(scheduleServiceImpl.getMovieByStore(name, employeeId));
    }

    /**
     * 商家添加场次
     *
     * @param scheduleEntity 场次实体
     * @param employeeId 员工ID
     * @return Result
     */
    @RequiresOperationLog(description = "商家添加场次操作")
    @PostMapping("addByStore")
    public Result addScheduleByStore(@RequestBody ScheduleEntity scheduleEntity,
                                     @EmployeeId Long employeeId) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        scheduleServiceImpl.addScheduleByStore(scheduleEntity, employeeId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 商家删除场次
     *
     * @param scheduleId 场次ID
     * @return Result
     */
    @RequiresOperationLog(description = "商家删除场次操作")
    @DeleteMapping("deleteByStore")
    public Result removeScheduleByStore(Integer scheduleId) {
        scheduleServiceImpl.removeScheduleByStore(scheduleId);
        return ResultFactory.buildSuccessResult();
    }
}
