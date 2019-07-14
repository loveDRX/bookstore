package edu.hncj.web;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

import edu.hncj.common.CookieUtils;
import edu.hncj.entity.Cart;
import edu.hncj.entity.Customer;
import edu.hncj.entity.Order1;
import edu.hncj.entity.OrderItem;
import edu.hncj.service.CartService;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dayan
 * @since 2019-03-20
 */
@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartService cartService;
	@ResponseBody
	@RequestMapping(value="/addcart",method=RequestMethod.POST)
	public String addcart(@RequestParam String bookId,@RequestParam Integer count,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("customer");
		if(customer!=null) {
			boolean b = false;
			String id = customer.getId();
			EntityWrapper<Cart> wrapper = new EntityWrapper<Cart>();
			wrapper.eq("customer_id", id);
			List<Cart> selectList = cartService.selectList(wrapper);
			if(selectList.size()==0||selectList==null) {
				Cart cart1 = new Cart(id, bookId, count);
				 b = cartService.insert(cart1);
			}else {
				for (Cart cart : selectList) {
					if(cart.getBookId().equals(bookId)) {
						cart.setCount(count+cart.getCount());
						EntityWrapper<Cart> wrapper1 = new EntityWrapper<Cart>();
						wrapper1.eq("book_id", bookId);
						 b = cartService.update(cart, wrapper1);
						 return "1";
					}
				}
				Cart cart1 = new Cart(id, bookId, count);
				 b = cartService.insert(cart1);
			}
//			Cart cart1 = new Cart(customer.getId(), bookId, count);
//			System.out.println("这里报错了-------------");
//			boolean b = cartService.insertOrUpdateAllColumn(cart1);
			if(b) {
				return "1";
			}else return "0";
		
		}
		//从cookie中取出已添加的商品列表
				List<Cart> cartList=getCartList(request);
				boolean flag=false;
				for(Cart bc:cartList) {
					//找到存在的商品，将数量相加
					if(bc.getBookId().equals(bookId)) {
						bc.setCount(count+bc.getCount());
						flag=true;
						break;
					}
				}
				if(!flag) {
					//该商品第一次添加到购物车查询该商品的信息
					Cart cart1 = new Cart(bookId,count);
					cartList.add(cart1);	
				}
				//把商品列表写回到cookie
				CookieUtils.setCookie(request, response, "cart", JSONObject.toJSONString(cartList),60000,true);
				return "1";
	}
		
	private List<Cart> getCartList(HttpServletRequest request) {
		// 从cookie取购物车列表
		String json = CookieUtils.getCookieValue(request,"cart", true);		
		//判断json是否为空，防止空指针异常
		if(StringUtils.isNotBlank(json)) {
			List<Cart> list = JSONObject.parseArray(json, Cart.class);
			return list;
		}
		return new ArrayList<Cart>();
	}
	@RequestMapping(value="/getCart",method=RequestMethod.GET)
	public String getCart(Model model,HttpServletRequest request,HttpServletResponse response) {
		List<Cart> cartList = getCartList(request);
		HttpSession session = request.getSession();
		Customer cus = (Customer) session.getAttribute("customer");
		if(cus==null) {
			List<OrderItem> list=cartService.leftJoinBook(cartList);
			model.addAttribute("clist", list);
		}
		//合并购物车
		else {
		List<Cart> cList=cartService.mergeCart(cartList,cus.getId());
		//把cookie中的购物车删除
		CookieUtils.deleteCookie(request, response, "cart");
		List<OrderItem> list=cartService.leftJoinBook(cList);
		model.addAttribute("clist", list);
		}
		return "cart";
	}
	@RequestMapping(value="delcart/{bookId}",method=RequestMethod.DELETE)
	@ResponseBody
	public String delcart(@PathVariable("bookId") String bookId) {
		EntityWrapper<Cart> wrapper = new EntityWrapper<Cart>();
		wrapper.eq("book_id", bookId);
		boolean b = cartService.delete(wrapper);
		if(b) {
		return "1";
	}else return"0";
	}
	//进行购物车像生成订单页面的跳转
	@RequestMapping(value="balance",method=RequestMethod.POST)
	@ResponseBody
	public String balance(@RequestBody List<OrderItem> list,BigDecimal totalMoney, HttpServletRequest request,HttpServletResponse response) {
		//判断用户登陆
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("customer");
		if(customer==null) {
			return "000";
		}
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalMoney",totalMoney);
		List<OrderItem> list1=cartService.leftJoinBook3(list);
		Order1 order = new Order1();
		order.setOrderItem(list1);
		order.setTotalMoney(totalMoney);
		//用户不为空，放到cookie
		CookieUtils.setCookie(request, response,customer.getPassword().trim(), JSONObject.toJSONString(order),6000,true);
		return "111";
	}
//	@RequestMapping(value="goOrder")
//	public String goOrder() {
//		return "redirect:/order/orderPay";
//	}
}

