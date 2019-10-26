package com.huatec.ventpipe.controller;

import java.util.List;

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
	
	@GetMapping("/query/{type}")
	public ResponseVo query(@PathVariable Integer type){
		if(type==1)
			return ResponseVoUtil.success(houseroomJPA.findByType(type));
		else{//房间
			List<Houseroom> houserooms = houseroomJPA.findByType(1);
			for(Houseroom room : houserooms){
				Integer id = room.getHouseroomid();
				List<Houseroom> children = houseroomJPA.findByParentid(id);
				room.setChildren(children);
				room.setBelong(room.getHsname());
			}
			return ResponseVoUtil.success(houserooms);
		}
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
