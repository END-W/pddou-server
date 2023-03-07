package com.waiend.pddou.core.common.util;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * 日期处理
 *
 * @author end
 * @date 2023年03月07日 14:29
 */
public class DateUtils {

    /**
     * 时间格式(yyyy-MM-dd)
     */
    public final static String DATE_PATTERN = "yyyy-MM-dd";

    /**
     * 时间格式(yyyy-MM-dd HH:mm:ss)
     */
    public final static String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /**
     * 日期格式化 日期格式为：yyyy-MM-dd
     *
     * @param date 日期
     * @return 返回yyyy-MM-dd格式日期
     */
    public static String format(LocalDateTime date) {
        return format(date, DATE_PATTERN);
    }

    /**
     * 日期格式化 日期格式为：yyyy-MM-dd
     *
     * @param date    日期
     * @param pattern 格式，如：DateUtils.DATE_TIME_PATTERN
     * @return 返回yyyy-MM-dd格式日期
     */
    public static String format(LocalDateTime date, String pattern) {
        if (date != null) {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern(pattern);
            return dtf.format(date);
        }
        return null;
    }

    /**
     * 字符串转换成日期
     *
     * @param strDate 日期字符串
     * @param pattern 日期的格式，如：DateUtils.DATE_TIME_PATTERN
     * @return LocalDateTime
     */
    public static LocalDateTime stringToDate(String strDate, String pattern) {
        if (StringUtils.isBlank(strDate)) {
            return null;
        }

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern(pattern);
        return LocalDateTime.parse(strDate, fmt);
    }

    /**
     * LocalDate转Date
     *
     * @param localDate 日期
     * @return Date
     */
    public static Date parseToDate(LocalDate localDate) {
        if (localDate != null) {
            Instant instant = localDate.atTime(LocalTime.MIDNIGHT).atZone(ZoneId.systemDefault()).toInstant();
            return Date.from(instant);
        }
        return null;
    }

    /**
     * Date转LocalDate
     *
     * @param date 日期
     * @return LocalDate
     */
    public static LocalDate parseToLocalDate(Date date) {
        if (date != null) {
            return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        }
        return null;
    }

    /**
     * 对日期的【月】进行减
     *
     * @param date 日期
     * @param months 天数
     * @return 减几月后的日期
     */
    public static LocalDate minusDateMonth(LocalDate date, int months) {
        return date.minusMonths(months);
    }

    /**
     * 对日期的【天】进行加
     *
     * @param date 日期
     * @param days 天数
     * @return 加几天后的日期
     */
    public static LocalDate addDateDays(LocalDate date, int days) {
        return date.plusDays(days);
    }

    /**
     * 对日期的【天】进行减
     *
     * @param date 日期
     * @param days 天数
     * @return 减几天后的日期
     */
    public static LocalDate minusDateDays(LocalDate date, int days) {
        return date.minusDays(days);
    }
}
