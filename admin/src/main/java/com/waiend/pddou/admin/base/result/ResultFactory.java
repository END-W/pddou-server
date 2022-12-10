package com.waiend.pddou.admin.base.result;

/**
 * @author end
 * @date 2022年12月09日 22:27
 */
public class ResultFactory {

    private static <R> Result buildResult(ResultStatus resultStatus, String message, R data, long timestamp) {
        Result<R> result = new Result<>();
        result.setStatus(resultStatus.getStatus());
        result.setMessage(message);
        result.setData(data);
        result.setTimestamp(timestamp);
        return result;
    }

    public static Result buildSuccessResult(String message) {
        return buildResult(ResultStatus.SUCCESS, message, null, System.currentTimeMillis());
    }

    public static Result buildSuccessResult(Object data) {
        return buildResult(ResultStatus.SUCCESS, "success", data, System.currentTimeMillis());
    }

    public static Result buildSuccessResult(String message, Object data) {
        return buildResult(ResultStatus.SUCCESS, message, data, System.currentTimeMillis());
    }

    public static Result buildErrorResult() {
        return buildResult(ResultStatus.FAIL, "error", null, System.currentTimeMillis());
    }

    public static Result buildErrorResult(String message) {
        return buildResult(ResultStatus.FAIL, message, null, System.currentTimeMillis());
    }

    public static Result buildErrorResult(ResultStatus resultStatus, String message) {
        return buildResult(resultStatus, message, null, System.currentTimeMillis());
    }
}
