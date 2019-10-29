package com.huatec.ventpipe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.huatec.ventpipe.entity.Rolepermission;

public interface RolepermissionJPA extends JpaRepository<Rolepermission, Integer>,JpaSpecificationExecutor<Rolepermission>{

	void deleteByRoleid(Integer roleId);

	List<Rolepermission> findByRoleid(Integer roleid);

}
