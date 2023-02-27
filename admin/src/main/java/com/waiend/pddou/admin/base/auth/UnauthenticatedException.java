package com.waiend.pddou.admin.base.auth;

import com.waiend.pddou.core.base.result.ResultStatus;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author end
 * @date 2022年12月10日 16:35
 */
@EqualsAndHashCode(callSuper = true)
@Data
public
class UnauthenticatedException extends RuntimeException {

    private String message;

    private ResultStatus code = ResultStatus.UNAUTHENTICATED;

    UnauthenticatedException(String message) {
        super(message);
        this.message = message;
    }
}
