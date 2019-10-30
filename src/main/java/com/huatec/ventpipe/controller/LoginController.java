package com.huatec.ventpipe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.UserJPA;
import com.huatec.ventpipe.entity.User;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@Slf4j
public class LoginController {

	@Autowired
	private UserJPA userJPA;
	
	@PostMapping("/login")
	public ResponseVo login(@RequestBody User user,HttpSession session){
		log.info("{}",user);
		User user2 = userJPA.findByLoginname(user.getLoginname());
		
		if(user2==null){
			return ResponseVoUtil.error();//用户不存在
		}else if(!user2.getPassword().equals(user.getPassword())){
			return ResponseVoUtil.error();//密码不正确
		}else if(user2.getCustomer()!=null && user2.getCustomer().getActiveflag()==2){
			return ResponseVoUtil.error(501, "当前账户和已被冻结，请重新激活!");
		}
		session.setAttribute("user_session", user2);
		log.info("{} - {}",user2,session.getAttribute("user_session"));
		session.setMaxInactiveInterval(0);
		return ResponseVoUtil.success(user2);
	}
	
	@GetMapping("/logout")
	public ResponseVo logout(HttpSession session){
		if(session!=null){
			session.removeAttribute("user_session");
			session.invalidate();
		}
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/current")
	public ResponseVo currentUser(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user_session");
		log.info("当前用户 - {} ",user);
		return ResponseVoUtil.success(user);
	}
}
