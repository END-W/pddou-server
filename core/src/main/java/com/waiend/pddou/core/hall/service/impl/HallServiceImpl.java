package com.waiend.pddou.core.hall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.hall.mapper.HallMapper;
import com.waiend.pddou.core.hall.entity.HallEntity;
import com.waiend.pddou.core.hall.service.HallService;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class HallServiceImpl extends ServiceImpl<HallMapper, HallEntity> implements HallService {

    @Resource
    private HallMapper hallMapper;
}
