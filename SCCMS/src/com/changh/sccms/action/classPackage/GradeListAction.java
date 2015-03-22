package com.changh.sccms.action.classPackage;

import java.util.List;
import java.util.Map;

import com.changh.sccms.service.ClassPackageService;
import com.changh.sccms.until.GridDataUtil;

public class GradeListAction {
	private int pkgId;
	private Map gradeMap;
	private ClassPackageService classPackageService;
	public int getPkgId() {
		return pkgId;
	}
	public String execute(){
		List list = classPackageService.findByPkgId(pkgId);
		gradeMap = GridDataUtil.gridMap(list, list.size());
		return "success";
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public void setPkgId(int pkgId) {
		this.pkgId = pkgId;
	}
	public Map getGradeMap() {
		return gradeMap;
	}
	public void setGradeMap(Map gradeMap) {
		this.gradeMap = gradeMap;
	}
	
	
}
