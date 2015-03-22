package com.changh.sccms.entity;

import java.util.Date;

/**
 * TbLog entity. @author MyEclipse Persistence Tools
 */

public class TbLog implements java.io.Serializable {

	// Fields

	private Integer logId;
	private Integer admId;
	private String admUsername;
	private Date operatetime;
	private Integer operatetype;
	private String logconten;
	private String broswer;
	private String ip;

	// Constructors

	/** default constructor */
	public TbLog() {
	}

	/** minimal constructor */
	public TbLog(Integer logId, String admUsername, Date operatetime,
			Integer operatetype, String logconten, String broswer, String ip) {
		this.logId = logId;
		this.admUsername = admUsername;
		this.operatetime = operatetime;
		this.operatetype = operatetype;
		this.logconten = logconten;
		this.broswer = broswer;
		this.ip = ip;
	}

	/** full constructor */
	public TbLog(Integer logId, Integer admId, String admUsername,
			Date operatetime, Integer operatetype, String logconten,
			String broswer, String ip) {
		this.logId = logId;
		this.admId = admId;
		this.admUsername = admUsername;
		this.operatetime = operatetime;
		this.operatetype = operatetype;
		this.logconten = logconten;
		this.broswer = broswer;
		this.ip = ip;
	}

	// Property accessors

	public Integer getLogId() {
		return this.logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Integer getAdmId() {
		return this.admId;
	}

	public void setAdmId(Integer admId) {
		this.admId = admId;
	}

	public String getAdmUsername() {
		return this.admUsername;
	}

	public void setAdmUsername(String admUsername) {
		this.admUsername = admUsername;
	}

	public Date getOperatetime() {
		return this.operatetime;
	}

	public void setOperatetime(Date operatetime) {
		this.operatetime = operatetime;
	}

	public Integer getOperatetype() {
		return this.operatetype;
	}

	public void setOperatetype(Integer operatetype) {
		this.operatetype = operatetype;
	}

	public String getLogconten() {
		return this.logconten;
	}

	public void setLogconten(String logconten) {
		this.logconten = logconten;
	}

	public String getBroswer() {
		return this.broswer;
	}

	public void setBroswer(String broswer) {
		this.broswer = broswer;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}