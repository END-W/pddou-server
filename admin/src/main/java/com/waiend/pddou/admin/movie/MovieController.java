package com.waiend.pddou.admin.movie;

import com.waiend.pddou.admin.base.auth.RequiresOperationLog;
import com.waiend.pddou.admin.base.resolver.EmployeeId;
import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.movie.entity.MovieCinemaEntity;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.service.MovieService;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.service.EmployeeService;
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

    @Resource
    private EmployeeService employeeServiceImpl;

    /**
     * 电影列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param name 电影名
     * @param language 语言
     * @param isShow 上映/下映
     * @return Result
     */
    @GetMapping("list")
    public Result movieList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                            @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                            String name, String language, String isShow) {
        return ResultFactory.buildSuccessResult(movieServiceImpl.MovieList(page, limit, name, language, isShow));
    }

    /**
     * 商家电影列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param employeeId 员工ID
     * @param name 电影名
     * @param language 语言
     * @param isShow 上映/下映
     * @return Result
     */
    @GetMapping("listByStore")
    public Result movieListByStore(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                   @RequestParam(value = "limit", defaultValue = "20") Integer limit,
                                   @EmployeeId Long employeeId,
                                   String name, String language, String isShow) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        return ResultFactory.buildSuccessResult(movieServiceImpl.MovieListByStore(page, limit, employeeId, name, language, isShow));
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
     * 商家获取电影信息
     * @param name 电影名
     * @return Result
     */
    @GetMapping("getMovieByStore")
    public Result getMovieByStore(String name){
        return ResultFactory.buildSuccessResult(movieServiceImpl.getMovieByStore(name));
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
     * 商家添加电影
     *
     * @param movieCinemaEntity 电影-影院实体
     * @param employeeId 员工ID
     * @return Result
     */
    @RequiresOperationLog(description = "商家添加电影操作")
    @PostMapping("addByStore")
    public Result addMovieByStore(@RequestBody MovieCinemaEntity movieCinemaEntity,
                                  @EmployeeId Long employeeId) {
        EmployeeEntity employeeEntity = employeeServiceImpl.getById(employeeId);
        // 如果是员工，不是商家
        if (EmployeeEntity.UserType.STAFF.name().equals(employeeEntity.getUserType().name())) {
            employeeId = employeeEntity.getParentId();
        }
        movieServiceImpl.addMovieByStore(movieCinemaEntity, employeeId);
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
     * 商家更新电影信息
     *
     * @param movieCinemaEntity 电影-影院实体
     * @return Result
     */
    @RequiresOperationLog(description = "商家更新电影操作")
    @PutMapping("updateByStore")
    public Result updateMovieByStore(@RequestBody MovieCinemaEntity movieCinemaEntity) {
        movieServiceImpl.updateMovieByStore(movieCinemaEntity);
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

    /**
     * 商家电影上映/下映
     *
     * @param map map
     * @return Result
     */
    @RequiresOperationLog(description = "商家电影上映/下映操作")
    @PostMapping("storeChangeStatus")
    public Result storeChangeStatus(@RequestBody Map<String, String> map) {
        Integer id = Integer.valueOf(map.get("id"));
        Boolean isShow = Boolean.valueOf(map.get("isShow"));
        movieServiceImpl.storeChangeStatus(id, isShow);
        return ResultFactory.buildSuccessResult();
    }

    /**
     * 商家删除电影
     *
     * @param id 电影-影院实体ID
     * @return Result
     */
    @RequiresOperationLog(description = "商家删除电影操作")
    @DeleteMapping("deleteByStore")
    public Result removeMovieByStore(Integer id) {
        movieServiceImpl.removeMovieByStore(id);
        return ResultFactory.buildSuccessResult();
    }
}
