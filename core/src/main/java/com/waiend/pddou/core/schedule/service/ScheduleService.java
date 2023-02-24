package com.waiend.pddou.core.schedule.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.schedule.entity.ScheduleEntity;

import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface ScheduleService extends IService<ScheduleEntity> {

    /**
     * 商家场次列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param movieName 电影名
     * @param hallName 影厅名称
     * @param isShelf 上架/下架
     * @param employeeId 员工ID
     * @return map
     */
    Map<String, Object> scheduleListByStore(Integer page, Integer limit, String movieName, String hallName,
                                            Integer isShelf, Long employeeId);

    /**
     * 商家获取电影信息
     *
     * @param name 电影名
     * @param employeeId 员工ID
     * @return List<MovieEntity>
     */
    List<MovieEntity> getMovieByStore(String name, Long employeeId);

    /**
     * 商家添加场次
     *
     * @param scheduleEntity 场次实体
     * @param employeeId 员工ID
     */
    void addScheduleByStore(ScheduleEntity scheduleEntity, Long employeeId);

    /**
     * 商家删除场次
     *
     * @param scheduleId 场次ID
     */
    void removeScheduleByStore(Integer scheduleId);
}
