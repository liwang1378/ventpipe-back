package com.huatec.ventpipe.controller;

import io.swagger.annotations.ApiOperation;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/index")
public class Index {
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	@ApiOperation(value="测试接口",notes="测试swagger接口文档工具")
	public String index(){
		return "springboot test";
	}

}
