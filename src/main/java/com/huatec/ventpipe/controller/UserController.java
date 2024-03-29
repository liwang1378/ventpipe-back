package com.huatec.ventpipe.controller;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.UserJPA;
import com.huatec.ventpipe.dto.UserDto;
import com.huatec.ventpipe.entity.Customer;
import com.huatec.ventpipe.entity.User;
import com.huatec.ventpipe.enumerate.ResultEnum;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {
	
	@Autowired
	private UserJPA userJPA;
	
	@GetMapping("/query")
	@ApiOperation(value="用户查询接口",notes="返回用户列表数据")
	public ResponseVo list(){
		return ResponseVoUtil.success(userJPA.findAll());
	}
	
	@PostMapping("/save")
	@ApiOperation(value="用户新增/修改接口",notes="有id则更新，无则新增")
	public ResponseVo save(@RequestBody UserDto dto){
		User user = null;
		if(dto.getUserid()!=null){
			user = userJPA.getOne(dto.getUserid());
			user.setLoginname(dto.getLoginname());
			user.setPassword(dto.getPassword());
			user.setUsername(dto.getUsername());
			Customer customer = user.getCustomer();
			customer.setCustname(dto.getUsername());
			customer.setTelephone(dto.getTelephone());
			customer.setPeriod(dto.getPeriod());
		}else{
			user = new User();
			user.setLoginname(dto.getLoginname());
			user.setPassword(dto.getPassword());
			user.setUsername(dto.getUsername());
			user.setUsertype(dto.getUsertype());
			Customer customer = new Customer();
			customer.setCustname(dto.getUsername());
			customer.setTelephone(dto.getTelephone());
			customer.setPeriod(dto.getPeriod());
			customer.setActiveflag(dto.getActiveflag());
			user.setCustomer(customer);
		}
		return ResponseVoUtil.success(userJPA.save(user));
	}
	
	@GetMapping("/delete/{id}")
	@ApiOperation(value="用户删除接口",notes="根据id，删除用户")
	public ResponseVo delete(@PathVariable(name="id")Integer id){
		userJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
	
	@PostMapping("/reset")
	@ApiOperation(value="用户密码修改接口",notes="根据id，修改用户密码")
	public ResponseVo reset(@RequestBody User user){
		log.info("{}",user);
		int id = user.getUserid();
		if(userJPA.findById(id).isPresent()){
			User currentUser = userJPA.findById(id).get();
			if(user.getPassword().equals(currentUser.getPassword())){
				currentUser.setPassword(user.getPassword2());
				userJPA.saveAndFlush(currentUser);
				return ResponseVoUtil.success();
			}
			return ResponseVoUtil.error(ResultEnum.ERR_UNKNOWN.getCode(),ResultEnum.ERR_UNKNOWN.getMsg());
		}
		return ResponseVoUtil.error(ResultEnum.ERR_UNKNOWN.getCode(),ResultEnum.ERR_UNKNOWN.getMsg());
	}

}
