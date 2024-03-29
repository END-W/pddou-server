package com.waiend.pddou.web.base.resolver;

import com.waiend.pddou.core.common.util.JwtTokenUtils;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * 用户ID参数解析器
 *
 * @author end
 * @date 2022年12月28日 11:04
 */
@Component
public class UserIdArgumentResolver implements HandlerMethodArgumentResolver {

    @Resource
    private JwtTokenUtils jwtTokenUtils;

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.hasParameterAnnotation(UserId.class);
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        String token = webRequest.getHeader("Authorization");
        Long id = jwtTokenUtils.getIdFromToken(token);
        if (!Objects.isNull(id)) {
            if ("userId".equals(parameter.getParameterName())) {
                return id;
            }
        }
        return null;
    }
}