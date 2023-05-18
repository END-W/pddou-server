package com.waiend.pddou.admin.system;

import com.waiend.pddou.admin.base.resolver.EmployeeId;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.system.service.BoxOfficeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年05月17日 23:54
 */
@RestController
@RequestMapping("admin/boxOffice")
public class BoxOfficeController {

    @Resource
    private BoxOfficeService officeServiceImpl;

    /**
     * 获取票房数据
     *
     * @param role 员工角色
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("getBoxOfficeData")
    public Result getBoxOfficeData(String role, @EmployeeId Long employeeId) {
        return ResultFactory.buildSuccessResult(officeServiceImpl.getBoxOfficeData(role, employeeId));
    }

    /**
     * 根据电影类型获取票房数据
     *
     * @param role 员工角色
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("getBoxOfficeDataByMovieType")
    public Result getBoxOfficeDataByMovieType(String role, @EmployeeId Long employeeId) {
        return ResultFactory.buildSuccessResult(officeServiceImpl.getBoxOfficeDataByMovieType(role, employeeId));
    }

    /**
     * 获取票房前十
     *
     * @param role 员工角色
     * @param employeeId 员工ID
     * @return Result
     */
    @GetMapping("getBoxOfficeTop10")
    public Result getBoxOfficeTop10(String role, @EmployeeId Long employeeId) {
        return ResultFactory.buildSuccessResult(officeServiceImpl.getBoxOfficeTop10(role, employeeId));
    }
}
