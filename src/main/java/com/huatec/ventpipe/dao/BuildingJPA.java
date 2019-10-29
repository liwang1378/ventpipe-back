package com.huatec.ventpipe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.huatec.ventpipe.entity.Building;

public interface BuildingJPA extends JpaRepository<Building, Integer>,JpaSpecificationExecutor<Building> {
	Building findByCode(Integer codeId);
	List<Building> findByCustomeridOrUuidOrderByOrderseq(Integer customerid,Integer uuid);
	List<Building> findByParentuuid(Integer pid);
	Building findByCodeAndType(Integer codeId, String type);
	void deleteByUuidOrParentuuid(Integer uuid, Integer pid);
	List<Building> findByType(String type);
	
}
