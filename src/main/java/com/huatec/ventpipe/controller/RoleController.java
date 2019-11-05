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

import com.huatec.ventpipe.dao.RoleJPA;
import com.huatec.ventpipe.entity.Role;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/role")
@Slf4j
public class RoleController {

	@Autowired
	private RoleJPA roleJPA;
	
	@GetMapping("/query/{customerid}")
	@ApiOperation(value="角色查询接口",notes="返回角色列表数据")
	public ResponseVo query(@PathVariable Integer customerid){
		return ResponseVoUtil.success(roleJPA.findByCustomerid(customerid));
	}
	
	@PostMapping("/save")
	@ApiOperation(value="角色新增/修改接口",notes="有id则更新，无则新增")
	public ResponseVo save(@RequestBody Role role){
		log.info("{}",role);
		roleJPA.saveAndFlush(role);
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/delete/{id}")
	@ApiOperation(value="角色删除接口",notes="根据id，删除用户")
	public ResponseVo delete(@PathVariable Integer id){
		roleJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
}
