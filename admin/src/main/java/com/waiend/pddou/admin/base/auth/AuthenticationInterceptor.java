package com.waiend.pddou.admin.base.auth;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.waiend.pddou.core.common.util.IPUtils;
import com.waiend.pddou.core.operationlog.entity.OperationLogEntity;
import com.waiend.pddou.core.operationlog.service.OperationLogService;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

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
        RequiresOperationLog requiresOperationLog = ((HandlerMethod) handler).getMethodAnnotation(RequiresOperationLog.class);
        if (!ignoredUrlsProperties.getUrls().contains(request.getRequestURI())) {

        }

        if (requiresOperationLog != null) {
            // 获取请求参数信息
            String param = JSON.toJSONString(request.getParameterMap(),
                    SerializerFeature.DisableCircularReferenceDetect,
                    SerializerFeature.WriteMapNullValue);
            // 操作日志
            OperationLogEntity operationLogEntity = new OperationLogEntity();
            operationLogEntity.setCreateTime(LocalDateTime.now());
//            operationLog.setOperationId(employee.getId());
            operationLogEntity.setUrl(request.getRequestURL().toString());
            operationLogEntity.setIp(IPUtils.getIpAddr(request));
            operationLogEntity.setParams(param);
            operationLogEntity.setOperationType(OperationLogEntity.OperationType.ADMIN);
            operationLogEntity.setDescription(requiresOperationLog.description());

            operationLogServiceImpl.save(operationLogEntity);
        }

        return false;
    }
}
