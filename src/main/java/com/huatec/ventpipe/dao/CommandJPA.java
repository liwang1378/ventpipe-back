package com.huatec.ventpipe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.huatec.ventpipe.entity.Command;

public interface CommandJPA extends JpaRepository<Command, Integer> {

}
