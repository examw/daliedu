package com.changh.sccms.entity;

import java.util.Date;

/**
 * StudyRecord entity. @author MyEclipse Persistence Tools
 */

public class StudyRecord implements java.io.Serializable {

	// Fields

	private Integer recordId;
	private Integer stuId;
	private Integer id;
	private Integer classId;
	private Date recordStartTime;
	private String recordIp;
	private Integer gradeId;
	private String recordName;
	private Integer countNum;

	// Constructors

	/** default constructor */
	public StudyRecord() {
	}

	/** full constructor */
	public StudyRecord(Integer recordId, Integer id,
			Integer classId, Date recordStartTime, String recordIp,
			Integer gradeId) {
		this.recordId = recordId;
		this.id = id;
		this.classId = classId;
		this.recordStartTime = recordStartTime;
		this.recordIp = recordIp;
		this.gradeId = gradeId;
	}

	// Property accessors

	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}



	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Date getRecordStartTime() {
		return this.recordStartTime;
	}

	public void setRecordStartTime(Date recordStartTime) {
		this.recordStartTime = recordStartTime;
	}

	public String getRecordIp() {
		return this.recordIp;
	}

	public void setRecordIp(String recordIp) {
		this.recordIp = recordIp;
	}

	public Integer getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getRecordName() {
		return recordName;
	}

	public void setRecordName(String recordName) {
		this.recordName = recordName;
	}

	public Integer getCountNum() {
		return countNum;
	}

	public void setCountNum(Integer countNum) {
		this.countNum = countNum;
	}
	
	//2014.08.01	可以试听数,与已经听课数
	public Integer haveNum,useNum;
	public Integer getHaveNum() {
		return haveNum;
	}
	public void setHaveNum(Integer haveNum) {
		this.haveNum = haveNum;
	}
	public Integer getUseNum() {
		return useNum;
	}
	public void setUseNum(Integer useNum) {
		this.useNum = useNum;
	}
}