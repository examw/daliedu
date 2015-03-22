package com.changh.eschool.entity;

import java.util.Date;
import java.util.List;

/**
 * PackageCategory entity. @author MyEclipse Persistence Tools
 */

public class PackageCategory implements java.io.Serializable {

	// Fields

	private Integer ptypeId;
	private Integer id;
	private String ptypeName;
	private Integer examId;
	private Integer ptypePid;
	private Integer ptypeChildrenNum;
	private Integer ptypeOrderId;
	private Date ptypeAddTime;
	private String ptypeDescription;
	private List<PackageCategory> children;
	

	// Constructors

	/** default constructor */
	public PackageCategory() {
	}

	/** minimal constructor */
	public PackageCategory(Integer ptypeId, Integer id, String ptypeName,
			Integer examId, Integer ptypePid, Integer ptypeChildrenNum,
			Integer ptypeOrderId, Date ptypeAddTime) {
		this.ptypeId = ptypeId;
		this.id = id;
		this.ptypeName = ptypeName;
		this.examId = examId;
		this.ptypePid = ptypePid;
		this.ptypeChildrenNum = ptypeChildrenNum;
		this.ptypeOrderId = ptypeOrderId;
		this.ptypeAddTime = ptypeAddTime;
	}

	/** full constructor */
	public PackageCategory(Integer ptypeId, Integer id, String ptypeName,
			Integer examId, Integer ptypePid, Integer ptypeChildrenNum,
			Integer ptypeOrderId, Date ptypeAddTime, String ptypeDescription) {
		this.ptypeId = ptypeId;
		this.id = id;
		this.ptypeName = ptypeName;
		this.examId = examId;
		this.ptypePid = ptypePid;
		this.ptypeChildrenNum = ptypeChildrenNum;
		this.ptypeOrderId = ptypeOrderId;
		this.ptypeAddTime = ptypeAddTime;
		this.ptypeDescription = ptypeDescription;
	}

	// Property accessors

	public Integer getPtypeId() {
		return this.ptypeId;
	}

	public void setPtypeId(Integer ptypeId) {
		this.ptypeId = ptypeId;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPtypeName() {
		return this.ptypeName;
	}

	public void setPtypeName(String ptypeName) {
		this.ptypeName = ptypeName;
	}

	public Integer getExamId() {
		return this.examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
	}

	public Integer getPtypePid() {
		return this.ptypePid;
	}

	public void setPtypePid(Integer ptypePid) {
		this.ptypePid = ptypePid;
	}

	public Integer getPtypeChildrenNum() {
		return this.ptypeChildrenNum;
	}

	public void setPtypeChildrenNum(Integer ptypeChildrenNum) {
		this.ptypeChildrenNum = ptypeChildrenNum;
	}

	public Integer getPtypeOrderId() {
		return this.ptypeOrderId;
	}

	public void setPtypeOrderId(Integer ptypeOrderId) {
		this.ptypeOrderId = ptypeOrderId;
	}

	public Date getPtypeAddTime() {
		return this.ptypeAddTime;
	}

	public void setPtypeAddTime(Date ptypeAddTime) {
		this.ptypeAddTime = ptypeAddTime;
	}

	public String getPtypeDescription() {
		return this.ptypeDescription;
	}

	public void setPtypeDescription(String ptypeDescription) {
		this.ptypeDescription = ptypeDescription;
	}

	public List<PackageCategory> getChildren() {
		return children;
	}

	public void setChildren(List<PackageCategory> children) {
		this.children = children;
	}

}