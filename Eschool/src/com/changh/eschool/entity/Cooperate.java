package com.changh.eschool.entity;

import java.util.Date;

/**
 * Cooperate entity. @author MyEclipse Persistence Tools
 */

public class Cooperate implements java.io.Serializable {

	// Fields

	private Integer id;
	private String coopName;
	private String coopKey;
	private String coopUrl;
	private Date updatetime;
	private Date addtime;
	private String coopPhone;
	private String coopQq;
	private String coopEmail;

	// Constructors

	/** default constructor */
	public Cooperate() {
	}

	/** minimal constructor */
	public Cooperate(String coopKey, String coopUrl) {
		this.coopKey = coopKey;
		this.coopUrl = coopUrl;
	}

	/** full constructor */
	public Cooperate(String coopName, String coopKey, String coopUrl,
			Date updatetime, Date addtime, String coopPhone, String coopQq,
			String coopEmail) {
		this.coopName = coopName;
		this.coopKey = coopKey;
		this.coopUrl = coopUrl;
		this.updatetime = updatetime;
		this.addtime = addtime;
		this.coopPhone = coopPhone;
		this.coopQq = coopQq;
		this.coopEmail = coopEmail;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCoopName() {
		return this.coopName;
	}

	public void setCoopName(String coopName) {
		this.coopName = coopName;
	}

	public String getCoopKey() {
		return this.coopKey;
	}

	public void setCoopKey(String coopKey) {
		this.coopKey = coopKey;
	}

	public String getCoopUrl() {
		return this.coopUrl;
	}

	public void setCoopUrl(String coopUrl) {
		this.coopUrl = coopUrl;
	}

	public Date getUpdatetime() {
		return this.updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Date getAddtime() {
		return this.addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public String getCoopPhone() {
		return this.coopPhone;
	}

	public void setCoopPhone(String coopPhone) {
		this.coopPhone = coopPhone;
	}

	public String getCoopQq() {
		return this.coopQq;
	}

	public void setCoopQq(String coopQq) {
		this.coopQq = coopQq;
	}

	public String getCoopEmail() {
		return this.coopEmail;
	}

	public void setCoopEmail(String coopEmail) {
		this.coopEmail = coopEmail;
	}

}