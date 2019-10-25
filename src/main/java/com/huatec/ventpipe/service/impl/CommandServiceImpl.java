package com.huatec.ventpipe.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.huatec.ventpipe.dao.CommandJPA;
import com.huatec.ventpipe.dto.PageVo;
import com.huatec.ventpipe.dto.QueryRo;
import com.huatec.ventpipe.entity.Command;
import com.huatec.ventpipe.service.CommandService;

@Service
@Transactional
@Slf4j
public class CommandServiceImpl implements CommandService {
	
	@Autowired
	private CommandJPA commandJPA;

	@Override
	public PageVo<Command> query(QueryRo ro) {
		log.info("{}",ro);
		if(ro == null){
			ro = new QueryRo();
		}
		Sort sort = new Sort(Sort.Direction.DESC,"cmdid");
		Pageable pageable = PageRequest.of(ro.getPage(), ro.getSize(),sort);
		Page<Command> page = commandJPA.findAll(pageable);
		PageVo<Command> vo = new PageVo<Command>();
		vo.setTotal(page.getTotalElements());
		vo.setPage(page.getTotalPages());
		List<Command> list = new ArrayList<Command>();
		page.getContent().iterator().forEachRemaining(command->{
			list.add(command);
		});
		vo.setDataList(list);
		return vo;
	}

}
