package com.waiend.pddou.core.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.vo.CinemaVo;
import com.waiend.pddou.core.cinema.vo.SelectCinemaVo;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface CinemaMapper extends BaseMapper<CinemaEntity> {

    /**
     * 统计订单总记录数
     *
     * @param cinemaName 影院名称
     * @param isExamine 审核状态
     * @param isBlock 拉黑/未拉黑
     * @return int
     */
    int selectCountCinema(@Param("cinemaName") String cinemaName, @Param("isExamine") String isExamine,
                          @Param("isBlock") Integer isBlock);

    /**
     * 影院列表
     *
     * @param cinemaName 影院名称
     * @param isExamine 审核状态
     * @param isBlock 拉黑/未拉黑
     * @return List<CinemaVo>
     */
    List<CinemaVo> selectCinemaList(@Param("page") int page, @Param("limit") Integer limit,
                                    @Param("cinemaName") String cinemaName, @Param("isExamine") String isExamine,
                                    @Param("isBlock") Integer isBlock);

    /**
     * 根据城市获取影院列表
     *
     * @param city 城市
     * @return List<SelectCinemaVo>
     */
    List<SelectCinemaVo> selectCinemaByCity(@Param("city") String city);
}