package com.waiend.pddou.web.cinema;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.cinema.service.CinemaService;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.math.BigDecimal;

/**
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
     * @param movieId 电影ID
     * @param city 城市
     * @return Result
     */
    @GetMapping("getCinemaList")
    public Result getCinemaList(Integer movieId, String city) {
        return ResultFactory.buildSuccessResult(cinemaServiceImpl.getCinemaList(movieId, city));
    }
}
