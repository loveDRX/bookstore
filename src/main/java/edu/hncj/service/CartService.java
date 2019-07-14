package edu.hncj.service;

import edu.hncj.entity.Cart;
import edu.hncj.entity.OrderItem;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dayan
 * @param <T>
 * @since 2019-03-20
 */
public interface CartService extends IService<Cart> {

	List<Cart> mergeCart(List<Cart> cartList, String id);

	List<OrderItem> leftJoinBook(List<Cart> cartList);

//	List<OrderItem> leftJoinBook2(List<Cart> cList, String id);

	List<OrderItem> leftJoinBook3(List<OrderItem> asList);



}
