package edu.hncj.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class ExceptionInterceptor implements HandlerExceptionResolver{

	private static final Logger lg= Logger.getLogger(ExceptionInterceptor.class);
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		// TODO Auto-generated method stub
		ex.printStackTrace();
		lg.info("对异常进行拦截");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("views/404");
		return modelAndView;
	}
	
}
