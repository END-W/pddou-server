package com.waiend.pddou.core.wishmovie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.mapper.MovieMapper;
import com.waiend.pddou.core.wishmovie.entity.WishMovieEntity;
import com.waiend.pddou.core.wishmovie.mapper.WishMovieMapper;
import com.waiend.pddou.core.wishmovie.service.WishMovieService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class WishMovieServiceImpl extends ServiceImpl<WishMovieMapper, WishMovieEntity> implements WishMovieService {

    @Resource
    private WishMovieMapper wishMovieMapper;

    @Resource
    private MovieMapper movieMapper;

    @Override
    public List<MovieEntity> getWishMovieByUserId(Long userId) {
        List<Integer> movieIds = wishMovieMapper.selectList(new QueryWrapper<WishMovieEntity>().lambda()
                                                .eq(WishMovieEntity::getUserId, userId)
                                                .eq(WishMovieEntity::getIsDelete, 0)).stream()
                                                .map(WishMovieEntity::getMovieId)
                                                .collect(Collectors.toList());

        if (movieIds.isEmpty()) {
            return null;
        }

        return movieMapper.selectList(new QueryWrapper<MovieEntity>().lambda()
                                            .in(MovieEntity::getId, movieIds)
                                            .orderByDesc(MovieEntity::getPublicDate));
    }

    @Override
    public boolean isWishMovie(Integer movieId, Long userId) {
        WishMovieEntity wishMovieEntity = wishMovieMapper.selectOne(new QueryWrapper<WishMovieEntity>().lambda()
                                                         .eq(WishMovieEntity::getMovieId, movieId)
                                                         .eq(WishMovieEntity::getUserId, userId)
                                                         .eq(WishMovieEntity::getIsDelete, 0));
        return !Objects.isNull(wishMovieEntity);

    }

    @Override
    public void wishMovie(Integer movieId, Long userId) {
        WishMovieEntity wishMovieEntity = new WishMovieEntity();
        wishMovieEntity.setIsDelete(false);

        int i = wishMovieMapper.update(wishMovieEntity, new QueryWrapper<WishMovieEntity>().lambda()
                                                        .eq(WishMovieEntity::getMovieId, movieId)
                                                        .eq(WishMovieEntity::getUserId, userId));

        if (i == 0) {
            wishMovieEntity.setMovieId(movieId)
                           .setUserId(userId);

            wishMovieMapper.insert(wishMovieEntity);
        }
    }

    @Override
    public void cancelWishMovie(Integer movieId, Long userId) {
        WishMovieEntity wishMovieEntity = new WishMovieEntity();
        wishMovieEntity.setIsDelete(true);

        wishMovieMapper.update(wishMovieEntity, new QueryWrapper<WishMovieEntity>().lambda()
                                                    .eq(WishMovieEntity::getMovieId, movieId)
                                                    .eq(WishMovieEntity::getUserId, userId));
    }
}
