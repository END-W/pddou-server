package com.waiend.pddou.core.cinema.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.mapper.CinemaMapper;
import com.waiend.pddou.core.cinema.service.CinemaService;
import com.waiend.pddou.core.cinema.vo.CinemaVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class CinemaServiceImpl extends ServiceImpl<CinemaMapper, CinemaEntity> implements CinemaService {

    @Resource
    private CinemaMapper cinemaMapper;

    @Override
    public Map<String, Object> cinemaList(Integer page, Integer limit, String cinemaName, String isExamine, Integer isBlock) {
        Map<String, Object> map = new HashMap<>();

        int total = cinemaMapper.selectCountCinema(cinemaName, isExamine, isBlock);
        List<CinemaVo> cinemaList = cinemaMapper.selectCinemaList((page - 1) * limit, limit, cinemaName, isExamine, isBlock);

        map.put("list", cinemaList);
        map.put("total", total);

        return map;
    }

    @Override
    public CinemaVo getCinema(Integer cinemaId) {
        CinemaEntity cinemaEntity = cinemaMapper.selectById(cinemaId);

        return BeanUtil.copyProperties(cinemaEntity, CinemaVo.class);
    }

    @Override
    public void examineCinema(Long id, String isExamine, Long employeeId) {
        CinemaEntity cinemaEntity = new CinemaEntity();
        cinemaEntity.setId(id);
        if (CinemaEntity.ExamineType.ON_ACTIVITY.name().equals(isExamine)) {
            cinemaEntity.setIsExamine(CinemaEntity.ExamineType.ON_ACTIVITY);
        } else if (CinemaEntity.ExamineType.FAIL.name().equals(isExamine)) {
            cinemaEntity.setIsExamine(CinemaEntity.ExamineType.FAIL);
        }
        cinemaEntity.setCheckEmployeeId(employeeId);
        cinemaEntity.setCheckTime(LocalDateTime.now());

        cinemaMapper.updateById(cinemaEntity);
    }

    @Override
    public void blockCinema(Long cinemaId) {
        CinemaEntity cinemaEntity = new CinemaEntity();
        cinemaEntity.setId(cinemaId);
        cinemaEntity.setIsBlock(true);

        cinemaMapper.updateById(cinemaEntity);
    }
}
