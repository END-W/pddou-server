package com.waiend.pddou.core.movie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.mapper.CinemaMapper;
import com.waiend.pddou.core.movie.entity.MovieCinemaEntity;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.mapper.MovieCinemaMapper;
import com.waiend.pddou.core.movie.mapper.MovieMapper;
import com.waiend.pddou.core.movie.service.MovieService;
import com.waiend.pddou.core.movie.vo.MovieStoreVo;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class MovieServiceImpl extends ServiceImpl<MovieMapper, MovieEntity> implements MovieService {

    @Resource
    private MovieMapper movieMapper;

    @Resource
    private MovieCinemaMapper movieCinemaMapper;

    @Resource
    private CinemaMapper cinemaMapper;

    @Override
    public Map<String, Object> MovieList(Integer page, Integer limit, String name, String language, String isShow) {
        Map<String, Object> map = new HashMap<>();
        Page<MovieEntity> pages = new Page<>(page, limit);

        QueryWrapper<MovieEntity> queryWrapper = new QueryWrapper<>();

        if (StringUtils.hasText(language)) {
            queryWrapper.eq("language", language);
        }

        if (StringUtils.hasText(isShow)) {
            queryWrapper.eq("is_show", isShow);
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
    public Map<String, Object> MovieListByStore(Integer page, Integer limit, Long employeeId, String name, String language, String isShow) {
        Map<String, Object> map = new HashMap<>();

        Long cinemaId = cinemaMapper.selectOne(new QueryWrapper<CinemaEntity>().lambda()
                                    .eq(CinemaEntity::getEmployeeId, employeeId)).getId();
        int total = movieMapper.selectCountMovieByStore(cinemaId, name, language, isShow);
        List<MovieStoreVo> movieList = movieMapper.selectMovieListByStore((page - 1) * limit, limit, cinemaId, name, language, isShow);

        map.put("list", movieList);
        map.put("total", total);

        return map;
    }

    @Override
    public MovieEntity getMovie(Long movieId) {
        return movieMapper.selectById(movieId);
    }

    @Override
    public List<MovieEntity> getMovieByStore(String name) {
        return movieMapper.selectList(new QueryWrapper<MovieEntity>().lambda()
                                        .like(MovieEntity::getName, name));
    }

    @Override
    public void addMovie(MovieEntity movieEntity) {
        movieMapper.insert(movieEntity);
    }

    @Override
    public void addMovieByStore(MovieCinemaEntity movieCinemaEntity, Long employeeId) {
        Long cinemaId = cinemaMapper.selectOne(new QueryWrapper<CinemaEntity>().lambda()
                .eq(CinemaEntity::getEmployeeId, employeeId)).getId();
        movieCinemaEntity.setCinemaId(cinemaId);

        movieCinemaMapper.insert(movieCinemaEntity);
    }

    @Override
    public void updateMovie(MovieEntity movieEntity) {
        movieMapper.updateById(movieEntity);
    }

    @Override
    public void updateMovieByStore(MovieCinemaEntity movieCinemaEntity) {
        movieCinemaMapper.updateById(movieCinemaEntity);
    }

    @Override
    public void changeStatus(Long movieId, Boolean isShow) {
        MovieEntity movieEntity = new MovieEntity();
        movieEntity.setId(movieId);
        movieEntity.setIsShow(isShow);

        movieMapper.updateById(movieEntity);
    }

    @Override
    public void storeChangeStatus(Integer id, Boolean isShow) {
        MovieCinemaEntity movieCinemaEntity = new MovieCinemaEntity();
        movieCinemaEntity.setId(id);
        movieCinemaEntity.setIsShow(isShow);

        movieCinemaMapper.updateById(movieCinemaEntity);
    }

    @Override
    public void removeMovieByStore(Integer id) {
        movieCinemaMapper.deleteById(id);
    }
}
