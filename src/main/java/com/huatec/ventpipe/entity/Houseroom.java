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
@Table(name="houseroom")
public class Houseroom {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer houseroomid;
	private String hsname;
	private Integer type;
	private String address;
	private Integer parentid;
	private Integer customerid;
	@Transient
	private String belong;
	@Transient
	private List<Houseroom> children;
	
}
