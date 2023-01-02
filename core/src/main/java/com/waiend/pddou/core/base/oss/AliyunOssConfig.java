package com.waiend.pddou.core.base.oss;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;

/**
 * @author end
 * @date 2023年01月02日 17:31
 */
@Configuration
@EnableConfigurationProperties(AliyunOssProperties.class)
public class AliyunOssConfig {

    @Resource
    private AliyunOssProperties aliyunOssProperties;

    @Bean
    public OSS oss() {
        return new OSSClientBuilder().build(
                aliyunOssProperties.getEndpoint(),
                aliyunOssProperties.getAccessKeyId(),
                aliyunOssProperties.getAccessKeySecret()
        );
    }
}
