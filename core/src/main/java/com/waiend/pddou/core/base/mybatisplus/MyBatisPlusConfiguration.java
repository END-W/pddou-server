package com.waiend.pddou.core.base.mybatisplus;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author end
 * @date 2022年11月27日 21:14
 */
@Configuration
@MapperScan("com.waiend.pddou.core.*.mapper")
public class MyBatisPlusConfiguration {

    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }
}
