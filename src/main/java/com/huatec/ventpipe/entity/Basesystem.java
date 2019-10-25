package com.huatec.ventpipe.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@NoArgsConstructor
@Data
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name="basesystem")
public class Basesystem {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer basesystemid;
	private String basename;
	private String remark;
	private Integer type;
	private Integer customerid;

}
