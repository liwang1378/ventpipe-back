package com.huatec.ventpipe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huatec.ventpipe.entity.Customer;

public interface CustomerJPA extends JpaRepository<Customer, Integer>{

}
