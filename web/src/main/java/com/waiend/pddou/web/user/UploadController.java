package com.waiend.pddou.web.user;

import com.aliyun.oss.OSS;
import com.waiend.pddou.core.base.result.Result;
import com.waiend.pddou.core.common.util.PathUtils;
import com.waiend.pddou.core.user.entity.UserEntity;
import com.waiend.pddou.core.user.service.UserService;
import com.waiend.pddou.web.base.resolver.UserId;
import com.waiend.pddou.web.base.result.ResultFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;

/**
 * @author end
 * @date 2023年03月04日 17:47
 */
@RestController
@RequestMapping("upload")
public class UploadController {

    @Value("${aliyun.oss.bucketName}")
    private String bucketName;

    @Value("${aliyun.oss.url}")
    private String url;

    @Resource
    private OSS oss;

    @Resource
    private UserService userServiceImpl;

    /**
     * 上传用户头像
     *
     * @param file 文件
     * @param userId 用户ID
     * @return Result
     */
    @PostMapping("upLoadImg")
    public Result upLoadImg(@RequestParam("file") MultipartFile file, @UserId Long userId) throws IOException {
        String fileName = "avatar/" + PathUtils.generateFilePath(Objects.requireNonNull(file.getOriginalFilename()));
        oss.putObject(bucketName, fileName, file.getInputStream());

        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        userEntity.setAvatar(url + fileName);

        userServiceImpl.updateById(userEntity);

        return ResultFactory.buildSuccessResult();
    }
}
