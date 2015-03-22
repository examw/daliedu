package com.changh.eschool.entity;

import java.util.Date;
import java.util.List;

/**
 * ClassDetail entity. @author MyEclipse Persistence Tools
 */

public class ClassDetail implements java.io.Serializable {

	// Fields

	private Integer classId;
	//private Grade grade;
	private Integer gradeId;
	private Integer id;
	private String classTitle;
	private Integer classOrderId;
	private Integer classYear;
	private Date classAddTime;
	private Date classOpenTime;
	private Integer classIfFree;
	private Integer admId;
	private String classHdUrl;
	private String classTriUrl;
	private String classAudio;
	private Integer classTime;
	private Integer tchId;

	
	//方便数据传送
	private int classMin;
	private int classSec;
	private List<Lecture> lect;
	/** default constructor */
	public ClassDetail() {
	}

	/** minimal constructor */
	public ClassDetail(Integer classId, Integer gradeId, Integer id,
			String classTitle, Integer classOrderId, Integer classYear,
			Date classAddTime, Date classOpenTime, Integer admId,
			String classHdUrl, String classTriUrl, String classAudio,
			Integer classTime) {
		this.classId = classId;
		//this.grade = grade;
		this.gradeId=gradeId;
		this.id = id;
		this.classTitle = classTitle;
		this.classOrderId = classOrderId;
		this.classYear = classYear;
		this.classAddTime = classAddTime;
		this.classOpenTime = classOpenTime;
		this.admId = admId;
		this.classHdUrl = classHdUrl;
		this.classTriUrl = classTriUrl;
		this.classAudio = classAudio;
		this.classTime = classTime;
	}

	/** full constructor */
	public ClassDetail(Integer classId, Integer gradeId, Integer id,
			String classTitle, Integer classOrderId, Integer classYear,
			Date classAddTime, Date classOpenTime, Integer classIfFree,
			Integer admId, String classHdUrl, String classTriUrl,
			String classAudio, Integer classTime) {
		this.classId = classId;
		//this.grade = grade;
		this.gradeId=gradeId;
		this.id = id;
		this.classTitle = classTitle;
		this.classOrderId = classOrderId;
		this.classYear = classYear;
		this.classAddTime = classAddTime;
		this.classOpenTime = classOpenTime;
		this.classIfFree = classIfFree;
		this.admId = admId;
		this.classHdUrl = classHdUrl;
		this.classTriUrl = classTriUrl;
		this.classAudio = classAudio;
		this.classTime = classTime;
		//this.lectures = lectures;
	}

	// Property accessors

	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

/*	public Grade getGrade() {
		return this.grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	*/
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClassTitle() {
		return this.classTitle;
	}

	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}

	public Integer getClassOrderId() {
		return this.classOrderId;
	}

	public void setClassOrderId(Integer classOrderId) {
		this.classOrderId = classOrderId;
	}

	public Integer getClassYear() {
		return this.classYear;
	}

	public void setClassYear(Integer classYear) {
		this.classYear = classYear;
	}

	public Date getClassAddTime() {
		return this.classAddTime;
	}

	public void setClassAddTime(Date classAddTime) {
		this.classAddTime = classAddTime;
	}

	public Date getClassOpenTime() {
		return this.classOpenTime;
	}

	public void setClassOpenTime(Date classOpenTime) {
		this.classOpenTime = classOpenTime;
	}

	public Integer getClassIfFree() {
		return this.classIfFree;
	}

	public void setClassIfFree(Integer classIfFree) {
		this.classIfFree = classIfFree;
	}

	public Integer getAdmId() {
		return this.admId;
	}

	public void setAdmId(Integer admId) {
		this.admId = admId;
	}

	public String getClassHdUrl() {
		return this.classHdUrl;
	}

	public void setClassHdUrl(String classHdUrl) {
		this.classHdUrl = classHdUrl;
	}

	public String getClassTriUrl() {
		return this.classTriUrl;
	}

	public void setClassTriUrl(String classTriUrl) {
		this.classTriUrl = classTriUrl;
	}

	public String getClassAudio() {
		return this.classAudio;
	}

	public void setClassAudio(String classAudio) {
		this.classAudio = classAudio;
	}

	public Integer getClassTime() {
		return this.classTime;
	}

	public void setClassTime(Integer classTime) {
		this.classTime = classTime;
	}

	/*public Set getLectures() {
		return this.lectures;
	}

	public void setLectures(Set lectures) {
		this.lectures = lectures;
	}
*/
	public int getClassMin() {
		return classMin;
	}

	public void setClassMin(int classMin) {
		this.classMin = classMin;
	}

	public int getClassSec() {
		return classSec;
	}

	public void setClassSec(int classSec) {
		this.classSec = classSec;
	}

	public Integer getTchId() {
		return tchId;
	}

	public void setTchId(Integer tchId) {
		this.tchId = tchId;
	}

	public Integer getGradeId() {
		return gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public List<Lecture> getLect() {
		return lect;
	}

	public void setLect(List<Lecture> lect) {
		this.lect = lect;
	}
	
	//2014.08.01
	private Integer listenNum;	//允许听课次数
	public Integer getListenNum() {
		return listenNum;
	}
	public void setListenNum(Integer listenNum) {
		this.listenNum = listenNum;
	}
}