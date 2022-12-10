package com.waiend.pddou.core.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.waiend.pddou.core.system.mapper.MenuMapper;
import com.waiend.pddou.core.system.entity.MenuEntity;
import com.waiend.pddou.core.system.service.MenuService;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, MenuEntity> implements MenuService {

    @Resource
    private MenuMapper menuMapper;

}
