package com.waiend.pddou.core.common.util;

import java.security.SecureRandom;
import java.util.Random;

/**
 * 生成手机验证码工具类
 */
public class RandomUtils {

    // 验证码包含的字段
    private static final String SYMBOLS = "0123456789";

    private static final String SYMBOLS2 = "0123456789abcdefghijklmnopqrstuvwxyz";

    private static final Random RANDOM = new SecureRandom();

    // 生成6位数的随机数字
    public static String generateVerCode() {
        char[] numbers = new char[6];
        for (int i = 0; i < numbers.length; i++) {
            numbers[i] = SYMBOLS.charAt(RANDOM.nextInt(SYMBOLS.length()));
        }
        return new String(numbers);
    }

    // 生成任意位数的随机数字
    public static String generateVerCode2(int n) {
        char[] numbers = new char[n];
        for (int i = 0; i < numbers.length; i++) {
            numbers[i] = SYMBOLS2.charAt(RANDOM.nextInt(SYMBOLS2.length()));
        }
        return new String(numbers);
    }
}