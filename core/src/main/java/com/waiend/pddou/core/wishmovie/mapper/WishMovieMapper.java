package com.waiend.pddou.core.wishmovie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.wishmovie.entity.WishMovieEntity;
import com.waiend.pddou.core.wishmovie.vo.WatchedMovieVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface WishMovieMapper extends BaseMapper<WishMovieEntity> {

    /**
     * 获取个人评论的电影
     *
     * @param userId 用户ID
     * @return List<WatchedMovieVo>
     */
    List<WatchedMovieVo> selectIsWatchedMovieListByUserId(@Param("userId") Long userId);
}