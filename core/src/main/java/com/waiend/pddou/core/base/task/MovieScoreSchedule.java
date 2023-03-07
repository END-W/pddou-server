package com.waiend.pddou.core.base.task;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.waiend.pddou.core.comment.entity.CommentEntity;
import com.waiend.pddou.core.comment.mapper.CommentMapper;
import com.waiend.pddou.core.common.util.DateUtils;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.mapper.MovieMapper;
import com.waiend.pddou.core.wishmovie.entity.WishMovieEntity;
import com.waiend.pddou.core.wishmovie.mapper.WishMovieMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

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

    @Resource
    private MovieMapper movieMapper;

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private WishMovieMapper wishMovieMapper;

    /**
     * 每天凌晨两点统计最近三个月的电影评分，想看人数
     */
    @Scheduled(cron = "0 0 2 * * ?")
    public void countMovieScore() {
        log.info("*****TimedTask-countMovieScoreBegin*****");
        LocalDate start = DateUtils.minusDateMonth(LocalDate.now(), 3);
        LocalDate end = DateUtils.addDateDays(LocalDate.now(), 7);

        List<MovieEntity> movieList = movieMapper.selectList(new QueryWrapper<MovieEntity>().lambda()
                                                 .between(MovieEntity::getPublicDate, start, end));

        if (!movieList.isEmpty()) {
            movieList.forEach(movie -> {
               try {
                   QueryWrapper<CommentEntity> queryWrapper = new QueryWrapper<>();
                   queryWrapper.select("avg(user_score) as user_score");
                   queryWrapper.eq("movie_id", movie.getId());

                   CommentEntity commentEntity = commentMapper.selectOne(queryWrapper);

                   Integer sum = wishMovieMapper.selectCount(new QueryWrapper<WishMovieEntity>().lambda()
                                                .eq(WishMovieEntity::getMovieId, movie.getId()));

                   if (Objects.nonNull(commentEntity) || sum != 0) {
                       MovieEntity movieEntity = new MovieEntity();
                       movieEntity.setWishNum(sum)
                                  .setScore(commentEntity.getUserScore())
                                  .setId(movie.getId());

                       movieMapper.updateById(movieEntity);
                   }
               } catch (Exception e) {
                   log.info(e.getMessage());
               }
            });
        }

        log.info("*****TimedTask-countMovieScoreEnd*****");
    }
}
