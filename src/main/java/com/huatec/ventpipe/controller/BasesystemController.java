package com.huatec.ventpipe.controller;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.BasesystemJPA;
import com.huatec.ventpipe.entity.Basesystem;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/bs")
public class BasesystemController {
	
	@Autowired
	private BasesystemJPA bsJPA;

	@GetMapping("/query")
	@ApiOperation(value="基础系统查询接口",notes="基础系统列表")
	public ResponseVo list(){
		return ResponseVoUtil.success(bsJPA.findAll());
	}
	
	@PostMapping("/save")
	@ApiOperation(value="基础系统新增接口",notes="有id，有则新增，否则修改")
	public ResponseVo save(@RequestBody Basesystem bs){
		return ResponseVoUtil.success(bsJPA.saveAndFlush(bs));
	}
	
	@GetMapping("/delete/{id}")
	@ApiOperation(value="基础系统删除接口",notes="根据id，删除指定基础系统记录")
	public ResponseVo delete(@PathVariable(name="id")Integer id){
		bsJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/query/{type}")
	public ResponseVo queryByType(@PathVariable Integer type){
		return ResponseVoUtil.success(bsJPA.queryByType(type));
	}
}
