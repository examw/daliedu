package com.changh.sccms.action.classPackage;

import java.util.List;
import java.util.Map;

import com.changh.sccms.service.ClassPackageService;
import com.changh.sccms.until.GridDataUtil;

public class ListAction {
	private int examId;
	private Map packageCategoryMap;
	private ClassPackageService classPackageService;
	
	public String execute(){
		List list =classPackageService.findByExamId(examId);
		packageCategoryMap = GridDataUtil.gridMap(list, list.size());
		return "success";
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public Map getPackageCategoryMap() {
		return packageCategoryMap;
	}
	public void setPackageCategoryMap(Map packageCategoryMap) {
		this.packageCategoryMap = packageCategoryMap;
	}
	
	
}
