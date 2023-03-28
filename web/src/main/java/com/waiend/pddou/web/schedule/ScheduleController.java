package com.waiend.pddou.web.schedule;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.schedule.service.ScheduleService;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author end
 * @date 2023年03月28日 14:10
 */
@RestController
@RequestMapping("schedule")
public class ScheduleController {

    @Resource
    private ScheduleService scheduleServiceImpl;

    /**
     * 获取排片详情
     *
     * @param cinemaId 影院ID
     * @param movieId 电影ID
     * @param scheduleId 场次ID
     * @return Result
     */
    @GetMapping("getScheduleById")
    public Result getScheduleById(Integer cinemaId, Integer movieId, Integer scheduleId) {
        return ResultFactory.buildSuccessResult(scheduleServiceImpl.getScheduleById(cinemaId, movieId, scheduleId));
    }

    /**
     * 更新排片座位信息
     *
     * @param map map
     * @return Result
     */
    @PutMapping("updateScheduleSeat")
    public Result updateScheduleSeat(@RequestBody Map<String, String> map) {
        Integer scheduleId = Integer.valueOf(map.get("scheduleId"));
        String seatInfo = map.get("seatInfo");
        scheduleServiceImpl.updateScheduleSeat(scheduleId, seatInfo);
        return ResultFactory.buildSuccessResult();
    }
}
