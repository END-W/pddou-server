package com.waiend.pddou.core.common.util;

import com.waiend.pddou.core.system.entity.EmployeeEntity;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author end
 * @date 2022年12月10日 22:30
 */
@Component
public class JwtTokenUtils {

    /**
     * 过期时间
     */
    @Value("${token.expire}")
    private long expire;

    /**
     * 密钥
     */
    @Value("${token.secret}")
    private String secret;

    /**
     * 从数据声明生成令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    private String generateToken(Map<String, Object> claims) {
        Date expirationDate = new Date(System.currentTimeMillis() + expire * 1000);
        return Jwts.builder().setClaims(claims).setExpiration(expirationDate).signWith(SignatureAlgorithm.HS512, secret).compact();
    }

    /**
     * 从令牌中获取数据声明
     *
     * @param token 令牌
     * @return 数据声明
     */
    private Claims getClaimsFromToken(String token) {
        Claims claims;
        try {
            claims = Jwts.parser().setSigningKey(secret).parseClaimsJws(token).getBody();
        } catch (Exception e) {
            claims = null;
        }
        return claims;
    }

    /**
     * 生成令牌
     *
     * @param id
     * @return 令牌
     */
    public String generateToken(Long id) {
        Map<String, Object> claims = new HashMap<>(2);
        claims.put("sub", id);
        claims.put("created", new Date());
        return generateToken(claims);
    }

    /**
     * 从令牌中获取ID
     *
     * @param token 令牌
     * @return ID
     */
    public Long getIdFromToken(String token) {
        Long id;
        try {
            Claims claims = getClaimsFromToken(token);
            id = Long.valueOf(claims.getSubject());
        } catch (Exception e) {
            id = null;
        }
        return id;
    }

    /**
     * 判断令牌是否过期
     *
     * @param token 令牌
     * @return 是否过期
     */
    public Boolean isTokenExpired(String token) {
        try {
            Claims claims = getClaimsFromToken(token);
            Date expiration = claims.getExpiration();
            return expiration.before(new Date());
        } catch (Exception e) {
            return true;
        }
    }

    /**
     * 刷新令牌
     *
     * @param token 原令牌
     * @return 新令牌
     */
    public String refreshToken(String token) {
        String refreshedToken;
        try {
            Claims claims = getClaimsFromToken(token);
            claims.put("created", new Date());
            refreshedToken = generateToken(claims);
        } catch (Exception e) {
            refreshedToken = null;
        }
        return refreshedToken;
    }

    /**
     * 验证令牌-后台
     *
     * @param token 令牌
     * @return 是否有效
     */
    public Boolean validateBackToken(String token, EmployeeEntity employeeEntity) {
        Long id = getIdFromToken(token);
        return (id.equals(employeeEntity.getId()) && !isTokenExpired(token));
    }
}
