package com.waiend.pddou.admin.upload;

import com.aliyun.oss.OSS;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.admin.base.result.ResultFactory;
import com.waiend.pddou.core.common.util.PathUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Objects;

/**
 * @author end
 * @date 2023年02月19日 14:23
 */
@RestController
@RequestMapping("admin/upload")
public class UploadController {

    @Value("${aliyun.oss.bucketName}")
    private String bucketName;

    @Value("${aliyun.oss.url}")
    private String url;

    @Resource
    private OSS oss;

    @PostMapping("image")
    public Result uploadImage(@RequestParam("file") MultipartFile file) throws IOException {
        String fileName = "movie/" + PathUtils.generateFilePath(Objects.requireNonNull(file.getOriginalFilename()));
        oss.putObject(bucketName, fileName, file.getInputStream());
        return ResultFactory.buildSuccessResult(url + fileName);
    }
}
