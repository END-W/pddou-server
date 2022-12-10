package com.waiend.pddou.core.operationlog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.operationlog.entity.OperationLogEntity;
import com.waiend.pddou.core.operationlog.mapper.OperationLogMapper;
import com.waiend.pddou.core.operationlog.service.OperationLogService;
import org.springframework.stereotype.Service;

/**
 * @author end
 * @date 2022年12月10日 20:35
 */
@Service
public class OperationLogServiceImpl extends ServiceImpl<OperationLogMapper, OperationLogEntity> implements OperationLogService {
}
