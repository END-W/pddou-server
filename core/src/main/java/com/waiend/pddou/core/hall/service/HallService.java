package com.waiend.pddou.core.hall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waiend.pddou.core.hall.entity.HallEntity;

import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
public interface HallService extends IService<HallEntity> {

    /**
     * 商家影厅列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param name 影厅名称
     * @param employeeId 员工ID
     * @return map
     */
    Map<String, Object> hallListByStore(Integer page, Integer limit, String name, Long employeeId);

    /**
     * 商家获取影厅信息
     *
     * @param employeeId 员工ID
     * @return List<HallEntity>
     */
    List<HallEntity> getHallByStore(Long employeeId);

    /**
     * 商家添加影厅
     *
     * @param hallEntity 影厅实体
     * @param employeeId 员工ID
     */
    void addHallByStore(HallEntity hallEntity, Long employeeId);

    /**
     * 商家更新影厅信息
     *
     * @param hallEntity 影厅实体
     */
    void updateHallByStore(HallEntity hallEntity);

    /**
     * 商家删除影厅
     *
     * @param id 影厅ID
     */
    void removeHallByStore(Integer id);
}
