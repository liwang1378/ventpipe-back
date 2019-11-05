package com.huatec.ventpipe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.huatec.ventpipe.entity.Building;

public interface BuildingJPA extends JpaRepository<Building, Integer>,JpaSpecificationExecutor<Building> {
	Building findByCode(Integer codeId);
	List<Building> findByCustomeridOrUuidOrderByOrderseq(Integer customerid,Integer uuid);
	List<Building> findByParentuuid(Integer pid);
	Building findByCodeAndTypeAndCustomerid(Integer codeId, String type,Integer customerid);
	Building findByCodeAndType(Integer codeId, String type);
	void deleteByUuidOrParentuuid(Integer uuid, Integer pid);
	List<Building> findByType(String type);
	@Query(nativeQuery=true,value="SELECT * FROM building WHERE FIND_IN_SET(UUID, GET_PARENT_NODE(:uuid))")
	List<Building> createNavigator(@Param("uuid") Integer uuid);
	List<Building> findByTypeAndCustomerid(String type, Integer customerid);
}
