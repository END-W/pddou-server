package com.waiend.pddou.admin.base.auth;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.core.base.expection.PDDouException;
import com.waiend.pddou.core.base.result.ResultStatus;
import com.waiend.pddou.core.common.util.IPUtils;
import com.waiend.pddou.core.common.util.JwtTokenUtils;
import com.waiend.pddou.core.operationlog.entity.OperationLogEntity;
import com.waiend.pddou.core.operationlog.service.OperationLogService;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

/**
 * @author end
 * @date 2022年12月09日 22:06
 */
@Component
public class AuthenticationInterceptor implements HandlerInterceptor {

    @Resource
    private IgnoredUrlsProperties ignoredUrlsProperties;

    @Resource
    private OperationLogService operationLogServiceImpl;

    @Resource
    private JwtTokenUtils jwtTokenUtils;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.addHeader("x-frame-options","SAMEORIGIN");
        response.addHeader("Strict-Transport-Security", "max-age=31536000");
        response.addHeader("Referrer-Policy", "no-referrer-when-downgrade");
        response.addHeader("Content-Security-Policy", "self");
        response.addHeader("X-Download-Options", "noopen");
        response.addHeader("X-Content-Type-Options", "nosniff");
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }

        // 验证token
        if (!ignoredUrlsProperties.getUrls().contains(request.getRequestURI())) {
            String token = request.getHeader("Authorization");
            if (StringUtils.isNotBlank(token)) {
                Long id = jwtTokenUtils.getIdFromToken(token);
                if (Objects.isNull(id)) {
                    throw new PDDouException("无效token", ResultStatus.ILLEGAL_TOKEN);
                }
                if (jwtTokenUtils.isTokenExpired(token)) {
                    throw new PDDouException("token过期", ResultStatus.TOKEN_EXPIRED);
                }
                return true;
            } else {
                throw new UnauthenticatedException("未登录");
            }
        }

        return true;
    }
}
