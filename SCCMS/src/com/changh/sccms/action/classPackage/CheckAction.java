package com.changh.sccms.action.classPackage;

import com.changh.sccms.service.ClassPackageService;

public class CheckAction {
	private boolean ok =false;
	private Integer ptypeId;
	private ClassPackageService classPackageService;
	
	public String execute(){
		ok = classPackageService.checkPackage(ptypeId);
		return "success";
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public Integer getPtypeId() {
		return ptypeId;
	}
	public void setPtypeId(Integer ptypeId) {
		this.ptypeId = ptypeId;
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	
}
