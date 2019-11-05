package com.huatec.ventpipe.controller;

import java.text.ParseException;

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
import com.huatec.ventpipe.enumerate.ResultEnum;
import com.huatec.ventpipe.utils.DateUtils;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@Slf4j
public class LoginController {

	@Autowired
	private UserJPA userJPA;
	
	@PostMapping("/login")
	public ResponseVo login(@RequestBody User user,HttpSession session) throws ParseException{
		log.info("{}",user);
		User user2 = userJPA.findByLoginname(user.getLoginname());
		
		if(user2==null){
			return ResponseVoUtil.error(ResultEnum.UNKNOWNACCOUNT.getCode(),ResultEnum.UNKNOWNACCOUNT.getMsg());//用户不存在
		}else if(!user2.getPassword().equals(user.getPassword())){
			return ResponseVoUtil.error(ResultEnum.INCORRECTCREDENTIALS.getCode(),ResultEnum.INCORRECTCREDENTIALS.getMsg());//密码不正确
		}else if(user2.getCustomer()!=null && user2.getCustomer().getActiveflag()==2){
			return ResponseVoUtil.error(ResultEnum.LOCKED.getCode(),ResultEnum.LOCKED.getMsg());
		}else if(user2.getCustomer()!=null && DateUtils.compare(
				user2.getCustomer().getPeriod())<0){
			return ResponseVoUtil.error(ResultEnum.EXPIRE.getCode(),ResultEnum.EXPIRE.getMsg());
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
