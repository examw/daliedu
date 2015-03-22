package com.changh.sccms.action.classPackage;

import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.service.ClassPackageService;

public class LoadClassPackageAction {
	private Integer pkgId;
	private ClassPackage classPackage ;
	private ClassPackageService classPackageService;
	
	public String execute(){
		classPackage = classPackageService.loadClassPackage(pkgId);
		return "success";
	}
	public Integer getPkgId() {
		return pkgId;
	}
	public void setPkgId(Integer pkgId) {
		this.pkgId = pkgId;
	}
	public ClassPackage getClassPackage() {
		return classPackage;
	}
	public void setClassPackage(ClassPackage classPackage) {
		this.classPackage = classPackage;
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	
	
}
