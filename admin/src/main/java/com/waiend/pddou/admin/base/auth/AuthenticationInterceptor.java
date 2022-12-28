package com.waiend.pddou.admin.base.auth;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.waiend.pddou.admin.base.exception.PDDouException;
import com.waiend.pddou.admin.base.result.ResultStatus;
import com.waiend.pddou.core.common.util.IPUtils;
import com.waiend.pddou.core.common.util.JwtTokenUtils;
import com.waiend.pddou.core.operationlog.entity.OperationLogEntity;
import com.waiend.pddou.core.operationlog.service.OperationLogService;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
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

        HandlerMethod method = (HandlerMethod) handler;
        RequiresOperationLog requiresOperationLog = method.getMethodAnnotation(RequiresOperationLog.class);
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
                // 记录操作日志
                if (requiresOperationLog != null) {
                    // 获取请求参数信息
                    String param = JSON.toJSONString(request.getParameterMap(),
                                    SerializerFeature.DisableCircularReferenceDetect,
                                    SerializerFeature.WriteMapNullValue);

                    OperationLogEntity operationLogEntity = new OperationLogEntity();
                    operationLogEntity.setOperationId(id);
                    operationLogEntity.setUrl(request.getRequestURL().toString());
                    operationLogEntity.setIp(IPUtils.getIpAddr(request));
                    operationLogEntity.setParams(param);
                    operationLogEntity.setOperationType(OperationLogEntity.OperationType.ADMIN);
                    operationLogEntity.setDescription(requiresOperationLog.description());

                    operationLogServiceImpl.save(operationLogEntity);
                }
                return true;
            } else {
                throw new UnauthenticatedException("未登录");
            }
        }

        return true;
    }
}
