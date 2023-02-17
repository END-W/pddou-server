package com.waiend.pddou.core.cinema.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.cinema.mapper.CinemaMapper;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.service.CinemaService;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class CinemaServiceImpl extends ServiceImpl<CinemaMapper, CinemaEntity> implements CinemaService {

    @Resource
    private CinemaMapper cinemaMapper;
}
