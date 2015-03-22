package com.changh.sccms.action.classPackage;

import com.changh.sccms.service.ClassPackageService;

public class DeleteClassPackageAction {
	private Integer pkgId;
	private boolean ok;
	private ClassPackageService classPackageService;
	
	public String execute(){
		classPackageService.deleteClassPackage(pkgId);
		ok=true;
		return "success";
	}
	public Integer getPkgId() {
		return pkgId;
	}
	public void setPkgId(Integer pkgId) {
		this.pkgId = pkgId;
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
