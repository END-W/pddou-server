package com.waiend.pddou.admin.base.exception;

import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.admin.base.result.ResultStatus;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.io.IOException;

/**
 * @author end
 * @date 2022年12月09日 22:12
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(PDDouException.class)
    public Result handleRRException(PDDouException e) {
        log.error(e.getMessage(), e);
        return ResultFactory.buildErrorResult(e.getCode(), e.getMessage());
    }

    @ExceptionHandler(DuplicateKeyException.class)
    public Result handleDuplicateKeyException(DuplicateKeyException e) {
        log.error(e.getMessage(), e);
        return ResultFactory.buildErrorResult(ResultStatus.INTERNAL_SERVER_ERROR, "数据库中已存在该记录");
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public Result handleHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        log.error(e.getMessage(), e);
        return ResultFactory.buildErrorResult(ResultStatus.METHOD_NOT_ALLOWED, "不支持该请求方式，请区分POST、GET等请求方式是否正确");
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public Result handleIllegalArgumentException(IllegalArgumentException e) {
        log.error(e.getMessage(), e);
        return ResultFactory.buildErrorResult(ResultStatus.BAD_REQUEST, e.getMessage());
    }

    @ExceptionHandler(IOException.class)
    public Result handleIOException(IOException e) {
        log.error(e.getMessage(), e);
        return ResultFactory.buildErrorResult(ResultStatus.INTERNAL_SERVER_ERROR, "网络异常");
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    public Result handleMissingServletRequestParameterException(MissingServletRequestParameterException e) {
        log.error(e.getMessage(), e);
        return ResultFactory.buildErrorResult(ResultStatus.BAD_REQUEST, "缺少 " + e.getParameterName() + " 参数");
    }

    @ExceptionHandler(Exception.class)
    public Result handleException(Exception e) {
        log.error(e.getMessage(), e);
        return ResultFactory.buildErrorResult(ResultStatus.INTERNAL_SERVER_ERROR, "系统繁忙，请稍后再试");
    }
}
