package com.huatec.ventpipe.handler;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huatec.ventpipe.enumerate.ResultEnum;
import com.huatec.ventpipe.utils.ResponseVo;
import com.huatec.ventpipe.utils.ResponseVoUtil;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
	
	@ExceptionHandler(value=Exception.class)
	@ResponseBody
	public ResponseVo handle(Exception e) {
		e.printStackTrace();
		log.error("【系统异常】 - {}" , e.getLocalizedMessage());
		return ResponseVoUtil.error(ResultEnum.ERR_UNKNOWN.getCode(),ResultEnum.ERR_UNKNOWN.getMsg());
	}
}
