package com.waiend.pddou.core.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.vo.CinemaVo;

import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface CinemaService extends IService<CinemaEntity> {

    /**
     * 影院列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param cinemaName 影院名
     * @param isExamine 审核状态
     * @param isBlock 拉黑/未拉黑
     * @return map
     */
    Map<String, Object> cinemaList(Integer page, Integer limit, String cinemaName, String isExamine, Integer isBlock);

    /**
     * 查询影院信息
     *
     * @param cinemaId 影院ID
     * @return CinemaVo
     */
    CinemaVo getCinema(Integer cinemaId);

    /**
     * 添加影院
     *
     * @param cinemaEntity 影院实体
     */
    void addCinema(CinemaEntity cinemaEntity);

    /**
     * 编辑影院
     *
     * @param cinemaEntity 影院实体
     */
    void updateCinema(CinemaEntity cinemaEntity);

    /**
     * 审核影院
     *
     * @param id 影院ID
     * @param isExamine 审核状态
     * @param employeeId 员工ID
     */
    void examineCinema(Long id, String isExamine, Long employeeId);

    /**
     * 拉黑影院
     *
     * @param cinemaId 影院ID
     */
    void blockCinema(Long cinemaId);
}
