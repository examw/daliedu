package com.changh.sccms.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * CradeCategory entity. @author MyEclipse Persistence Tools
 */

public class GradeCategory implements java.io.Serializable {

	// Fields
	private Integer gtypeId;
	private Integer id;
	private String gtypeName;
	
	
	// Constructors
	/** default constructor */
	public GradeCategory() {
	}
	/** full constructor */
	public GradeCategory(Integer gtypeId, Integer id, String gtypeName) {
		this.gtypeId = gtypeId;
		this.id = id;
		this.gtypeName = gtypeName;
	}
	// Property accessors
	public Integer getGtypeId() {
		return this.gtypeId;
	}
	public void setGtypeId(Integer gtypeId) {
		this.gtypeId = gtypeId;
	}
	public Integer getId() {
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGtypeName() {
		return this.gtypeName;
	}
	public void setGtypeName(String gtypeName) {
		this.gtypeName = gtypeName;
	}
}