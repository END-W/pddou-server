package com.waiend.pddou.core.schedule.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.schedule.entity.ScheduleEntity;
import com.waiend.pddou.core.schedule.mapper.ScheduleMapper;
import com.waiend.pddou.core.schedule.service.ScheduleService;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class ScheduleServiceImpl extends ServiceImpl<ScheduleMapper, ScheduleEntity> implements ScheduleService {

    @Resource
    private ScheduleMapper scheduleMapper;

}
