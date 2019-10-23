package com.huatec.ventpipe.dto;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data
public class UserDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer userid;
	private String loginname;
	private String password;
	private String username;
	private Integer usertype;
	private String telephone;
	private String period;
	private Integer activeflag;

}
