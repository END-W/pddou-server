package com.waiend.pddou.web.movie;

import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.movie.service.MovieService;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年03月05日 17:01
 */
@RestController
@RequestMapping("movie")
public class MovieController {

    @Resource
    private MovieService movieServiceImpl;

    /**
     * 获取电影详情
     *
     * @param movieId 电影ID
     * @return Result
     */
    @GetMapping("getMovieDetail")
    public Result getMovieDetail(Integer movieId) {
        return ResultFactory.buildSuccessResult(movieServiceImpl.getMovieDetail(movieId));
    }

    /**
     * 获取电影列表
     *
     * @return Result
     */
    @GetMapping("getMovieList")
    public Result getMovieList() {
        return ResultFactory.buildSuccessResult(movieServiceImpl.getMovieList());
    }

    /**
     * 根据名字模糊匹配电影
     *
     * @param movieName 电影名
     * @return Result
     */
    @GetMapping("matchMovieByName")
    public Result matchMovieByName(String movieName) {
        return ResultFactory.buildSuccessResult(movieServiceImpl.matchMovieByName(movieName));
    }
}
