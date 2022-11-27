package com.waiend.pddou;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class AppReadyListener implements ApplicationListener<ApplicationReadyEvent> {

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        //ConfigurableApplicationContext applicationContext = event.getApplicationContext();
        log.info("PDDou-web 服务启动成功！");
    }
}