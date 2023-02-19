package com.waiend.pddou.core.movie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.movie.entity.MovieEntity;

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
     * @param type 类型
     * @param publicDate 上映时间
     * @return map
     */
    Map<String, Object> MovieList(Integer page, Integer limit, String name, String language, String type, String publicDate);

    /**
     * 获取电影信息
     *
     * @param movieId 电影ID
     * @return MovieEntity
     */
    MovieEntity getMovie(Long movieId);

    /**
     * 添加电影
     *
     * @param movieEntity 电影实体
     */
    void addMovie(MovieEntity movieEntity);

    /**
     * 更新电影信息
     *
     * @param movieEntity 电影实体
     */
    void updateMovie(MovieEntity movieEntity);

    /**
     * 电影上映/下映
     *
     * @param movieId 电影ID
     * @param isShow 上映/下映
     */
    void changeStatus(Long movieId, Boolean isShow);
}
