package com.waiend.pddou.core.base.mybatisplus;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

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
        // 新增的时候插入创建时间
        Object createTime = getFieldValByName("createTime", metaObject);
        if (createTime == null) {
            setFieldValByName("createTime", new Date(), metaObject);
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 更新的时候修改更新时间
        Object updateTime = getFieldValByName("updateTime", metaObject);
        if (updateTime == null) {
            setFieldValByName("updateTime", new Date(), metaObject);
        }
    }
}
