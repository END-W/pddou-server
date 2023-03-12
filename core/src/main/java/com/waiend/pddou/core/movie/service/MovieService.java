package com.waiend.pddou.core.movie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.cinema.vo.CinemaScheduleVo;
import com.waiend.pddou.core.movie.entity.MovieCinemaEntity;
import com.waiend.pddou.core.movie.entity.MovieEntity;

import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface MovieService extends IService<MovieEntity> {

    /**
     * 电影列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param name 电影名
     * @param language 语言
     * @param isShow 上映/下映
     * @return map
     */
    Map<String, Object> MovieList(Integer page, Integer limit, String name, String language, String isShow);

    /**
     * 商家电影列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param employeeId 员工ID
     * @param name 电影名
     * @param language 语言
     * @param isShow 上映/下映
     * @return map
     */
    Map<String, Object> MovieListByStore(Integer page, Integer limit, Long employeeId, String name, String language, String isShow);

    /**
     * 获取电影信息
     *
     * @param movieId 电影ID
     * @return MovieEntity
     */
    MovieEntity getMovie(Long movieId);

    /**
     * 商家获取电影信息
     * @param name 电影名
     * @return List<MovieEntity>
     */
    List<MovieEntity> getMovieByStore(String name);

    /**
     * 添加电影
     *
     * @param movieEntity 电影实体
     */
    void addMovie(MovieEntity movieEntity);

    /**
     * 商家添加电影
     *
     * @param movieCinemaEntity 电影-影院实体
     * @param employeeId 员工ID
     */
    void addMovieByStore(MovieCinemaEntity movieCinemaEntity, Long employeeId);

    /**
     * 更新电影信息
     *
     * @param movieEntity 电影实体
     */
    void updateMovie(MovieEntity movieEntity);

    /**
     * 商家更新电影信息
     *
     * @param movieCinemaEntity 电影-影院实体
     */
    void updateMovieByStore(MovieCinemaEntity movieCinemaEntity);

    /**
     * 电影上映/下映
     *
     * @param movieId 电影ID
     * @param isShow 上映/下映
     */
    void changeStatus(Long movieId, Boolean isShow);

    /**
     * 商家电影上映/下映
     *  @param id 电影-影院ID
     * @param isShow 上映/下映
     */
    void storeChangeStatus(Integer id, Boolean isShow);

    /**
     * 商家删除电影
     *
     * @param id 电影-影院实体ID
     */
    void removeMovieByStore(Integer id);

    /**
     * 获取电影详情
     *
     * @param movieId 电影ID
     * @return MovieEntity
     */
    MovieEntity getMovieDetail(Integer movieId);

    /**
     * 获取电影列表
     *
     * @return List<MovieEntity>
     */
    List<MovieEntity> getMovieList();

    /**
     * 根据名字模糊匹配电影
     *
     * @param movieName 电影名
     * @return List<MovieEntity>
     */
    List<MovieEntity> matchMovieByName(String movieName);

    /**
     * 获取当前电影的排片
     *
     * @param movieId 电影ID
     * @param city 城市
     * @return Map<String, List<CinemaScheduleVo>>
     */
    Map<String, List<CinemaScheduleVo>> getCurrentMovieSchedule(Integer movieId, String city);
}
