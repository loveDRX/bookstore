package edu.hncj.mapper;

import edu.hncj.entity.Cart;
import edu.hncj.entity.OrderItem;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author dayan
 * @since 2019-03-20
 */
public interface CartMapper extends BaseMapper<Cart> {


	OrderItem leftJoinBook2(String id);

	OrderItem JoinBook(String bookId);

}
