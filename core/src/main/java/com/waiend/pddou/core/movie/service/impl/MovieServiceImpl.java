package com.waiend.pddou.core.movie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.movie.service.MovieService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.movie.entity.MovieEntity;
import com.waiend.pddou.core.movie.mapper.MovieMapper;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class MovieServiceImpl extends ServiceImpl<MovieMapper, MovieEntity> implements MovieService {

    @Resource
    private MovieMapper movieMapper;
}
