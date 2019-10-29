package com.huatec.ventpipe;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.alibaba.fastjson.JSON;
import com.huatec.ventpipe.dao.BuildingJPA;
import com.huatec.ventpipe.entity.Building;
import com.huatec.ventpipe.utils.ResponseVoUtil;
import com.huatec.ventpipe.utils.TreeUtils;

import lombok.extern.slf4j.Slf4j;
@SpringBootTest
@RunWith(SpringRunner.class)
@Slf4j
public class TreeTest {
	
	@Autowired
	private BuildingJPA buildingJPA;

	@Test
	public void test() {
		List<Building> list = buildingJPA.findByCustomeridOrUuidOrderByOrderseq(9,1);
		log.info("{}",list);
		//重新组装成树形数据结构
		log.info("{}",ResponseVoUtil.success(JSON.toJSON(TreeUtils.createTree(list))));
		
	}
}
