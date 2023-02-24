package com.waiend.pddou.core.schedule.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.schedule.entity.ScheduleEntity;
import com.waiend.pddou.core.schedule.vo.ScheduleVo;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface ScheduleMapper extends BaseMapper<ScheduleEntity> {

    int selectCountScheduleByStore(@Param("cinemaId") Long cinemaId, @Param("movieName") String movieName,
                                   @Param("hallName") String hallName, @Param("isShelf") Integer isShelf,
                                   @Param("now") LocalDateTime now);

    List<ScheduleVo> selectScheduleListByStore(@Param("page") int page, @Param("limit") Integer limit,
                                               @Param("cinemaId") Long cinemaId, @Param("movieName") String movieName,
                                               @Param("hallName") String hallName, @Param("isShelf") Integer isShelf,
                                               @Param("now") LocalDateTime now);
}