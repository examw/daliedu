package com.changh.sccms.entity;

import java.util.Date;

/**
 * Lecture entity. @author MyEclipse Persistence Tools
 */

public class Lecture implements java.io.Serializable {

	// Fields

	private Integer lectId;
	//private ClassDetail classDetail;
	private Integer id;
	private Integer classId;
	private String lectContent;
	private String lectTitle;

	private Date lectAddTime;
	private Integer lectOrderId;
	private Integer lectTimePoint;
	
	//方便数据的输入
	private Integer lectMin;
	private Integer lectSec;

	// Constructors

	/** default constructor */
	public Lecture() {
	}

	/** full constructor */
	public Lecture(Integer lectId, Integer classId, Integer id,
			String lectContent, Date lectAddTime, Integer lectOrderId,
			Integer lectTimePoint) {
		this.lectId = lectId;
		//this.classDetail = classDetail;
		this.classId = classId;
		this.id = id;
		this.lectContent = lectContent;
		this.lectAddTime = lectAddTime;
		this.lectOrderId = lectOrderId;
		this.lectTimePoint = lectTimePoint;
	}

	// Property accessors

	public Integer getLectId() {
		return this.lectId;
	}

	public void setLectId(Integer lectId) {
		this.lectId = lectId;
	}

/*	public ClassDetail getClassDetail() {
		return this.classDetail;
	}

	public void setClassDetail(ClassDetail classDetail) {
		this.classDetail = classDetail;
	}
*/
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLectContent() {
		return this.lectContent;
	}

	public void setLectContent(String lectContent) {
		this.lectContent = lectContent;
	}

	public Date getLectAddTime() {
		return this.lectAddTime;
	}

	public void setLectAddTime(Date lectAddTime) {
		this.lectAddTime = lectAddTime;
	}

	public Integer getLectOrderId() {
		return this.lectOrderId;
	}

	public void setLectOrderId(Integer lectOrderId) {
		this.lectOrderId = lectOrderId;
	}

	public Integer getLectTimePoint() {
		return lectTimePoint;
	}

	public void setLectTimePoint(Integer lectTimePoint) {
		this.lectTimePoint = lectTimePoint;
	}
	public Integer getLectMin1(){
		return lectMin;
	}
	public Integer getLectMin() {
		return this.lectTimePoint/1000/60;
	}

	public void setLectMin(Integer lectMin) {
		this.lectMin = lectMin;
	}
	public Integer getLectSec1(){
		return lectSec;
	}
	public Integer getLectSec() {
		return this.lectTimePoint/1000%60;
	}

	public void setLectSec(Integer lectSec) {
		this.lectSec = lectSec;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public String getLectTitle() {
		return lectTitle;
	}

	public void setLectTitle(String lectTitle) {
		this.lectTitle = lectTitle;
	}

}