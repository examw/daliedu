package com.changh.sccms.action.classPackage;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.service.ClassPackageService;
import com.changh.sccms.until.GridDataUtil;

public class PackageListAction {
	private int ptypeId;
	private Map classPackageMap;
	private ClassPackageService classPackageService;
	
	public String execute(){
		List<ClassPackage> list = classPackageService.findByPtypeId(ptypeId);
		classPackageMap =GridDataUtil.gridMap(list, list.size());
		return "success";
	}
	public int getPtypeId() {
		return ptypeId;
	}
	public void setPtypeId(int ptypeId) {
		this.ptypeId = ptypeId;
	}
	public Map getClassPackageMap() {
		return classPackageMap;
	}
	public void setClassPackageMap(Map classPackageMap) {
		this.classPackageMap = classPackageMap;
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
}
