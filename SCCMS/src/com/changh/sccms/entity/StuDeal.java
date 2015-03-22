package com.changh.sccms.entity;

import java.util.Date;

/**
 * StuDeal entity. @author MyEclipse Persistence Tools
 */

public class StuDeal implements java.io.Serializable {

	// Fields

	private Integer stuDealId;
	private Deal deal;
	private Integer id;
	private Integer stuDealStatus;
	private Date stuDealTime;
	private Integer stuId;
	private String stuUsername;
	private String stuName;
	private String stuCards;
	private String paytype;
	private String stuAddress;
	private String stuPhone;
	private String stuEmail;
	private String pkgName;

	// Constructors

	/** default constructor */
	public StuDeal() {
	}

	/** minimal constructor */
	public StuDeal(Integer stuDealId, Integer id) {
		this.stuDealId = stuDealId;
		this.id = id;
	}

	/** full constructor */
	public StuDeal(Integer stuDealId, Deal deal, Integer id,
			Integer stuDealStatus, Date stuDealTime, Integer stuId,
			String stuUsername, String stuName, String stuCards,
			String paytype, String stuAddress, String stuPhone,
			String stuEmail, String pkgName) {
		this.stuDealId = stuDealId;
		this.deal = deal;
		this.id = id;
		this.stuDealStatus = stuDealStatus;
		this.stuDealTime = stuDealTime;
		this.stuId = stuId;
		this.stuUsername = stuUsername;
		this.stuName = stuName;
		this.stuCards = stuCards;
		this.paytype = paytype;
		this.stuAddress = stuAddress;
		this.stuPhone = stuPhone;
		this.stuEmail = stuEmail;
		this.pkgName = pkgName;
	}

	// Property accessors

	public Integer getStuDealId() {
		return this.stuDealId;
	}

	public void setStuDealId(Integer stuDealId) {
		this.stuDealId = stuDealId;
	}

	public Deal getDeal() {
		return this.deal;
	}

	public void setDeal(Deal deal) {
		this.deal = deal;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStuDealStatus() {
		return this.stuDealStatus;
	}

	public void setStuDealStatus(Integer stuDealStatus) {
		this.stuDealStatus = stuDealStatus;
	}

	public Date getStuDealTime() {
		return this.stuDealTime;
	}

	public void setStuDealTime(Date stuDealTime) {
		this.stuDealTime = stuDealTime;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getStuUsername() {
		return this.stuUsername;
	}

	public void setStuUsername(String stuUsername) {
		this.stuUsername = stuUsername;
	}

	public String getStuName() {
		return this.stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuCards() {
		return this.stuCards;
	}

	public void setStuCards(String stuCards) {
		this.stuCards = stuCards;
	}

	public String getPaytype() {
		return this.paytype;
	}

	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}

	public String getStuAddress() {
		return this.stuAddress;
	}

	public void setStuAddress(String stuAddress) {
		this.stuAddress = stuAddress;
	}

	public String getStuPhone() {
		return this.stuPhone;
	}

	public void setStuPhone(String stuPhone) {
		this.stuPhone = stuPhone;
	}

	public String getStuEmail() {
		return this.stuEmail;
	}

	public void setStuEmail(String stuEmail) {
		this.stuEmail = stuEmail;
	}

	public String getPkgName() {
		return this.pkgName;
	}

	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}

}