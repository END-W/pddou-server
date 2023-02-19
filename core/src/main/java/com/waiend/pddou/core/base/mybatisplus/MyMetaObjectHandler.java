package com.waiend.pddou.core.base.mybatisplus;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * mybatis的自动插入更新
 *
 * @author end
 * @date 2022年11月27日 21:23
 */
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        // 新增的时候插入创建时间和更新时间
        Object createTime = getFieldValByName("createTime", metaObject);
        Object updateTime = getFieldValByName("updateTime", metaObject);
        if (createTime == null || updateTime == null) {
            setFieldValByName("createTime", LocalDateTime.now(), metaObject);
            setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 更新的时候修改更新时间
        setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
    }
}
