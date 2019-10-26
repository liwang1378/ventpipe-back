package com.huatec.ventpipe.controller;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping("/query")
	public ResponseVo query(){
		return ResponseVoUtil.success(roleJPA.findAll());
	}
	
	@RequestMapping("/save")
	public ResponseVo save(@RequestBody Role role){
		log.info("{}",role);
		roleJPA.saveAndFlush(role);
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/delete/{id}")
	public ResponseVo delete(@PathVariable Integer id){
		roleJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
}
