package com.changh.sccms.entity;

import java.util.List;

/**
 * Province entity. @author MyEclipse Persistence Tools
 */

public class Province implements java.io.Serializable {

	// Fields

	private Integer provinceId;
	private String provinceName;
	private Integer parentId;
	private Integer provinceCode;
	private List<Province> children;
	

	// Constructors

	/** default constructor */
	public Province() {
	}

	/** minimal constructor */
	public Province(String provinceName) {
		this.provinceName = provinceName;
	}

	/** full constructor */
	public Province(String provinceName, Integer parentId, Integer provinceCode) {
		this.provinceName = provinceName;
		this.parentId = parentId;
		this.provinceCode = provinceCode;
	}

	// Property accessors

	public Integer getProvinceId() {
		return this.provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
		return this.provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getProvinceCode() {
		return this.provinceCode;
	}

	public void setProvinceCode(Integer provinceCode) {
		this.provinceCode = provinceCode;
	}

	public List<Province> getChildren() {
		return children;
	}

	public void setChildren(List<Province> children) {
		this.children = children;
	}

}