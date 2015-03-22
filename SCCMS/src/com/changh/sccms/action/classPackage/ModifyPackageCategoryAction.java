package com.changh.sccms.action.classPackage;

import com.changh.sccms.entity.PackageCategory;
import com.changh.sccms.service.ClassPackageService;

public class ModifyPackageCategoryAction {
	private PackageCategory packageCategory;
	private boolean ok=false;
	private ClassPackageService classPackageService;
	
	public String execute(){
		classPackageService.modifyPackageCategory(packageCategory);
		ok=true;
		return "success";
	}
	public PackageCategory getPackageCategory() {
		return packageCategory;
	}
	public void setPackageCategory(PackageCategory packageCategory) {
		this.packageCategory = packageCategory;
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
