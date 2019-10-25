package com.huatec.ventpipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	public ResponseVo list(){
		return ResponseVoUtil.success(bsJPA.findAll());
	}
	
	@RequestMapping("/save")
	public ResponseVo save(@RequestBody Basesystem bs){
		return ResponseVoUtil.success(bsJPA.saveAndFlush(bs));
	}
	
	@GetMapping("/delete/{id}")
	public ResponseVo delete(@PathVariable(name="id")Integer id){
		bsJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
}
