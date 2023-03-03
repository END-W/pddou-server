package com.waiend.pddou.admin.cinema;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.admin.base.resolver.EmployeeId;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.service.CinemaService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author end
 * @date 2023年02月25日 16:04
 */
@RestController
@RequestMapping("admin/cinema")
public class CinemaController {

    @Resource
    private CinemaService cinemaServiceImpl;

    /**
     * 影院列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param cinemaName 影院名
     * @param isExamine 审核状态
     * @param isBlock 拉黑/未拉黑
     * @return Result
     */
    @GetMapping("list")
    public Result cinemaList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                             String cinemaName, String isExamine, Integer isBlock) {
        return ResultFactory.buildSuccessResult(cinemaServiceImpl.cinemaList(page, limit, cinemaName, isExamine, isBlock));
    }

    /**
     * 查询影院信息
     *
     * @param cinemaId 影院ID
     * @return Result
     */
    @GetMapping("getCinema")
    public Result getCinema(Integer cinemaId) {
        return ResultFactory.buildSuccessResult(cinemaServiceImpl.getCinema(cinemaId));
    }

    /**
     * 添加影院
     *
     * @param cinemaEntity 影院实体
     * @return Result
     */
    @RequiresOperationLog(description = "添加影院操作")
    @PostMapping("add")
    public Result addCinema(@RequestBody CinemaEntity cinemaEntity) {
        cinemaServiceImpl.addCinema(cinemaEntity);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 编辑影院
     *
     * @param cinemaEntity 影院实体
     * @return Result
     */
    @RequiresOperationLog(description = "编辑影院操作")
    @PutMapping("update")
    public Result updateCinema(@RequestBody CinemaEntity cinemaEntity) {
        cinemaServiceImpl.updateCinema(cinemaEntity);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 审核影院
     *
     * @param map map
     * @param employeeId 员工ID
     * @return Result
     */
    @RequiresOperationLog(description = "审核影院操作")
    @PostMapping("examineCinema")
    public Result examineCinema(@RequestBody Map<String, String> map, @EmployeeId Long employeeId) {
        Long id = Long.valueOf(map.get("id"));
        String isExamine = map.get("isExamine");
        cinemaServiceImpl.examineCinema(id, isExamine, employeeId);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 拉黑影院
     *
     * @param cinemaId 影院ID
     * @return Result
     */
    @RequiresOperationLog(description = "拉黑影院操作")
    @PostMapping("blockCinema")
    public Result blockCinema(Long cinemaId) {
        cinemaServiceImpl.blockCinema(cinemaId);
        return ResultFactory.buildSuccessResult();
    }
}
