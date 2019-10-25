package com.huatec.ventpipe.controller;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.UserJPA;
import com.huatec.ventpipe.dto.UserDto;
import com.huatec.ventpipe.entity.Customer;
import com.huatec.ventpipe.entity.User;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserJPA userJPA;
	
	@GetMapping("/query")
	@ApiOperation(value="用户查询接口",notes="返回用户列表数据")
	public ResponseVo list(){
		return ResponseVoUtil.success(userJPA.findAll());
	}
	
	@RequestMapping("/save")
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

}
