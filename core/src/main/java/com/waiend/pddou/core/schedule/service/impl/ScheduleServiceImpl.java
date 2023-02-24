package com.waiend.pddou.core.schedule.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.mapper.CinemaMapper;
import com.waiend.pddou.core.movie.entity.MovieCinemaEntity;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.mapper.MovieCinemaMapper;
import com.waiend.pddou.core.movie.mapper.MovieMapper;
import com.waiend.pddou.core.schedule.vo.ScheduleVo;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.schedule.entity.ScheduleEntity;
import com.waiend.pddou.core.schedule.mapper.ScheduleMapper;
import com.waiend.pddou.core.schedule.service.ScheduleService;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class ScheduleServiceImpl extends ServiceImpl<ScheduleMapper, ScheduleEntity> implements ScheduleService {

    @Resource
    private ScheduleMapper scheduleMapper;

    @Resource
    private CinemaMapper cinemaMapper;

    @Resource
    private MovieCinemaMapper movieCinemaMapper;

    @Resource
    private MovieMapper movieMapper;

    @Override
    public Map<String, Object> scheduleListByStore(Integer page, Integer limit, String movieName, String hallName, Integer isShelf, Long employeeId) {
        Map<String, Object> map = new HashMap<>();

        LocalDateTime now = LocalDateTime.now();

        Long cinemaId = cinemaMapper.selectOne(new QueryWrapper<CinemaEntity>().lambda()
                                    .eq(CinemaEntity::getEmployeeId, employeeId)).getId();
        int total = scheduleMapper.selectCountScheduleByStore(cinemaId, movieName, hallName, isShelf, now);
        List<ScheduleVo> scheduleList = scheduleMapper.selectScheduleListByStore((page - 1) * limit, limit, cinemaId, movieName, hallName, isShelf, now);

        map.put("list", scheduleList);
        map.put("total", total);

        return map;
    }

    @Override
    public List<MovieEntity> getMovieByStore(String name, Long employeeId) {
        Long cinemaId = cinemaMapper.selectOne(new QueryWrapper<CinemaEntity>().lambda()
                                    .eq(CinemaEntity::getEmployeeId, employeeId)).getId();

        List<Long> movieIds = movieCinemaMapper.selectList(new QueryWrapper<MovieCinemaEntity>().lambda()
                                                .eq(MovieCinemaEntity::getIsShow, 1)
                                                .eq(MovieCinemaEntity::getCinemaId, cinemaId))
                                                .stream().map(MovieCinemaEntity::getMovieId)
                                                .collect(Collectors.toList());

        return movieMapper.selectList(new QueryWrapper<MovieEntity>().lambda()
                                                                     .in(MovieEntity::getId, movieIds)
                                                                     .like(MovieEntity::getName, name));
    }

    @Override
    public void addScheduleByStore(ScheduleEntity scheduleEntity, Long employeeId) {
        Long cinemaId = cinemaMapper.selectOne(new QueryWrapper<CinemaEntity>().lambda()
                                    .eq(CinemaEntity::getEmployeeId, employeeId)).getId();
        scheduleEntity.setCinemaId(Math.toIntExact(cinemaId));

        scheduleMapper.insert(scheduleEntity);
    }

    @Override
    public void removeScheduleByStore(Integer scheduleId) {
        scheduleMapper.deleteById(scheduleId);
    }
}
