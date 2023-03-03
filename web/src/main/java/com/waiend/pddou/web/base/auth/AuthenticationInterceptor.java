package com.waiend.pddou.web.base.auth;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.waiend.pddou.core.base.expection.PDDouException;
import com.waiend.pddou.core.base.result.ResultStatus;
import com.waiend.pddou.core.common.util.JwtTokenUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

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
}