package edu.hncj.web;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.sun.org.apache.bcel.internal.generic.RETURN;

import edu.hncj.common.AESUtil;
import edu.hncj.entity.Customer;
import edu.hncj.service.CustomerService;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dayan
 * @since 2019-03-19
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam String username, @ RequestParam String password,HttpServletRequest request) {
		EntityWrapper<Customer> entityWrapper = new EntityWrapper<Customer>();
		entityWrapper.eq("username", username);
		Customer customer = customerService.selectOne(entityWrapper);
		//暂时不加判断
			byte[] encrypt = AESUtil.encrypt(password, customer.getUsername());
			String parseByte2HexStr = AESUtil.parseByte2HexStr(encrypt);
			if(parseByte2HexStr.equals(customer.getPassword())){
				HttpSession session = request.getSession();
				session.setAttribute("customer", customer);
				return "redirect:/index";
			}
			return "views/404";
	}
	@Transactional
	@RequestMapping(value="/doRegister",method=RequestMethod.POST)
	public String register(Customer c,Model m) throws Exception{
		EntityWrapper<Customer> entityWrapper = new EntityWrapper<Customer>();
		entityWrapper.eq("username",c.getUsername());
		Customer customer = customerService.selectOne(entityWrapper);
		if(c.getUsername().equals(customer.getUsername())==false) {
			c.setId(System.currentTimeMillis()+"");
			c.setCreateTime(new Date());
			 String content = c.getPassword();
	        String password = c.getUsername();
	        //加密
	        byte[] encryptResult = AESUtil.encrypt(content, password);
	        String encryptResultStr = AESUtil.parseByte2HexStr(encryptResult);
	    
	        	c.setPassword(encryptResultStr);
	        	boolean insert = customerService.insert(c);
	        	if(!insert) {
	    			throw new Exception();
	        	}
			return "redirect:/index";
		}
        m.addAttribute("msg","用户名重复注册");
        return "views/404";
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("customer");
		return "redirect:/index";
	}
}

