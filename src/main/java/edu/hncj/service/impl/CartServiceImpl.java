package edu.hncj.service.impl;

import edu.hncj.entity.Cart;
import edu.hncj.entity.OrderItem;
import edu.hncj.mapper.CartMapper;
import edu.hncj.service.CartService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dayan
 * @since 2019-03-20
 */
@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {
	public List<Cart> mergeCart(List<Cart> cartList, String id) {
		// TODO Auto-generated method stub
		EntityWrapper<Cart> wrapper = new EntityWrapper<Cart>();
		wrapper.eq("customer_id", id);
		for (Cart cart : cartList) {
			List<Cart> selectList = baseMapper.selectList(wrapper);
			if(selectList.size()==0||selectList==null) {
				Cart cart2 = new Cart(id,cart.getBookId(),cart.getCount());
				baseMapper.insert(cart2);
				//此处不知道需不需要开启事务 Integer in = 
//				if(in>0) {
//					flag=false;
//				}
			}else {
				for(Cart ca :selectList) {
					if(cart.getBookId().equals(ca.getBookId())) {
						ca.setCount(ca.getCount()+cart.getCount());
						EntityWrapper<Cart> wrapper1 = new EntityWrapper<Cart>();
						wrapper1.eq("book_id", ca.getBookId());
						baseMapper.update(ca, wrapper1);
						break;
					}else {
						Cart cart2 = new Cart(id,cart.getBookId(),cart.getCount());
						baseMapper.insert(cart2);
						break;
					}
				}
			}
		}
		List<Cart> selectList1 = baseMapper.selectList(wrapper);
		return selectList1;
	}

	public List<OrderItem> leftJoinBook(List<Cart> cartList) {
		// TODO Auto-generated method stub.
		ArrayList<OrderItem> arrayList = new ArrayList<OrderItem>();
		for (Cart cart : cartList) {
			OrderItem o=baseMapper.JoinBook(cart.getBookId());
			if(o!=null) {
				o.setProductCount(cart.getCount());
				arrayList.add(o);
			}
			else {return arrayList;}
		}
		return arrayList;
	}
//
//	public List<CartTemp> leftJoinBook2(List<Cart> cList, String id) {
//		// TODO Auto-generated method stub
//		ArrayList<OrderItem> arrayList = new ArrayList<CartTemp>();
//		for (Cart cart : cList) {
//			CartTemp o=baseMapper.leftJoinBook2(id);
//			if(o!=null) {
//				o.setCount(cart.getCount());
//				arrayList.add(o);
//			}
//			else {return arrayList;}
//		}
//		return arrayList;
//	}

	public List<OrderItem> leftJoinBook3(List<OrderItem> asList) {
		// TODO Auto-generated method stub
		ArrayList<OrderItem> arrayList = new ArrayList<OrderItem>();
		for (OrderItem or : asList) {
			OrderItem o=baseMapper.JoinBook(or.getProductId());
			if(o!=null) {
				o.setProductCount(or.getProductCount());
				arrayList.add(o);
			}
			else {return arrayList;}
		}
		return arrayList;
	}

	

}
