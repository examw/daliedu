package com.changh.eschool.entity;

import java.util.Date;
import java.util.List;

/**
 * Grade entity. @author MyEclipse Persistence Tools
 */

public class Grade implements java.io.Serializable {

	// Fields

	private Integer gradeId;
	private GradeCategory gradeCategory;
	private ExamCategory examCategory;
	private Integer id;
	private Teacher teacher;
	private Integer gradeTime;
	private double gradeOPrice;
	private double gradeRPrice;
	private Integer gradeSingle;
	private Date gradeAddTime;
	private Integer admId;
	private Date gradeDueTime;
	private Integer dealId;
	private String gradeRemark;
	private List<ClassDetail> classDetails;
	
	//方便输出
	private String name;
	private String tchName;
	private String text;
	private Date orderTime;
	private Integer itemId;	//条目ID 非数据库字段
	// Constructors
	
	/** default constructor */
	public Grade() {
	}

	/** minimal constructor */
	public Grade(Integer gradeId, GradeCategory gradeCategory,
			ExamCategory examCategory, Integer id, Teacher teacher,
			Integer gradeTime, double gradeOPrice, double gradeRPrice,
			Date gradeAddTime, Integer admId, Date gradeDueTime, Integer dealId) {
		this.gradeId = gradeId;
		this.gradeCategory = gradeCategory;
		this.examCategory = examCategory;
		this.id = id;
		this.teacher=teacher;
		this.gradeTime = gradeTime;
		this.gradeOPrice = gradeOPrice;
		this.gradeRPrice = gradeRPrice;
		this.gradeAddTime = gradeAddTime;
		this.admId = admId;
		this.gradeDueTime = gradeDueTime;
		this.dealId = dealId;
	}

	/** full constructor */
	public Grade(Integer gradeId, GradeCategory gradeCategory,
			ExamCategory examCategory, Integer id,Teacher teacher ,
			Integer gradeTime, double gradeOPrice, double gradeRPrice,
			Integer gradeSingle, Date gradeAddTime, Integer admId,
			Date gradeDueTime, Integer dealId,String gradeRemark) {
		this.gradeId = gradeId;
		this.gradeCategory = gradeCategory;
		this.examCategory = examCategory;
		this.id = id;
		this.teacher=teacher;
		this.gradeTime = gradeTime;
		this.gradeOPrice = gradeOPrice;
		this.gradeRPrice = gradeRPrice;
		this.gradeSingle = gradeSingle;
		this.gradeAddTime = gradeAddTime;
		this.admId = admId;
		this.gradeDueTime = gradeDueTime;
		this.dealId = dealId;
		this.gradeRemark=gradeRemark;
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

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public String getTchName() {
		return teacher.getTchName();
	}

	public void setTchName(String tchName) {
		this.tchName = tchName;
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

	public List<ClassDetail> getClassDetails() {
		return classDetails;
	}

	public void setClassDetails(List<ClassDetail> classDetails) {
		this.classDetails = classDetails;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	
	// limit,是否限制 2014.03.17
		private boolean limit;

		public boolean isLimit() {
			return limit;
		}

		public void setLimit(boolean limit) {
			this.limit = limit;
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