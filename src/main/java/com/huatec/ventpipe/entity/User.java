package com.huatec.ventpipe.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@NoArgsConstructor
@Data
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name="user")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer userid;
	private String loginname;
	private String password;
	@Transient
	private String password2;
	private String username;
	private Integer usertype;
//	private Integer customerid;
	private Integer roleid;
	
	//级联保存、删除
	@OneToOne(cascade = {CascadeType.PERSIST,CascadeType.REMOVE,CascadeType.REFRESH})
	@JoinColumn(name="customerid",referencedColumnName = "customerid")
	private Customer customer;
	
//	@Override
//	public String toString(){
//		if(customer ==null){
//			return String.format("User [ userid=%s,username=%s, pages=%s ]", userid,username,"<EMPTY>");
//		}
//		return String.format("User [ userid=%s,username=%s, telephone=%s ]", userid,username,"");
//	}

}
