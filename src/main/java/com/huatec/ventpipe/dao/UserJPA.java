package com.huatec.ventpipe.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.huatec.ventpipe.entity.User;

public interface UserJPA extends JpaRepository<User, Integer>,JpaSpecificationExecutor<User> {

	User findByLoginname(String loginname);

}
