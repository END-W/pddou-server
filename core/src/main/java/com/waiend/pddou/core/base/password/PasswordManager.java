package com.waiend.pddou.core.base.password;

/**
 * @author end
 * @date 2022年12月15日 18:25
 */
public interface PasswordManager {

    boolean match(String password, String plaintext);

    String hash(String password);
}
