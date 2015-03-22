package com.changh.sccms.entity;

import java.util.Date;

/**
 * Grade entity. @author MyEclipse Persistence Tools
 */

public class Grade implements java.io.Serializable {

	// Fields

	private Integer gradeId;
	private GradeCategory gradeCategory;
	private ExamCategory examCategory;
	private Integer id;
	private Integer tchId;
	private Integer gradeTime;
	private double gradeOPrice;
	private double gradeRPrice;
	private Integer gradeSingle;
	private Date gradeAddTime;
	private Integer admId;
	private Date gradeDueTime;
	private Integer dealId;
	private String gradeRemark;
	
	//方便输出
	private String name;
	private String tchName;
	private String text;
	// Constructors
	
	/** default constructor */
	public Grade() {
	}

	// Property accessors

	public Integer getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	/*public GradeCategory getgradeCategory() {
		return this.gradeCategory;
	}

	public void setgradeCategory(GradeCategory gradeCategory) {
		this.gradeCategory = gradeCategory;
	}*/

	public ExamCategory getExamCategory() {
		return this.examCategory;
	}

	public void setExamCategory(ExamCategory examCategory) {
		this.examCategory = examCategory;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGradeTime() {
		return this.gradeTime;
	}

	public void setGradeTime(Integer gradeTime) {
		this.gradeTime = gradeTime;
	}

	public double getGradeOPrice() {
		return this.gradeOPrice;
	}

	public void setGradeOPrice(double gradeOPrice) {
		this.gradeOPrice = gradeOPrice;
	}

	public double getGradeRPrice() {
		return this.gradeRPrice;
	}

	public void setGradeRPrice(double gradeRPrice) {
		this.gradeRPrice = gradeRPrice;
	}

	public Integer getGradeSingle() {
		return this.gradeSingle;
	}

	public void setGradeSingle(Integer gradeSingle) {
		this.gradeSingle = gradeSingle;
	}

	public Date getGradeAddTime() {
		return this.gradeAddTime;
	}
	
	public void setGradeAddTime(Date gradeAddTime) {
		this.gradeAddTime = gradeAddTime;
	}

	public Integer getAdmId() {
		return this.admId;
	}

	public void setAdmId(Integer admId) {
		this.admId = admId;
	}

	public Date getGradeDueTime() {
		return this.gradeDueTime;
	}

	public void setGradeDueTime(Date gradeDueTime) {
		this.gradeDueTime = gradeDueTime;
	}

	public Integer getDealId() {
		return this.dealId;
	}

	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}
	
	public String getName() {
		return examCategory.getExamName()+gradeCategory.getGtypeName();
	}

	public void setName(String name) {
		this.name = name;
	}

	public GradeCategory getGradeCategory() {
		return gradeCategory;
	}

	public void setGradeCategory(GradeCategory gradeCategory) {
		this.gradeCategory = gradeCategory;
	}


	public String getGradeRemark() {
		return gradeRemark;
	}

	public void setGradeRemark(String gradeRemark) {
		this.gradeRemark = gradeRemark;
	}

	public String getText() {
		return gradeCategory.getGtypeName();
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getTchId() {
		return tchId;
	}

	public void setTchId(Integer tchId) {
		this.tchId = tchId;
	}

	public String getTchName() {
		return tchName;
	}

	public void setTchName(String tchName) {
		this.tchName = tchName;
	}
	//2014.06.09
	private String dataDownloadUrl;	//资料下载

	public String getDataDownloadUrl() {
		return dataDownloadUrl;
	}

	public void setDataDownloadUrl(String dataDownloadUrl) {
		this.dataDownloadUrl = dataDownloadUrl;
	}
	//2014.06.24
	private  String gradeName;

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
}