package com.waiend.pddou.admin.base.exception;

import com.waiend.pddou.admin.base.result.ResultStatus;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 自定义异常处理
 *
 * @author end
 * @date 2022年12月09日 22:14
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class PDDouException extends RuntimeException {

    private String message;

    private ResultStatus code = ResultStatus.FAIL;

    public PDDouException(String message) {
        super(message);
        this.message = message;
    }

    public PDDouException(String message, Throwable e) {
        super(message, e);
        this.message = message;
    }

    public PDDouException(String message, ResultStatus code) {
        super(message);
        this.message = message;
        this.code = code;
    }

    public PDDouException(String message, ResultStatus code, Throwable e) {
        super(message, e);
        this.message = message;
        this.code = code;
    }

}
