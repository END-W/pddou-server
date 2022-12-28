package com.waiend.pddou.admin;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author end
 * @date 2022年11月27日 17:26
 */
@RestController
public class WelcomeController {

    @GetMapping("hello")
    public String Hello() {
        return "hello PDDou-Admin";
    }
}
