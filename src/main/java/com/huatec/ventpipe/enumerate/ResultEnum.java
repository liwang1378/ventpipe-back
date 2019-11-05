package com.huatec.ventpipe.enumerate;

import lombok.Getter;

public enum ResultEnum {
	ERR_UNKNOWN(5000,"未知错误"),
	ERR_EXIT(5001,"节点已存在"),
	UNKNOWNACCOUNT(5002, "未知账户"),
	INCORRECTCREDENTIALS(5003, "密码错误"),
	LOCKED(5004, "账号被禁用"),
	EXPIRE(5005, "账号已过期"),
	ERR_NOPERM(5006,"无访问权限");
	@Getter
	private Integer code;
	@Getter
	private String msg;
	
	private ResultEnum(Integer code,String msg){
		this.code = code;
		this.msg = msg;
	}

}
