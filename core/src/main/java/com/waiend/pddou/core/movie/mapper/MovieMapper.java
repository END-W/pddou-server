package com.waiend.pddou.core.movie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.cinema.vo.CinemaScheduleVo;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.vo.MovieStoreVo;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface MovieMapper extends BaseMapper<MovieEntity> {

    /**
     * 统计商家电影总记录数
     *
     * @param cinemaId 影院ID
     * @param name 电影名
     * @param language 语言
     * @param isShow 上映/下映
     * @return int
     */
    int selectCountMovieByStore(@Param("cinemaId") Long cinemaId, @Param("name") String name,
                                @Param("language") String language, @Param("isShow") String isShow);

    /**
     * 查询商家电影列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param cinemaId 影院ID
     * @param name 电影名
     * @param language 语言
     * @param isShow 上映/下映
     * @return List<MovieStoreVo>
     */
    List<MovieStoreVo> selectMovieListByStore(@Param("page") int page, @Param("limit") Integer limit, @Param("cinemaId") Long cinemaId,
                                              @Param("name") String name, @Param("language") String language, @Param("isShow") String isShow);

    /**
     * 根据电影ID获取当前电影的排片
     *
     * @param movieId 电影ID
     * @param city 城市
     * @param now 当前时间
     * @param today 当前日期
     * @param after 7天后日期
     * @return List<CinemaScheduleVo>
     */
    List<CinemaScheduleVo> selectCinemaScheduleByMovieId(@Param("movieId") Integer movieId, @Param("city") String city,
                                                         @Param("now") LocalDateTime now, @Param("today") LocalDate today,
                                                         @Param("after") LocalDate after);
}