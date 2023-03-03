package com.waiend.pddou.admin.hall;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.admin.base.resolver.EmployeeId;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.hall.entity.HallEntity;
import com.waiend.pddou.core.hall.service.HallService;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.service.EmployeeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年02月21日 17:55
 */
@RestController
@RequestMapping("admin/hall")
public class HallController {

    @Resource
    private HallService hallServiceImpl;

    @Resource
    private EmployeeService employeeServiceImpl;

    /**
     * 商家影厅列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param name 影厅名称
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("listByStore")
    public Result hallListByStore(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                  @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                                  String name, @EmployeeId Long employeeId) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        return ResultFactory.buildSuccessResult(hallServiceImpl.hallListByStore(page, limit, name, employeeId));
    }

    /**
     * 商家获取影厅信息
     *
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("getHallByStore")
    public Result getHallByStore(@EmployeeId Long employeeId) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        return ResultFactory.buildSuccessResult(hallServiceImpl.getHallByStore(employeeId));
    }

    /**
     * 商家添加影厅
     *
     * @param hallEntity 影厅实体
     * @param employeeId 员工ID
     * @return Result
     */
    @RequiresOperationLog(description = "商家添加影厅操作")
    @PostMapping("addByStore")
    public Result addHallByStore(@RequestBody HallEntity hallEntity, @EmployeeId Long employeeId) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        hallServiceImpl.addHallByStore(hallEntity, employeeId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 商家更新影厅信息
     *
     * @param hallEntity 影厅实体
     * @return Result
     */
    @RequiresOperationLog(description = "商家更新影厅操作")
    @PutMapping("updateByStore")
    public Result updateHallByStore(@RequestBody HallEntity hallEntity) {
        hallServiceImpl.updateHallByStore(hallEntity);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 商家删除影厅
     *
     * @param id 影厅ID
     * @return Result
     */
    @RequiresOperationLog(description = "商家删除影厅操作")
    @DeleteMapping("deleteByStore")
    public Result removeHallByStore(Integer id) {
        hallServiceImpl.removeHallByStore(id);
        return ResultFactory.buildSuccessResult();
    }
}
