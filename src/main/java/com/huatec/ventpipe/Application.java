package com.huatec.ventpipe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class Application extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
	
	//支持tomcat war部署
	@Override
	protected SpringApplicationBuilder configure(
			SpringApplicationBuilder builder) {
		return builder.sources(Application.class);
	}

}
