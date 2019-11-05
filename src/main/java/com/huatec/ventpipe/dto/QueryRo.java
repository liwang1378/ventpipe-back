package com.huatec.ventpipe.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class QueryRo {
	private Integer page = 0;
	private Integer size = 10;
	private Integer customerid;

}
