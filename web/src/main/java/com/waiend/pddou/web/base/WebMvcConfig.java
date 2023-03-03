package com.waiend.pddou.web.base;

import com.waiend.pddou.web.base.auth.AuthenticationInterceptor;
import com.waiend.pddou.web.base.auth.IgnoredUrlsProperties;
import com.waiend.pddou.web.base.resolver.UserIdArgumentResolver;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author end
 * @date 2022年12月09日 21:44
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Resource
    private AuthenticationInterceptor authenticationInterceptor;

    @Resource
    private UserIdArgumentResolver userIdArgumentResolver;

    @Resource
    private IgnoredUrlsProperties ignoredUrlsProperties;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticationInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(ignoredUrlsProperties.getUrls());
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(userIdArgumentResolver);
    }


}