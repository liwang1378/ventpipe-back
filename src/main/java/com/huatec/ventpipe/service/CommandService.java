package com.huatec.ventpipe.service;

import com.huatec.ventpipe.dto.PageVo;
import com.huatec.ventpipe.dto.QueryRo;
import com.huatec.ventpipe.entity.Command;

public interface CommandService {
	PageVo<Command> query(QueryRo ro);

}
