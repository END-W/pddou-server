package com.waiend.pddou.core.common.util;

import java.util.UUID;

/**
 * @author end
 * @date 2023年04月18日 10:49
 */
public class OrderUtils {

    public static String generateOrderNumber() {
        // 自定义的前缀
        String prefix = "11";
        // 生成UUID
        UUID uuid = UUID.randomUUID();
        // 将UUID转换为数字
        long uuidNum = Math.abs(uuid.getLeastSignificantBits());
        // 生成12位随机数
        long randomNum = (long)(Math.random() * 1000000000000L);
        // 根据时间戳生成8位随机数
        long timestamp = System.currentTimeMillis();
        long randomNum2 = timestamp % 100000000L;
        // 将前缀、UUID和随机数拼接为字符串
        StringBuilder sb = new StringBuilder();
        sb.append(prefix).append(String.format("%016d", uuidNum)).append(String.format("%012d", randomNum)).append(String.format("%08d", randomNum2));
        return sb.toString().substring(0, 20);
    }
}
