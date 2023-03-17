package com.waiend.pddou.core.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.vo.CinemaVo;
import com.waiend.pddou.core.cinema.vo.MovieScheduleVo;
import com.waiend.pddou.core.cinema.vo.SelectCinemaVo;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface CinemaMapper extends BaseMapper<CinemaEntity> {

    /**
     * 统计订单总记录数
     *
     * @param cinemaName 影院名称
     * @param isExamine 审核状态
     * @param isBlock 拉黑/未拉黑
     * @return int
     */
    int selectCountCinema(@Param("cinemaName") String cinemaName, @Param("isExamine") String isExamine,
                          @Param("isBlock") Integer isBlock);

    /**
     * 影院列表
     *
     * @param cinemaName 影院名称
     * @param isExamine 审核状态
     * @param isBlock 拉黑/未拉黑
     * @return List<CinemaVo>
     */
    List<CinemaVo> selectCinemaList(@Param("page") int page, @Param("limit") Integer limit,
                                    @Param("cinemaName") String cinemaName, @Param("isExamine") String isExamine,
                                    @Param("isBlock") Integer isBlock);

    /**
     * 根据影院名和城市获取影院列表
     *
     * @param cinemaName 影院名
     * @param city 城市
     * @return List<SelectCinemaVo>
     */
    List<SelectCinemaVo> selectCinemaByCity(@Param("cinemaName") String cinemaName, @Param("city") String city);

    /**
     * 根据影院ID查询电影列表
     *
     * @param cinemaId 影院ID
     * @param now 当前时间
     * @param today 当前日期
     * @param after 7天后日期
     * @return List<MovieEntity>
     */
    List<MovieEntity> selectMovieListByCinemaId(@Param("cinemaId") Integer cinemaId, @Param("now") LocalDateTime now,
                                                @Param("today") LocalDate today, @Param("after") LocalDate after);

    /**
     * 根据影院ID查询当前电影的排片
     *
     * @param cinemaId 电影ID
     * @param now 当前时间
     * @param today 当前日期
     * @param after 7天后日期
     * @return List<MovieScheduleVo>
     */
    List<MovieScheduleVo> selectMovieScheduleByCinemaId(@Param("cinemaId") Integer cinemaId, @Param("now") LocalDateTime now,
                                                        @Param("today") LocalDate today, @Param("after") LocalDate after);
}