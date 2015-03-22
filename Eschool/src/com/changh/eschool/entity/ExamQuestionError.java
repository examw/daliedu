package com.changh.eschool.entity;

import java.util.Date;

/**
 * TbQuestionError entity. @author MyEclipse Persistence Tools
 */

public class ExamQuestionError implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer paperId;
	private Integer questId;
	private String stuUserName;
	private Date errorAddTime;
	private Integer errorType;
	private String errorContent;
	private Integer errorStatus;
	private Date errorDealTime;
	private String errorDealPerson;
	private String type;
	private String status;

	// Constructors

	/** default constructor */
	public ExamQuestionError() {
	}

	/** minimal constructor */
	public ExamQuestionError(Integer id, Integer questId, Integer errorType,
			Integer errorStatus) {
		this.id = id;
		this.questId = questId;
		this.errorType = errorType;
		this.errorStatus = errorStatus;
	}

	/** full constructor */
	public ExamQuestionError(Integer id, Integer paperId, Integer questId,
			String stuUserName, Date errorAddTime, Integer errorType,
			String errorContent, Integer errorStatus, Date errorDealTime,
			String errorDealPerson) {
		this.id = id;
		this.paperId = paperId;
		this.questId = questId;
		this.stuUserName = stuUserName;
		this.errorAddTime = errorAddTime;
		this.errorType = errorType;
		this.errorContent = errorContent;
		this.errorStatus = errorStatus;
		this.errorDealTime = errorDealTime;
		this.errorDealPerson = errorDealPerson;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPaperId() {
		return this.paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public Integer getQuestId() {
		return this.questId;
	}

	public void setQuestId(Integer questId) {
		this.questId = questId;
	}

	public String getStuUserName() {
		return this.stuUserName;
	}

	public void setStuUserName(String stuUserName) {
		this.stuUserName = stuUserName;
	}

	public Date getErrorAddTime() {
		return this.errorAddTime;
	}

	public void setErrorAddTime(Date errorAddTime) {
		this.errorAddTime = errorAddTime;
	}

	public Integer getErrorType() {
		return this.errorType;
	}

	public void setErrorType(Integer errorType) {
		this.errorType = errorType;
	}

	public String getErrorContent() {
		return this.errorContent;
	}

	public void setErrorContent(String errorContent) {
		this.errorContent = errorContent;
	}

	public Integer getErrorStatus() {
		return this.errorStatus;
	}

	public void setErrorStatus(Integer errorStatus) {
		this.errorStatus = errorStatus;
	}

	public Date getErrorDealTime() {
		return this.errorDealTime;
	}

	public void setErrorDealTime(Date errorDealTime) {
		this.errorDealTime = errorDealTime;
	}

	public String getErrorDealPerson() {
		return this.errorDealPerson;
	}

	public void setErrorDealPerson(String errorDealPerson) {
		this.errorDealPerson = errorDealPerson;
	}

	public String getType() {
		switch(errorType){
		case 1:return "错别字";
		case 2:return "答案有误";
		case 3:return "图片模糊";
		case 4:return "答案有异议";
		default:return "其他";
		}
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return errorStatus==0?"未处理":"已处理";
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}