package com.waiend.pddou.core.hall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.mapper.CinemaMapper;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.hall.mapper.HallMapper;
import com.waiend.pddou.core.hall.entity.HallEntity;
import com.waiend.pddou.core.hall.service.HallService;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class HallServiceImpl extends ServiceImpl<HallMapper, HallEntity> implements HallService {

    @Resource
    private HallMapper hallMapper;

    @Resource
    private CinemaMapper cinemaMapper;

    @Override
    public Map<String, Object> hallListByStore(Integer page, Integer limit, String name) {
        Map<String, Object> map = new HashMap<>();
        Page<HallEntity> pages = new Page<>(page, limit);

        QueryWrapper<HallEntity> queryWrapper = new QueryWrapper<>();

        if (StringUtils.hasText(name)) {
            queryWrapper.like("name", name);
        }

        hallMapper.selectPage(pages, queryWrapper);

        map.put("list", pages.getRecords());
        map.put("total", pages.getTotal());

        return map;
    }

    @Override
    public void addHallByStore(HallEntity hallEntity, Long employeeId) {
        Long cinemaId = cinemaMapper.selectOne(new QueryWrapper<CinemaEntity>().lambda()
                                    .eq(CinemaEntity::getEmployeeId, employeeId)).getId();
        hallEntity.setCinemaId(cinemaId);

        hallMapper.insert(hallEntity);
    }

    @Override
    public void updateHallByStore(HallEntity hallEntity) {
        hallMapper.updateById(hallEntity);
    }

    @Override
    public void removeHallByStore(Integer id) {
        hallMapper.deleteById(id);
    }
}
