package com.waiend.pddou.core.base.oss;

import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConstructorBinding;

/**
 * @author end
 * @date 2023年01月02日 17:21
 */
@Getter
@ConfigurationProperties(prefix = "aliyun.oss")
@ConstructorBinding
public class AliyunOssProperties {

    private final String endpoint;

    private final String accessKeyId;

    private final String accessKeySecret;

    private final String bucketName;

    public AliyunOssProperties(String endpoint, String accessKeyId, String accessKeySecret, String bucketName) {
        this.endpoint = endpoint;
        this.accessKeyId = accessKeyId;
        this.accessKeySecret = accessKeySecret;
        this.bucketName = bucketName;
    }
}
