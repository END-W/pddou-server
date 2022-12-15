package com.waiend.pddou.core.base.password;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Component;

/**
 * @author end
 * @date 2022年12月15日 18:26
 */
@Component
public class BCryptPasswordManager implements PasswordManager {

    @Override
    public boolean match(String password, String plaintext) {
        return BCrypt.checkpw(plaintext, password);
    }

    @Override
    public String hash(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }
}
