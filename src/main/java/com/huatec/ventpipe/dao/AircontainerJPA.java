package com.huatec.ventpipe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huatec.ventpipe.entity.Aircontainer;

public interface AircontainerJPA extends JpaRepository<Aircontainer,Integer>{

	List<Aircontainer> findByType(Integer type);

}
