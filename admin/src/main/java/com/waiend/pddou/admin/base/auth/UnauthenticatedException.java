package com.waiend.pddou.admin.base.auth;

/**
 * @author end
 * @date 2022年12月10日 16:35
 */
public class UnauthenticatedException extends RuntimeException {

    public UnauthenticatedException() {
        super();
    }

    public UnauthenticatedException(String message) {
        super(message);
    }

    public UnauthenticatedException(String message, Throwable cause) {
        super(message, cause);
    }
}
