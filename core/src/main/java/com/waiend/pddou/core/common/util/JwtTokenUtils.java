package com.waiend.pddou.core.common.util;

import com.waiend.pddou.core.system.entity.EmployeeEntity;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.*;

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

    private int startIndex = 3;

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
     * 通过id生成sub
     *
     * @param id 用户id
     * @return list
     */
    private List<String> generateSubById(Long id) {
        byte[] encode = Base64.getEncoder().encode(String.valueOf(id).getBytes());
        String newId = new String(encode);
        newId = newId.replaceAll("=", "");
        String uuid = UUID.randomUUID().toString();
        String[] split = uuid.split("-");
        StringBuilder s1 = new StringBuilder();
        for (String s2 : split) {
            Random random = new Random();
            double v = random.nextDouble();
            if (v < 0.5) {
                s2 = s2.toUpperCase();
            }
            s1.append(s2);
        }
        String sub = s1.replace(startIndex, startIndex + newId.length(), newId).toString();
        List<String> list = new ArrayList<>();
        list.add(sub);
        list.add(String.valueOf(newId.length()));
        return list;

    }

    /**
     * 生成令牌
     *
     * @param id 用户id
     * @return 令牌
     */
    public String generateToken(Long id) {
        Map<String, Object> claims = new HashMap<>(4);
        List<String> list = generateSubById(id);
        claims.put("sub", list.get(0));
        claims.put("len", Integer.valueOf(list.get(1)) + 32);
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
            String subject = claims.getSubject();
            Integer len = (Integer) claims.get("len");
            String substring = subject.substring(startIndex, (startIndex + len - 32));
            byte[] decode = Base64.getDecoder().decode(substring.getBytes());
            id = Long.valueOf(new String(decode));
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
