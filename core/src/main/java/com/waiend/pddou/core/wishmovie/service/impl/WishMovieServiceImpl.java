package com.waiend.pddou.core.wishmovie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.mapper.MovieMapper;
import com.waiend.pddou.core.wishmovie.vo.WatchedMovieVo;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.wishmovie.mapper.WishMovieMapper;
import com.waiend.pddou.core.wishmovie.entity.WishMovieEntity;
import com.waiend.pddou.core.wishmovie.service.WishMovieService;

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
                                                .eq(WishMovieEntity::getUserId, userId)).stream()
                                                .map(WishMovieEntity::getMovieId)
                                                .collect(Collectors.toList());

        if (movieIds.isEmpty()) {
            return null;
        }

        return movieMapper.selectBatchIds(movieIds);
    }

    @Override
    public List<WatchedMovieVo> getIsWatchedMovieByUserId(Long userId) {
        return wishMovieMapper.selectIsWatchedMovieListByUserId(userId);
    }
}
