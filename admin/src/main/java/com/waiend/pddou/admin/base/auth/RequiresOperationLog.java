package com.waiend.pddou.admin.base.auth;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * @author end
 * @date 2022年12月10日 17:06
 */
@Target(value = {METHOD})
@Retention(value = RUNTIME)
public @interface RequiresOperationLog {

    String description();
}
