package com.changh.sccms.entity;

import java.util.Date;
import java.util.List;

/**
 * NewClass entity. @author MyEclipse Persistence Tools
 */

public class NewClass implements java.io.Serializable {

	// Fields
	private Integer id;
	private String classEname;
	private String classCname;
	private Integer delFlag;
	private Integer orderId;
	private Date addTime;
	private String descri;
	private String keywords;
	//默认为0
	private Integer parentId=0;
	private String pids;
	private String classTemp;
	private String urlPath;
	private String text;
	
	//子类
	private List<NewClass> children;

	// Constructors

	/** default constructor */
	public NewClass() {
	}

	/** minimal constructor */
	public NewClass(String classCname, Date addTime) {
		this.classCname = classCname;
		this.addTime = addTime;
	}

	/** full constructor */
	public NewClass(String classEname, String classCname, Integer delFlag,
			Integer orderId, Date addTime, String descri, String keywords,
			Integer parentId, String classTemp) {
		this.classEname = classEname;
		this.classCname = classCname;
		this.delFlag = delFlag;
		this.orderId = orderId;
		this.addTime = addTime;
		this.descri = descri;
		this.keywords = keywords;
		this.parentId = parentId;
		this.classTemp = classTemp;
	}
	
	

	// Property accessors
	public String getClassEname() {
		return this.classEname;
	}

	public void setClassEname(String classEname) {
		this.classEname = classEname;
	}

	public String getClassCname() {
		return this.classCname;
	}

	public void setClassCname(String classCname) {
		this.classCname = classCname;
	}

	public Integer getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getDescri() {
		return this.descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

	public String getKeywords() {
		return this.keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getClassTemp() {
		return this.classTemp;
	}

	public void setClassTemp(String classTemp) {
		this.classTemp = classTemp;
	}

	public String getUrlPath() {
		return urlPath;
	}

	public void setUrlPath(String urlPath) {
		this.urlPath = urlPath;
	}

	public List<NewClass> getChildren() {
		return children;
	}

	public void setChildren(List<NewClass> children) {
		this.children = children;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return this.classCname;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPids() {
		return pids;
	}

	public void setPids(String pids) {
		this.pids = pids;
	}

}