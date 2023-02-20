package com.waiend.pddou.core.movie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.vo.MovieStoreVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MovieMapper extends BaseMapper<MovieEntity> {

    /**
     * 统计商家电影总记录数
     *
     * @param cinemaId 电影ID
     * @param name 电影名
     * @param language 语言
     * @param isShow 上映/下映
     * @return int
     */
    int selectCountMoviesByStore(@Param("cinemaId") Long cinemaId, @Param("name") String name,
                                 @Param("language") String language, @Param("isShow") String isShow);

    /**
     * 查询商家电影列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param cinemaId 电影ID
     * @param name 电影名
     * @param language 语言
     * @param isShow 上映/下映
     * @return List<MovieStoreVo>
     */
    List<MovieStoreVo> selectMoviesByStore(@Param("page") int page, @Param("limit") Integer limit, @Param("cinemaId") Long cinemaId,
                                           @Param("name") String name, @Param("language") String language, @Param("isShow") String isShow);
}