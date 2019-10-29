package com.huatec.ventpipe.controller;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.CommandJPA;
import com.huatec.ventpipe.dto.QueryRo;
import com.huatec.ventpipe.entity.Command;
import com.huatec.ventpipe.service.CommandService;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RequestMapping("/command")
@RestController
public class CommandController {

	@Autowired
	private CommandJPA commandJPA;
	@Autowired
	private CommandService commandService;
	
	@PostMapping("/query")
	@ApiOperation(value="报错列表接口",notes="分页查询")
	public ResponseVo query(@RequestBody QueryRo ro){
		return ResponseVoUtil.success(commandService.query(ro));
	}
	
	@PostMapping("/save")
	@ApiOperation(value="报错新增/修改接口",notes="有id，有则新增，否则修改")
	public ResponseVo save(@RequestBody Command command){
		return ResponseVoUtil.success(commandJPA.saveAndFlush(command));
	}
	
	@GetMapping("/delete/{id}")
	@ApiOperation(value="报错删除",notes="根据id，删除指定报错记录")
	public ResponseVo delete(@PathVariable Integer id){
		commandJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
}
