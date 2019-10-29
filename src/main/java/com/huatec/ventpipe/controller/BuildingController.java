package com.huatec.ventpipe.controller;

import io.swagger.annotations.ApiOperation;

import java.util.List;

import javax.transaction.Transactional;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.huatec.ventpipe.dao.BuildingJPA;
import com.huatec.ventpipe.entity.Building;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;
import com.huatec.ventpipe.utils.TreeUtils;

@RestController
@RequestMapping("/building")
@Slf4j
public class BuildingController {

	@Autowired
	private BuildingJPA buildingJPA;
	
	@GetMapping("/query")
	@ApiOperation(value="building查询接口",notes="building查询列表")
	public ResponseVo list(){
		return ResponseVoUtil.success(buildingJPA.findAll());
	}
	
	@GetMapping("/createNavigator/{uuid}")
	@ApiOperation(value="根据id,获取导航路径",notes="根据id,获取获取导航路径")
	public ResponseVo createNavigator(@PathVariable Integer uuid){
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/queryById/{id}")
	@ApiOperation(value="根据id,获取指定building接口",notes="根据id,获取指定building接口")
	public ResponseVo queryById(@PathVariable Integer id){
		return ResponseVoUtil.success(buildingJPA.findById(id).get());
	}
	
	@GetMapping("/queryByPid/{pid}")
	@ApiOperation(value="根据pid,查询所有子节点",notes="根据pid,查询所有子节点接口")
	public ResponseVo queryByPid(@PathVariable Integer pid){
		return ResponseVoUtil.success(buildingJPA.findByParentuuid(pid));
	}
	
	@PostMapping("/queryByType")
	@ApiOperation(value="根据type,查询所有节点",notes="根据type,查询所有节点接口")
	public ResponseVo queryByType(@RequestBody JSONObject jsonObject){
		log.info("{}",jsonObject);
		String type = jsonObject.get("type").toString();
		return ResponseVoUtil.success(buildingJPA.findByType(type));
	}
	
	@PostMapping("/save")
	@ApiOperation(value="building新增/修改接口",notes="有id，则修改，否则修改记录")
	public ResponseVo save(@RequestBody Building bd){
		log.info("{}",bd);
		Integer codeId = bd.getCode();
		String type = bd.getType();
		if(buildingJPA.findByCodeAndType(codeId,type)!=null){
			return ResponseVoUtil.error();
		}
		//更新排序
		if(bd.getCode()==null){
			Building building = buildingJPA.findById(bd.getUuid()).get();
			building.setOrderseq(bd.getOrderseq());
			return ResponseVoUtil.success();
		}else
			return ResponseVoUtil.success(buildingJPA.saveAndFlush(bd));
	}
	
	@GetMapping("/delete/{id}")
	@ApiOperation(value="building删除接口",notes="根据id,删除指定节点及其下的所有子节点")
	@Transactional
	public ResponseVo delete(@PathVariable(name="id")Integer id){
		buildingJPA.deleteByUuidOrParentuuid(id,id);
		return ResponseVoUtil.success();
	}
	
	@GetMapping("/treeList/{customerid}")
	@ApiOperation(value="building - 树形数据结构",notes="树形数据结构")
	public ResponseVo buildingList(@PathVariable Integer customerid) {
		List<Building> list = buildingJPA.findByCustomeridOrUuidOrderByOrderseq(customerid,1);
		log.info("{}",list);
		//重新组装成树形数据结构
		return ResponseVoUtil.success(TreeUtils.createTree(list));
	} 
}
