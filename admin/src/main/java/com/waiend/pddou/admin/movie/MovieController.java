package com.waiend.pddou.admin.movie;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.service.MovieService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author end
 * @date 2023年02月19日 15:35
 */
@RestController
@RequestMapping("admin/movie")
public class MovieController {

    @Resource
    private MovieService movieServiceImpl;

    /**
     * 电影列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param name 电影名
     * @param language 语言
     * @param type 类型
     * @param publicDate 上映时间
     * @return Result
     */
    @GetMapping("list")
    public Result MovieList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                            @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                            String name, String language, String type, String publicDate) {
        return ResultFactory.buildSuccessResult(movieServiceImpl.MovieList(page, limit, name, language, type, publicDate));
    }

    /**
     * 获取电影信息
     * @param movieId 电影ID
     * @return Result
     */
    @GetMapping("getMovie")
    public Result getMovie(Long movieId){
       return ResultFactory.buildSuccessResult(movieServiceImpl.getMovie(movieId));
    }

    /**
     * 添加电影
     *
     * @param movieEntity 电影实体
     * @return Result
     */
    @RequiresOperationLog(description = "添加电影操作")
    @PostMapping("add")
    public Result addMovie(@RequestBody MovieEntity movieEntity) {
        movieServiceImpl.addMovie(movieEntity);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 更新电影信息
     *
     * @param movieEntity 电影实体
     * @return Result
     */
    @RequiresOperationLog(description = "更新电影操作")
    @PutMapping("update")
    public Result updateMovie(@RequestBody MovieEntity movieEntity) {
        movieServiceImpl.updateMovie(movieEntity);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 电影上映/下映
     *
     * @param map map
     * @return Result
     */
    @RequiresOperationLog(description = "电影上映/下映操作")
    @PostMapping("changeStatus")
    public Result changeStatus(@RequestBody Map<String, String> map) {
        Long movieId = Long.valueOf(map.get("movieId"));
        Boolean isShow = Boolean.valueOf(map.get("isShow"));
        movieServiceImpl.changeStatus(movieId, isShow);
        return ResultFactory.buildSuccessResult();
    }
}
