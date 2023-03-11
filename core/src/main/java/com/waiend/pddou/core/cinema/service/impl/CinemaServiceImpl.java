package com.waiend.pddou.core.cinema.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waiend.pddou.core.base.password.BCryptPasswordManager;
import com.waiend.pddou.core.base.password.PasswordManager;
import com.waiend.pddou.core.cinema.entity.CinemaEntity;
import com.waiend.pddou.core.cinema.mapper.CinemaMapper;
import com.waiend.pddou.core.cinema.service.CinemaService;
import com.waiend.pddou.core.cinema.vo.CinemaVo;
import com.waiend.pddou.core.cinema.vo.SelectCinemaVo;
import com.waiend.pddou.core.system.entity.EmployeeEntity;
import com.waiend.pddou.core.system.entity.EmployeeRoleEntity;
import com.waiend.pddou.core.system.entity.RoleEntity;
import com.waiend.pddou.core.system.mapper.EmployeeMapper;
import com.waiend.pddou.core.system.mapper.EmployeeRoleMapper;
import com.waiend.pddou.core.system.mapper.RoleMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

/**
 * @author end
 * @date 2022年12月10日 20:01
 */
@Service
public class CinemaServiceImpl extends ServiceImpl<CinemaMapper, CinemaEntity> implements CinemaService {

    @Resource
    private CinemaMapper cinemaMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private EmployeeRoleMapper employeeRoleMapper;

    @Override
    public Map<String, Object> cinemaList(Integer page, Integer limit, String cinemaName, String isExamine, Integer isBlock) {
        Map<String, Object> map = new HashMap<>();

        int total = cinemaMapper.selectCountCinema(cinemaName, isExamine, isBlock);
        List<CinemaVo> cinemaList = cinemaMapper.selectCinemaList((page - 1) * limit, limit, cinemaName, isExamine, isBlock);

        map.put("list", cinemaList);
        map.put("total", total);

        return map;
    }

    @Override
    public CinemaVo getCinema(Integer cinemaId) {
        CinemaEntity cinemaEntity = cinemaMapper.selectById(cinemaId);

        return BeanUtil.copyProperties(cinemaEntity, CinemaVo.class);
    }

    @Transactional
    @Override
    public void addCinema(CinemaEntity cinemaEntity) {
        EmployeeEntity employeeEntity = new EmployeeEntity();
        employeeEntity.setType(EmployeeEntity.Type.MERCHANT)
                      .setUserType(EmployeeEntity.UserType.STORE)
                      .setUsername(cinemaEntity.getPhone())
                      .setName(cinemaEntity.getLegalPerson())
                      .setPhone(cinemaEntity.getPhone())
        // 默认密码：123456
                      .setPassword("$2a$10$UYcHnjoNXL/vgYy.kkxpZ.WO4rRGLkQLxAkRxaerwNXJNxCnKNCKi");

        employeeMapper.insert(employeeEntity);

        EmployeeRoleEntity employeeRoleEntity = new EmployeeRoleEntity();
        RoleEntity roleEntity = roleMapper.selectOne(new QueryWrapper<RoleEntity>().lambda()
                                                    .eq(RoleEntity::getName, EmployeeEntity.UserType.STORE));
        employeeRoleEntity.setEmployeeId(employeeEntity.getId());
        employeeRoleEntity.setRoleId(Math.toIntExact(roleEntity.getId()));

        employeeRoleMapper.insert(employeeRoleEntity);

        cinemaEntity.setEmployeeId(employeeEntity.getId());

        cinemaMapper.insert(cinemaEntity);
    }

    @Override
    public void updateCinema(CinemaEntity cinemaEntity) {
        cinemaMapper.updateById(cinemaEntity);
    }

    @Override
    public void examineCinema(Long id, String isExamine, Long employeeId) {
        CinemaEntity cinemaEntity = new CinemaEntity();
        cinemaEntity.setId(id);
        if (CinemaEntity.ExamineType.ON_ACTIVITY.name().equals(isExamine)) {
            cinemaEntity.setIsExamine(CinemaEntity.ExamineType.ON_ACTIVITY);
        } else if (CinemaEntity.ExamineType.FAIL.name().equals(isExamine)) {
            cinemaEntity.setIsExamine(CinemaEntity.ExamineType.FAIL);
        }
        cinemaEntity.setCheckEmployeeId(employeeId);
        cinemaEntity.setCheckTime(LocalDateTime.now());

        cinemaMapper.updateById(cinemaEntity);
    }

    @Override
    public void blockCinema(Long cinemaId) {
        CinemaEntity cinemaEntity = new CinemaEntity();
        cinemaEntity.setId(cinemaId);
        cinemaEntity.setIsBlock(true);

        cinemaMapper.updateById(cinemaEntity);
    }

    @Override
    public List<SelectCinemaVo> getCinemaList(String city) {
        if (!StringUtils.hasText(city)) {
            return new ArrayList<>();
        }

        return cinemaMapper.selectCinemaByCity(null, city);
    }

    @Override
    public List<SelectCinemaVo> matchCinemaByName(String cinemaName, String city) {
        if (!StringUtils.hasText(city)) {
            return new ArrayList<>();
        }

        return cinemaMapper.selectCinemaByCity(cinemaName, city);
    }
}
