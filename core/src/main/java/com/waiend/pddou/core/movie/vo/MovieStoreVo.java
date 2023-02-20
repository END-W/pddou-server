package com.waiend.pddou.core.movie.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @author end
 * @date 2023年02月20日 17:06
 */
@Data
public class MovieStoreVo {

    private Integer id;

    private String name;

    private String director;

    private String actor;

    private String movieLong;

    private String language;

    private String type;

    private String publicDate;

    private BigDecimal score;

    private Boolean isShow;

    private BigDecimal price;
}
