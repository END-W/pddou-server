package com.waiend.pddou.admin;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author end
 * @date 2022年11月27日 17:26
 */
@RestController
public class WelcomeController {

    @RequestMapping("hello")
    public String Hello() {
        return "hello PDDou-Admin";
    }
}
