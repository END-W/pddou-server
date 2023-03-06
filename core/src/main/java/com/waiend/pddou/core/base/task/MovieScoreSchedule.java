package com.waiend.pddou.core.base.task;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

/**
 * 统计最近三个月的电影评分，想看人数
 *
 * @author end
 * @date 2023年03月06日 22:17
 */
@Slf4j
@Component
@EnableAsync
@EnableScheduling
public class MovieScoreSchedule {


}
