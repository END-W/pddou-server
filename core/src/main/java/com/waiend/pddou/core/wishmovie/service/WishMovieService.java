package com.waiend.pddou.core.wishmovie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.wishmovie.entity.WishMovieEntity;
import com.waiend.pddou.core.wishmovie.vo.WatchedMovieVo;

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
     * 获取个人评论的电影
     *
     * @param userId 用户ID
     * @return List<WatchedMovieVo>
     */
    List<WatchedMovieVo> getIsWatchedMovieByUserId(Long userId);
}
