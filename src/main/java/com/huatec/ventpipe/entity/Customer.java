package com.huatec.ventpipe.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonIgnore;

@NoArgsConstructor
@Data
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name="customer")
public class Customer {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer customerid;
	private String custname;
	private String telephone;
	private String period;
	private Integer activeflag;
	
	@OneToOne(mappedBy = "customer")
	@JsonIgnore
	private User user;

	@Override
	public String toString(){
		if(user ==null){
			return String.format("Customer [ customerid=%s,custname=%s, pages=%s ]", customerid,custname,"<EMPTY>");
		}
		return String.format("Customer [ customerid=%s,custname=%s, loginname=%s ]", customerid,custname,"");
	}
}
