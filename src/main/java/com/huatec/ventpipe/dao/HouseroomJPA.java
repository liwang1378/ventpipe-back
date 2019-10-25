package com.huatec.ventpipe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huatec.ventpipe.entity.Houseroom;

public interface HouseroomJPA extends JpaRepository<Houseroom, Integer>{
	List<Houseroom> findByType(Integer id);
	List<Houseroom> findByParentid(Integer pid);
}
