package com.changh.eschool.entity;

import java.util.Date;

/*
 * advice_content varchar(2000) not null,
	advice_addTime datetime not null,
	advice_appType int not null,
	username varchar(50),
	stu_id int
 */
public class AppAdvice {
	private Integer id;
	private Date adviceAddTime;
	private String adviceContent;
	private Integer appType;
	private String username;
	private Integer stuId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getAdviceAddTime() {
		return adviceAddTime;
	}
	public void setAdviceAddTime(Date adviceAddTime) {
		this.adviceAddTime = adviceAddTime;
	}
	public String getAdviceContent() {
		return adviceContent;
	}
	public void setAdviceContent(String adviceContent) {
		this.adviceContent = adviceContent;
	}
	public Integer getAppType() {
		return appType;
	}
	public void setAppType(Integer appType) {
		this.appType = appType;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	
}
