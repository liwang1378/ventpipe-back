package com.huatec.ventpipe.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.servlet.HandlerInterceptor;

import com.alibaba.fastjson.JSON;
import com.huatec.ventpipe.entity.User;
import com.huatec.ventpipe.utils.ResponseVoUtil;
@Slf4j
public class LoginInterceptor  implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String url = request.getRequestURI();
       
		if(url.indexOf("login")!=-1 || url.indexOf("swagger")!=-1){
			return true;
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user_session");
		log.info("拦截器 - {}",user);
		if(user!=null){
			return true;
		}
		log.info("{} - 访问拒绝",url);
		String content = JSON.toJSONString(ResponseVoUtil.error(501, "权限拒绝访问"));
		write(request, response, content);
		return false;
	}
	
	//通过response返回错误信息给前端
	private void write(HttpServletRequest request,HttpServletResponse response,String content) throws IOException{
		String origin = request.getHeader("Origin");
        response.setHeader("Access-Control-Allow-Origin", origin);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().write(content);
	}
}
