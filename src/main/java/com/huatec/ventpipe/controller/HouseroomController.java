package com.huatec.ventpipe.controller;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.HouseroomJPA;
import com.huatec.ventpipe.entity.Houseroom;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/hs")
@Slf4j
public class HouseroomController {

	@Autowired
	private HouseroomJPA houseroomJPA;
	
	@GetMapping("/query")
	public ResponseVo query(){
		return ResponseVoUtil.success(houseroomJPA.findAll());
	}
	
	@RequestMapping("/save")
	public ResponseVo save(@RequestBody Houseroom houseroom){
		log.info("{}",houseroom);
		houseroomJPA.saveAndFlush(houseroom);
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/delete/{id}")
	public ResponseVo delete(@PathVariable Integer id){
		houseroomJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
}
