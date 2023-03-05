package com.waiend.pddou.core.comment.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author end
 * @date 2023年03月04日 22:31
 */
@Data
public class WatchedMovieVo {

    private Integer id;

    private String poster;

    private String name;

    private BigDecimal userScore;

    private String content;
}
