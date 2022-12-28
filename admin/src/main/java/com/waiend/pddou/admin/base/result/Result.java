package com.waiend.pddou.admin.base.result;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author end
 * @date 2022年12月09日 22:25
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Result<T>  {

    private int code;

    private String message;

    private T data;

    private long timestamp;
}
