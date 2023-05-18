package com.waiend.pddou.core.system.service;

import com.waiend.pddou.core.system.vo.BoxOfficeMovieTypeVo;
import com.waiend.pddou.core.system.vo.BoxOfficeTop10Vo;
import com.waiend.pddou.core.system.vo.BoxOfficeVo;

import java.util.List;

/**
 * @author end
 * @date 2023年05月17日 23:56
 */
public interface BoxOfficeService {

    /**
     * 获取票房数据
     *
     * @param role 员工角色
     * @param employeeId 员工ID
     * @return List<BoxOfficeVo>
     */
    List<BoxOfficeVo> getBoxOfficeData(String role, Long employeeId);

    /**
     * 根据电影类型获取票房数据
     *
     * @param role 员工角色
     * @param employeeId 员工ID
     * @return List<BoxOfficeMovieTypeVo>
     */
    List<BoxOfficeMovieTypeVo> getBoxOfficeDataByMovieType(String role, Long employeeId);

    /**
     * 获取票房前十
     *
     * @param role 员工角色
     * @param employeeId 员工ID
     * @return List<BoxOfficeTop10Vo>
     */
    List<BoxOfficeTop10Vo> getBoxOfficeTop10(String role, Long employeeId);
}
