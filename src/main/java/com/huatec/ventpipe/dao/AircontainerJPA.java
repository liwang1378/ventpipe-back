package com.huatec.ventpipe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huatec.ventpipe.entity.Aircontainer;

public interface AircontainerJPA extends JpaRepository<Aircontainer,Integer>{
	List<Aircontainer> findByCustomerid(Integer customerid);
	List<Aircontainer> findByType(Integer type);
	List<Aircontainer> findByTypeAndCustomerid(Integer type,Integer customerid);

}
