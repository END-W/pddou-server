package com.waiend.pddou.core.comment.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author end
 * @date 2023年02月21日 21:40
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CommentVo {

    private Integer id;

    private Long userId;

    private Integer movieId;

    private String avatar;

    private String username;

    private String movieName;

    private Byte userScore;

    private String content;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime commentDate;

    private Integer supportNum;

    private String supportUser;

    private Boolean isPass;
}
