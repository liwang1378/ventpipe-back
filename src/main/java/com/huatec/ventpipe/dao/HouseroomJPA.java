package com.huatec.ventpipe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huatec.ventpipe.entity.Houseroom;

public interface HouseroomJPA extends JpaRepository<Houseroom, Integer>{
	List<Houseroom> findByTypeAndCustomerid(Integer id,Integer customerid);
	List<Houseroom> findByParentid(Integer pid);
	List<Houseroom> findByParentidAndType(Integer pid, int i);
}
