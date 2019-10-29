package com.huatec.ventpipe.controller;

import io.swagger.annotations.ApiOperation;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.CustomerJPA;
import com.huatec.ventpipe.entity.Customer;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerJPA customerJPA;
	
	@PostMapping("/alter")
	@ApiOperation(value="客户状态变更接口",notes="根据id，变更激活状态  1. 激活  2 非激活")
	public ResponseVo alter(@RequestBody Customer customer){
		Optional<Customer> cust = customerJPA.findById(customer.getCustomerid());
		if(cust.isPresent()){
			Customer cust2 = cust.get();
			cust2.setActiveflag(customer.getActiveflag());
			customerJPA.saveAndFlush(cust2);
			return ResponseVoUtil.success();
		}
		return ResponseVoUtil.error();
	}

}
