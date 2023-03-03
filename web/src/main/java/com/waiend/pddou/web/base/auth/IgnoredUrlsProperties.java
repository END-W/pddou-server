package com.waiend.pddou.web.base.auth;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * 忽略token地址配置
 *
 * @author end
 * @date 2022年12月09日 21:53
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "ignored")
public class IgnoredUrlsProperties {

    // 忽略权限列表
    private List<String> urls = new ArrayList<>();
}