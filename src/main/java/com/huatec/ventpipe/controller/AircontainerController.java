package com.huatec.ventpipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.AircontainerJPA;
import com.huatec.ventpipe.entity.Aircontainer;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/ac")
public class AircontainerController {

	@Autowired
	private AircontainerJPA aircontainerJPA;
	
	@GetMapping("/query")
	public ResponseVo list(){
		return ResponseVoUtil.success(aircontainerJPA.findAll());
	}
	
	@RequestMapping("/save")
	public ResponseVo save(@RequestBody Aircontainer ac){
		return ResponseVoUtil.success(aircontainerJPA.saveAndFlush(ac));
	}
	
	@GetMapping("/delete/{id}")
	public ResponseVo delete(@PathVariable(name="id")Integer id){
		aircontainerJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
}
