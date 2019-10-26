package com.huatec.ventpipe.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.huatec.ventpipe.entity.Role;

public interface RoleJPA extends JpaRepository<Role, Integer>,JpaSpecificationExecutor<Role> {

}
