package edu.hncj.web;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin")
public class AdminController{
	private static final Logger logger = Logger.getLogger(AdminController.class);
	
	@RequestMapping(value="/doLogin")
	public ModelAndView doLogin() {
		ModelAndView andView = new ModelAndView("admin/login");
		logger.info("==========用户进入了登陆页面===================");
		return andView;
	}
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value="user_name",required=false) String userName,@RequestParam(value="pass_word",required=false) String passWord){
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken Token = new UsernamePasswordToken(userName,passWord);
		try {
			subject.login(Token);
		} catch (Exception e) {
			// TODO: handle exception
			ModelAndView modelAndView = new ModelAndView("admin/index");
			return modelAndView;
		}
		ModelAndView view = new ModelAndView("admin/index");
		return view;
	}
}
