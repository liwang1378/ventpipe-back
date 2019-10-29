package com.huatec.ventpipe.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name="rolepermission")
public class Rolepermission {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer rolepermissionid;
	private Integer roleid;
	private Integer uuid;
	private Integer customerid;

}
