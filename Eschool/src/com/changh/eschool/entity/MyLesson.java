package com.changh.eschool.entity;

import java.util.List;

public class MyLesson {
	private List<Grade> grade;
	private List<ClassPackage> classPackages;
	public List<Grade> getGrade() {
		return grade;
	}
	public void setGrade(List<Grade> grade) {
		this.grade = grade;
	}
	public List<ClassPackage> getClassPackages() {
		return classPackages;
	}
	public void setClassPackages(List<ClassPackage> classPackages) {
		this.classPackages = classPackages;
	}
	
	//2014.03.17 
	private String limitString;
	public String getLimitString() {
		return limitString;
	}
	public void setLimitString(String limitString) {
		this.limitString = limitString;
	}
	//2014.03.18
	private String limitItemIds;
	public String getLimitItemIds() {
		return limitItemIds;
	}
	public void setLimitItemIds(String limitItemIds) {
		this.limitItemIds = limitItemIds;
	}
}
