package com.waiend.pddou.core.wishmovie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.wishmovie.entity.WishMovieEntity;

import java.util.List;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface WishMovieService extends IService<WishMovieEntity> {

    /**
     * 获取个人想看电影
     *
     * @param userId 用户ID
     * @return List<MovieEntity>
     */
    List<MovieEntity> getWishMovieByUserId(Long userId);

    /**
     * 判断用户是否想看电影
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     * @return boolean
     */
    boolean isWishMovie(Integer movieId, Long userId);

    /**
     * 想看电影
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     */
    void wishMovie(Integer movieId, Long userId);

    /**
     * 取消想看电影
     *
     * @param movieId 电影ID
     * @param userId 用户ID
     */
    void cancelWishMovie(Integer movieId, Long userId);
}
