package com.changh.sccms.action.classPackage;

import java.util.Date;

import com.changh.sccms.entity.PackageCategory;
import com.changh.sccms.service.ClassPackageService;

public class AddPackageCategoryAction {
	private String ptypeName;
	private Integer ptypePid;
	private String ptypeDescription;
	private Integer examId;
	private boolean ok=false;
	public String getPtypeDescription() {
		return ptypeDescription;
	}
	public void setPtypeDescription(String ptypeDescription) {
		this.ptypeDescription = ptypeDescription;
	}
	private PackageCategory packageCategory = new  PackageCategory();
	private ClassPackageService classPackageService;
	
	public String execute(){

		packageCategory.setPtypeName(ptypeName);
		packageCategory.setPtypeChildrenNum(0);
		packageCategory.setExamId(examId);
		packageCategory.setPtypeAddTime(new Date());
		packageCategory.setPtypeId(classPackageService.getPackageCategoryId());
		packageCategory.setPtypePid(ptypePid);
		packageCategory.setPtypeDescription(ptypeDescription);
		classPackageService.savePackageCategory(packageCategory);
		ok=true;
		return "success";
	}
	public String getPtypeName() {
		return ptypeName;
	}
	public void setPtypeName(String ptypeName) {
		this.ptypeName = ptypeName;
	}
	public Integer getPtypePid() {
		return ptypePid;
	}
	public void setPtypePid(Integer ptypePid) {
		this.ptypePid = ptypePid;
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public PackageCategory getPackageCategory() {
		return packageCategory;
	}
	public void setPackageCategory(PackageCategory packageCategory) {
		this.packageCategory = packageCategory;
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}

}
