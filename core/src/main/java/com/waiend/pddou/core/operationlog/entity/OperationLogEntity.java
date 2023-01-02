package com.waiend.pddou.core.operationlog.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waiend.pddou.core.base.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_operation_log")
public class OperationLogEntity extends BaseEntity {

    /**
     * 操作者id
     */
    private Long operationId;

    /**
     * 接口地址
     */
    private String url;

    /**
     * 接口所带参数
     */
    private String params;

    /**
     * 类型
     */
    private OperationType operationType;

    /**
     * ip地址
     */
    private String ip;

    /**
     * 具体地址
     */
    private String ipAddr;

    /**
     * 接口描述
     */
    private String description;

    public enum OperationType{
        /**
         * 管理端
         */
        ADMIN,

        /**
         * 移动端
         */
        PC
    }
}
