package edu.hncj.web;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

import edu.hncj.common.CookieUtils;
import edu.hncj.entity.Cart;
import edu.hncj.entity.Customer;
import edu.hncj.entity.Order1;
import edu.hncj.entity.OrderItem;
import edu.hncj.service.CartService;
import edu.hncj.service.Order1Service;
import edu.hncj.service.OrderItemService;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
 * @since 2019-03-25
 */
@Controller
@RequestMapping("/order1")
public class Order1Controller {
	@Autowired
	private Order1Service orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private CartService cartService;
	@RequestMapping(value="orderPay",method=RequestMethod.GET)
	public String orderPay(HttpServletRequest request,Model model) {
		//从cookie中取出存放的购物车结算信息
		HttpSession session = request.getSession();
		Customer c = (Customer) session.getAttribute("customer");
		String json = CookieUtils.getCookieValue(request, c.getPassword().trim(),true);
		if(StringUtils.isNotBlank(json)) {
			Order1 order= JSONObject.parseObject(json, Order1.class);
			List<OrderItem> orderItem = order.getOrderItem();
			UUID guid = UUID.randomUUID();//生成订单号，防止重复提交订单，生成多个订单，或者网络原因提交失败
			model.addAttribute("guid", guid);
			model.addAttribute("list3",orderItem);
			model.addAttribute("totalMoney", order.getTotalMoney());
			return "order-cart";
		}
		return "views/404";
	}
	@RequestMapping(value="genernateOrder",method=RequestMethod.POST)
	public String genernateOrder(Order1 order,HttpServletRequest request) {
//		String[] productId = or.getProductId().split(",");
//		String[] productImage = or.getProductImage().split(",");
//		String[] productName = or.getProductName().split(",");
//		String[] productCount = or.getProductCount().toString().split(",");
//		String[] productMoney = or.getProductMoney().toString().split(",");
		//接收到伪订单的值，生成订单,生成订单号
		if(order.getId().equals("")==false||order.getId()!=null) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		order.setId(format.format(date));
		String time = date.getTime()+"";
//		UUID uuid = UUID.randomUUID();
//		String id=uuid+time;
		List<OrderItem> orderItem2 = order.getOrderItem();
		order.setOrderItem(null);
		//设置为当前时间
		order.setCreateTime(date);
		//未支付
		order.setState("0");
//		order.setId(order.getId());
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
			boolean column = orderService.insert(order);
			if(!column) {
				return "views/404";
			}
		//分别向2个订单表插入订单数据
//		for (int i = 0; i < productId.length; i++) {
//			orderItem.setOrderId(id);
//			System.out.println(productCount[i]+"==========================");
//	//		orderItem.setProductCount(Integer.parseInt(productCount[i]));
//			orderItem.setProductId(productId[i]);
//			orderItem.setProductImage(productImage[i]);
//			orderItem.setProductMoney(BigDecimal.valueOf(Double.parseDouble(productMoney[i])));
//			orderItem.setProductName(productName[i]);
//			boolean b = orderItemService.insertAllColumn(orderItem);
//			if(!b) {
//				return "views/404";
//			}
//		}  返回给支付页面的商品描述
//			String des="";
			StringBuilder des = new StringBuilder("");
			//在生成订单的时候，删除掉购物车里的数据
			String userId = order.getUserId();
			for (OrderItem orderItem : orderItem2) {
				String productId = orderItem.getProductId();
				EntityWrapper<Cart> wrapper = new EntityWrapper<Cart>();
				wrapper.eq("customer_id", userId).eq("book_id", productId);
				boolean delete = cartService.delete(wrapper);
				if(delete==false) {
					return "views/404";
				}
				des.append("购买了图书:"+orderItem.getProductName()+"数量为:"+orderItem.getProductCount());
				orderItem.setOrderId(order.getId());
				boolean b = orderItemService.insertAllColumn(orderItem);
				if(!b) {
					return "views/404";
				}
			}
		request.setAttribute("des", des.toString());
		request.setAttribute("orderId", order.getId());
		request.setAttribute("money", order.getTotalMoney().toString());
		return "alipay";
		}
		return "views/404";
	}
	@RequestMapping(value="orderSuccess",method=RequestMethod.POST)
	public String orderSuccess(HttpServletRequest request) {
		//支付成功回调，修改订单状态为成功
		HttpSession session = request.getSession();
		String attribute = (String) session.getAttribute("orderId");
		System.out.println(attribute);
		return "success";
	}
}

