package com.waiend.pddou.core.movie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.mapper.MovieMapper;
import com.waiend.pddou.core.movie.service.MovieService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class MovieServiceImpl extends ServiceImpl<MovieMapper, MovieEntity> implements MovieService {

    @Resource
    private MovieMapper movieMapper;

    @Override
    public Map<String, Object> MovieList(Integer page, Integer limit, String name, String language, String type, String publicDate) {
        Map<String, Object> map = new HashMap<>();
        Page<MovieEntity> pages = new Page<>(page, limit);

        QueryWrapper<MovieEntity> queryWrapper = new QueryWrapper<>();

        if (StringUtils.hasText(language)) {
            queryWrapper.eq("language", language);
        }

        if (StringUtils.hasText(type)) {
            queryWrapper.eq("type", type);
        }

        if (StringUtils.hasText(publicDate)) {
            queryWrapper.eq("public_date", publicDate);
        }

        if (StringUtils.hasText(name)) {
            queryWrapper.like("name", name);
        }

        queryWrapper.orderByDesc("public_date");

        movieMapper.selectPage(pages, queryWrapper);

        map.put("list", pages.getRecords());
        map.put("total", pages.getTotal());

        return map;
    }

    @Override
    public MovieEntity getMovie(Long movieId) {
        return movieMapper.selectById(movieId);
    }

    @Override
    public void addMovie(MovieEntity movieEntity) {
        movieMapper.insert(movieEntity);
    }

    @Override
    public void updateMovie(MovieEntity movieEntity) {
        movieMapper.updateById(movieEntity);
    }

    @Override
    public void changeStatus(Long movieId, Boolean isShow) {
        MovieEntity movieEntity = new MovieEntity();
        movieEntity.setId(movieId);
        movieEntity.setIsShow(isShow);

        movieMapper.updateById(movieEntity);
    }
}
