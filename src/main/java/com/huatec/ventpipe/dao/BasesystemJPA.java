package com.huatec.ventpipe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huatec.ventpipe.entity.Basesystem;

public interface BasesystemJPA extends JpaRepository<Basesystem, Integer>{
	List<Basesystem> queryByCustomerid(Integer customerid);
	List<Basesystem> queryByTypeAndCustomerid(Integer type,Integer customerid);
//	List<Houseroom> findByType(Integer id);
//	List<Houseroom> findByParentid(Integer pid);
}
