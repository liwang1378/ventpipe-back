package com.huatec.ventpipe.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name="building")
public class Building {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer uuid;
	private Integer code;
	private String name;
	private String type;
	private Integer parentuuid;
	private Integer isfile;
	private Integer customerid;
	private String orderseq;
	@Transient
	private List<Building> children;

}
