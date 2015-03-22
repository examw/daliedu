package com.changh.sccms.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Deal entity. @author MyEclipse Persistence Tools
 */

public class Deal implements java.io.Serializable {

	// Fields
	private Integer dealId;
	private Integer id;
	private String dealName;
	private String dealContent;
	private Integer dealPkgId;
	private Date dealLastDate;

	// Constructors

	/** default constructor */
	public Deal() {
	}

	/** minimal constructor */
	public Deal(Integer dealId, Integer id, String dealName, String dealContent) {
		this.dealId = dealId;
		this.id = id;
		this.dealName = dealName;
		this.dealContent = dealContent;
	}

	/** full constructor */
	public Deal(Integer dealId, Integer id, String dealName,
			String dealContent, Integer dealPkgId) {
		this.dealId = dealId;
		this.id = id;
		this.dealName = dealName;
		this.dealContent = dealContent;
		this.dealPkgId = dealPkgId;
	}

	// Property accessors

	public Integer getDealId() {
		return this.dealId;
	}

	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDealName() {
		return this.dealName;
	}

	public void setDealName(String dealName) {
		this.dealName = dealName;
	}

	public String getDealContent() {
		return this.dealContent;
	}

	public void setDealContent(String dealContent) {
		this.dealContent = dealContent;
	}

	public Integer getDealPkgId() {
		return this.dealPkgId;
	}

	public void setDealPkgId(Integer dealPkgId) {
		this.dealPkgId = dealPkgId;
	}

	public Date getDealLastDate() {
		return dealLastDate;
	}

	public void setDealLastDate(Date dealLastDate) {
		this.dealLastDate = dealLastDate;
	}
}