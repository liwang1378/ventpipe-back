package com.huatec.ventpipe.controller;

import javax.servlet.http.HttpSession;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.AircontainerJPA;
import com.huatec.ventpipe.entity.Aircontainer;
import com.huatec.ventpipe.entity.User;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/ac")
public class AircontainerController {

	@Autowired
	private AircontainerJPA aircontainerJPA;
	
	@GetMapping("/query")
	@ApiOperation(value="aircontainer查询接口",notes="aircontainer查询列表")
	public ResponseVo list(HttpSession session){
		User user = (User) session.getAttribute("user_session");
		Integer customerid = user.getCustomer().getCustomerid();
		return ResponseVoUtil.success(aircontainerJPA.findByCustomerid(customerid));
	}
	
	@GetMapping("/queryByType/{type}")
	@ApiOperation(value="根据设备类型,查询所属客户下的aircontainer接口",notes="根据设备类型,查询aircontainer列表接口")
	public ResponseVo queryByType(HttpSession session,@PathVariable Integer type){
		User user = (User) session.getAttribute("user_session");
		Integer customerid = user.getCustomer().getCustomerid();
		return ResponseVoUtil.success(aircontainerJPA.findByTypeAndCustomerid(type,customerid));
	}
	
	@PostMapping("/save")
	@ApiOperation(value="aircontainer新增/修改接口",notes="有id，则修改，否则修改记录")
	public ResponseVo save(@RequestBody Aircontainer ac){
		return ResponseVoUtil.success(aircontainerJPA.saveAndFlush(ac));
	}
	
	@GetMapping("/delete/{id}")
	@ApiOperation(value="aircontainer删除接口",notes="根据id,删除指定记录")
	public ResponseVo delete(@PathVariable(name="id")Integer id){
		aircontainerJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
}
