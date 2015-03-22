package com.changh.sccms.action.classPackage;

import com.changh.sccms.service.ClassPackageService;

public class DeletePackageCategoryAction {
	private int ptypeId;
	private boolean ok=false;
	private ClassPackageService classPackageService;
	
	
	public String execute(){
		ok=classPackageService.deletePackageCategory(ptypeId);
		return "success";
	}
	public int getPtypeId() {
		return ptypeId;
	}
	public void setPtypeId(int ptypeId) {
		this.ptypeId = ptypeId;
	}

	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	
}
