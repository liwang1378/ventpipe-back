package com.huatec.ventpipe.controller;

import io.swagger.annotations.ApiOperation;

import java.util.List;

import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.HouseroomJPA;
import com.huatec.ventpipe.entity.Houseroom;
import com.huatec.ventpipe.entity.User;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@RestController
@RequestMapping("/hs")
@Slf4j
public class HouseroomController {

	@Autowired
	private HouseroomJPA houseroomJPA;
	
	@GetMapping("/query/{type}")
	@ApiOperation(value="楼栋/房间查询接口",notes="根据type（1 楼栋/2 房间），查询列表数据")
	public ResponseVo query(HttpSession session,@PathVariable Integer type){
		User user = (User) session.getAttribute("user_session");
		Integer customerid = user.getCustomer().getCustomerid();
		if(type==1)
			return ResponseVoUtil.success(houseroomJPA.findByTypeAndCustomerid(type,customerid));
		else{//房间
			List<Houseroom> houserooms = houseroomJPA.findByTypeAndCustomerid(1,customerid);
			for(Houseroom room : houserooms){
				Integer id = room.getHouseroomid();
				List<Houseroom> children = houseroomJPA.findByParentid(id);
				room.setChildren(children);
				room.setBelong(room.getHsname());
			}
			return ResponseVoUtil.success(houserooms);
		}
	}
	
	@PostMapping("/save")
	@ApiOperation(value="楼栋/房间新增接口",notes="有id，有则新增，否则修改")
	public ResponseVo save(@RequestBody Houseroom houseroom){
		log.info("{}",houseroom);
		houseroomJPA.saveAndFlush(houseroom);
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/delete/{id}")
	@ApiOperation(value="楼栋/房间删除接口",notes="根据id，删除楼栋/房间")
	public ResponseVo delete(@PathVariable Integer id){
		houseroomJPA.deleteById(id);
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/queryByPid/{pid}")
	@ApiOperation(value="查询指定楼栋下所有房间接口",notes="查询指定楼栋下所有房间列表")
	public ResponseVo queryByPid(@PathVariable Integer pid){
		List<Houseroom> list = houseroomJPA.findByParentidAndType(pid,2);
		return ResponseVoUtil.success(list);
	}
}
