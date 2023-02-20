package com.waiend.pddou.core.hall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Data
@Accessors(chain = true)
@TableName("pddou_hall")
public class HallEntity {

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
    * 影厅名称
    */
    private String name;

    /**
     * 影院ID
     */
    @TableField(value = "cinema_id")
    private Long cinemaId;
}