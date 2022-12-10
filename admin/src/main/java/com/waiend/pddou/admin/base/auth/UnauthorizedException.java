package com.waiend.pddou.admin.base.auth;

/**
 * @author end
 * @date 2022年12月10日 16:37
 */
public class UnauthorizedException extends RuntimeException {

    public UnauthorizedException() {
        super();
    }

    public UnauthorizedException(String message) {
        super(message);
    }

    public UnauthorizedException(String message, Throwable cause) {
        super(message, cause);
    }
}
