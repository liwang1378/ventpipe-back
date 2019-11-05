package com.huatec.ventpipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huatec.ventpipe.dao.RolepermissionJPA;
import com.huatec.ventpipe.entity.Rolepermission;
import com.huatec.ventpipe.entity.User;
import com.huatec.ventpipe.enumerate.ResultEnum;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/rp")
@Slf4j
public class RolepermissionController {

	@Autowired
	private RolepermissionJPA jpa;
	
	@PostMapping("/save")
	@ApiOperation(value="角色权限修改接口",notes="根据roleid，先全部删除后再新增")
	public ResponseVo save(@RequestBody List<Rolepermission> rpList) {
		log.info("{}",rpList);
		if(rpList!=null && rpList.size()>0) {
			Integer roleId = rpList.get(0).getRoleid();
			jpa.deleteByRoleid(roleId);
			for(Rolepermission rolepermission : rpList) {
				jpa.saveAndFlush(rolepermission);
			}
			return ResponseVoUtil.success();
		}
		return ResponseVoUtil.error(ResultEnum.ERR_UNKNOWN.getCode(),ResultEnum.ERR_UNKNOWN.getMsg());
	}
	
	@GetMapping("/queryByRoleid/{roleid}")
	@ApiOperation(value="根据角色id查询接口",notes="根据roleid查询")
	public ResponseVo queryByRoleid(HttpSession session,@PathVariable Integer roleid) {
//		return ResponseVoUtil.success(jpa.findByRoleid(roleid));
		User user = (User) session.getAttribute("user_session");
		return ResponseVoUtil.success(jpa.findByRoleidAndCustomerid(roleid,user.getCustomer().getCustomerid()));
	}
	
}
