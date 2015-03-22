package com.changh.eschool.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * ClassPackage entity. @author MyEclipse Persistence Tools
 */

public class ClassPackage implements java.io.Serializable {

	// Fields

	private Integer pkgId;
	private Integer id;
	private Integer dealId;
	private String pkgName;
	private Integer ptypeId;
	private double pkgOPrice;
	private double pkgRPrice;
	private double pkgSPrice;
	private String pkgDescription;
	private Date pkgRMatureDate;
	private Date pkgLMatureDate;
	private Integer pkgTotalTime;
	private Date pkgAddTime;
	private Integer admId;
	private String pkgPresent;

	private String pkgIncludeCid;
	private List<Grade> grade;
	// item,根据不同学员动态指定
	private Integer itemId;

	/**
	 * 根据班级获得老师姓名
	 */
	private HashSet<SimpleTeacher> tch;

	// Constructors
	private List<Teacher> teacher;
	private Date orderTime;

	/** default constructor */
	public ClassPackage() {
	}

	/** main constructor */
	public ClassPackage(Integer pkgId, String pkgName, double pkgRPrice,
			Integer pkgTotalTime) {
		this.pkgId = pkgId;
		this.pkgName = pkgName;
		this.pkgRPrice = pkgRPrice;
		this.pkgTotalTime = pkgTotalTime;
	}

	/** minimal constructor */
	public ClassPackage(Integer pkgId, Integer id, String pkgName,
			Integer ptypeId, Date pkgRMatureDate, Date pkgAddTime, Integer admId) {
		this.pkgId = pkgId;
		this.id = id;
		this.pkgName = pkgName;
		this.ptypeId = ptypeId;
		this.pkgRMatureDate = pkgRMatureDate;
		this.pkgAddTime = pkgAddTime;
		this.admId = admId;
	}

	/** full constructor */
	public ClassPackage(Integer pkgId, Integer id, Integer dealId,
			String pkgName, Integer ptypeId, double pkgOPrice,
			double pkgRPrice, double pkgSPrice, String pkgDescription,
			Date pkgRMatureDate, Date pkgLMatureDate, Integer pkgTotalTime,
			Date pkgAddTime, Integer admId, String pkgPresent) {
		this.pkgId = pkgId;
		this.id = id;
		this.dealId = dealId;
		this.pkgName = pkgName;
		this.ptypeId = ptypeId;
		this.pkgOPrice = pkgOPrice;
		this.pkgRPrice = pkgRPrice;
		this.pkgSPrice = pkgSPrice;
		this.pkgDescription = pkgDescription;
		this.pkgRMatureDate = pkgRMatureDate;
		this.pkgLMatureDate = pkgLMatureDate;
		this.pkgTotalTime = pkgTotalTime;
		this.pkgAddTime = pkgAddTime;
		this.admId = admId;
		this.pkgPresent = pkgPresent;
	}

	// Property accessors

	public Integer getPkgId() {
		return this.pkgId;
	}

	public void setPkgId(Integer pkgId) {
		this.pkgId = pkgId;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDealId() {
		return this.dealId;
	}

	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}

	public String getPkgName() {
		return this.pkgName;
	}

	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}

	public Integer getPtypeId() {
		return this.ptypeId;
	}

	public void setPtypeId(Integer ptypeId) {
		this.ptypeId = ptypeId;
	}

	public double getPkgOPrice() {
		return this.pkgOPrice;
	}

	public void setPkgOPrice(double pkgOPrice) {
		this.pkgOPrice = pkgOPrice;
	}

	public double getPkgRPrice() {
		return this.pkgRPrice;
	}

	public void setPkgRPrice(double pkgRPrice) {
		this.pkgRPrice = pkgRPrice;
	}

	public double getPkgSPrice() {
		return this.pkgSPrice;
	}

	public void setPkgSPrice(double pkgSPrice) {
		this.pkgSPrice = pkgSPrice;
	}

	public String getPkgDescription() {
		return this.pkgDescription;
	}

	public void setPkgDescription(String pkgDescription) {
		this.pkgDescription = pkgDescription;
	}

	public Date getPkgRMatureDate() {
		return this.pkgRMatureDate;
	}

	public void setPkgRMatureDate(Date pkgRMatureDate) {
		this.pkgRMatureDate = pkgRMatureDate;
	}

	public Date getPkgLMatureDate() {
		return this.pkgLMatureDate;
	}

	public void setPkgLMatureDate(Date pkgLMatureDate) {
		this.pkgLMatureDate = pkgLMatureDate;
	}

	public Integer getPkgTotalTime() {
		return this.pkgTotalTime;
	}

	public void setPkgTotalTime(Integer pkgTotalTime) {
		this.pkgTotalTime = pkgTotalTime;
	}

	public Date getPkgAddTime() {
		return this.pkgAddTime;
	}

	public void setPkgAddTime(Date pkgAddTime) {
		this.pkgAddTime = pkgAddTime;
	}

	public Integer getAdmId() {
		return this.admId;
	}

	public void setAdmId(Integer admId) {
		this.admId = admId;
	}

	public String getPkgPresent() {
		return this.pkgPresent;
	}

	public void setPkgPresent(String pkgPresent) {
		this.pkgPresent = pkgPresent;
	}

	public String getPkgIncludeCid() {
		return pkgIncludeCid;
	}

	public void setPkgIncludeCid(String pkgIncludeCid) {
		this.pkgIncludeCid = pkgIncludeCid;
	}

	public List<Teacher> getTeacher() {
		return teacher;
	}

	public void setTeacher(List<Teacher> teacher) {
		this.teacher = teacher;
	}

	public List<Grade> getGrade() {
		return grade;
	}

	public void setGrade(List<Grade> grade) {
		this.grade = grade;
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

	public HashSet<SimpleTeacher> getTch() {
		return tch;
	}

	public void setTch(HashSet<SimpleTeacher> tch) {
		this.tch = tch;
	}

	// limit,是否限制 2014.03.17
	private boolean limit;

	public boolean isLimit() {
		return limit;
	}

	public void setLimit(boolean limit) {
		this.limit = limit;
	}
}