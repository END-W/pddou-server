package com.waiend.pddou.web.cinema;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.cinema.service.CinemaService;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 *
 * @author end
 * @date 2023年03月09日 22:30
 */
@RestController
@RequestMapping("cinema")
public class CinemaController {

    @Resource
    private CinemaService cinemaServiceImpl;

    /**
     * 获取影院列表
     *
     * @param city 城市
     * @return Result
     */
    @GetMapping("getCinemaList")
    public Result getCinemaList(String city) {
        return ResultFactory.buildSuccessResult(cinemaServiceImpl.getCinemaList(city));
    }

    /**
     * 根据名字模糊匹配影院
     *
     * @param cinemaName 影院名
     * @param city 城市
     * @return Result
     */
    @GetMapping("matchCinemaByName")
    public Result matchCinemaByName(String cinemaName, String city) {
        return ResultFactory.buildSuccessResult(cinemaServiceImpl.matchCinemaByName(cinemaName, city));
    }
}
