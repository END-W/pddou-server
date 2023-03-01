package com.waiend.pddou.admin.base.auth;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.waiend.pddou.admin.base.result.Result;
import com.waiend.pddou.core.common.util.IPUtils;
import com.waiend.pddou.core.common.util.JwtTokenUtils;
import com.waiend.pddou.core.operationlog.entity.OperationLogEntity;
import com.waiend.pddou.core.operationlog.service.OperationLogService;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author end
 * @date 2023年03月01日 19:53
 */
@ControllerAdvice
public class OperationLogAnalysis implements ResponseBodyAdvice {

    @Resource
    private OperationLogService operationLogServiceImpl;

    @Resource
    private JwtTokenUtils jwtTokenUtils;

    @Override
    public boolean supports(MethodParameter methodParameter, Class aClass) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter methodParameter, MediaType mediaType, Class aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        if (body instanceof Result) {
            Result result = (Result) body;
            System.out.println(result);
            if (result.getCode() == 20000) {
                RequiresOperationLog requiresOperationLog = methodParameter.getMethodAnnotation(RequiresOperationLog.class);
                // 记录操作日志
                if (requiresOperationLog != null) {
                    ServletServerHttpRequest servletServerHttpRequest = (ServletServerHttpRequest) serverHttpRequest;
                    HttpServletRequest request = servletServerHttpRequest.getServletRequest();
                    String token = request.getHeader("Authorization");
                    Long id = jwtTokenUtils.getIdFromToken(token);
                    // 获取请求参数信息
                    String param = JSON.toJSONString(request.getParameterMap(),
                            SerializerFeature.DisableCircularReferenceDetect,
                            SerializerFeature.WriteMapNullValue);

                    OperationLogEntity operationLogEntity = new OperationLogEntity();
                    operationLogEntity.setOperationId(id)
                            .setUrl(request.getRequestURI())
                            .setIp(IPUtils.getIpAddr(request))
                            .setParams(param)
                            .setOperationType(OperationLogEntity.OperationType.ADMIN)
                            .setDescription(requiresOperationLog.description());

                    operationLogServiceImpl.save(operationLogEntity);
                }
            }
        }

        return body;
    }
}
