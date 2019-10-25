package com.huatec.ventpipe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huatec.ventpipe.entity.Basesystem;

public interface BasesystemJPA extends JpaRepository<Basesystem, Integer>{
//	List<Houseroom> findByType(Integer id);
//	List<Houseroom> findByParentid(Integer pid);
}
