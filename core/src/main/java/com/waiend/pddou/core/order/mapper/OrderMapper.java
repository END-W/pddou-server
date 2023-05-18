package com.waiend.pddou.core.order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.waiend.pddou.core.order.entity.OrderEntity;
import com.waiend.pddou.core.order.vo.OrderVo;
import com.waiend.pddou.core.system.vo.BoxOfficeMovieTypeVo;
import com.waiend.pddou.core.system.vo.BoxOfficeTop10Vo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author end
 * @date 2022年12月10日 20:02
 */
public interface OrderMapper extends BaseMapper<OrderEntity> {

    /**
     * 统计订单总记录数
     *
     * @param username 用户名
     * @param movieName 电影名
     * @param cinemaName 影院名称
     * @param orderNum 订单号
     * @param payType 支付类型（NO_PAID-未支付-默认，PAID-已支付，FAILED-支付失败，RETURN-退票）
     * @param cinemaId 影院ID
     * @return int
     */
    int selectCountOrder(@Param("username") String username, @Param("movieName") String movieName, @Param("cinemaName") String cinemaName,
                         @Param("orderNum") String orderNum, @Param("payType") String payType, @Param("cinemaId") Long cinemaId);

    /**
     * 订单列表
     *
     * @param page 页码
     * @param limit 页大小
     * @param username 用户名
     * @param movieName 电影名
     * @param cinemaName 影院名称
     * @param orderNum 订单号
     * @param payType 支付类型（NO_PAID-未支付-默认，PAID-已支付，FAILED-支付失败，RETURN-退票）
     * @param cinemaId 影院ID
     * @return List<OrderVo>
     */
    List<OrderVo> selectOrderList(@Param("page") int page, @Param("limit") Integer limit, @Param("username") String username,
                                  @Param("movieName") String movieName, @Param("cinemaName") String cinemaName, @Param("orderNum") String orderNum,
                                  @Param("payType") String payType, @Param("cinemaId") Long cinemaId);

    /**
     * 获取个人订单信息
     *
     * @param userId 用户ID
     * @return List<OrderVo>
     */
    List<OrderVo> selectOrderListByUserId(@Param("userId") Long userId);

    /**
     * 查询票房数据
     *
     * @return List<Integer>
     */
    List<Integer> selectBoxOffice();

    /**
     * 根据商家查询票房数据
     *
     * @param employeeId 员工ID
     * @return List<Integer>
     */
    List<Integer> selectBoxOfficeByStore(Long employeeId);

    /**
     * 查询票房前十
     *
     * @return List<BoxOfficeTop10Vo>
     */
    List<BoxOfficeTop10Vo> selectBoxOfficeTop10();

    /**
     * 根据商家查询票房前十
     *
     * @param employeeId 员工ID
     * @return List<BoxOfficeTop10Vo>
     */
    List<BoxOfficeTop10Vo> selectBoxOfficeTop10ByStore(Long employeeId);

    /**
     * 根据电影类型查询票房数据
     *
     * @return List<BoxOfficeMovieTypeVo>
     */
    List<BoxOfficeMovieTypeVo> selectBoxOfficeDataByMovieType();

    /**
     * 根据电影类型和商家查询票房数据
     *
     * @param employeeId 员工ID
     * @return List<BoxOfficeMovieTypeVo>
     */
    List<BoxOfficeMovieTypeVo> selectBoxOfficeDataByMovieTypeWithStore(Long employeeId);
}