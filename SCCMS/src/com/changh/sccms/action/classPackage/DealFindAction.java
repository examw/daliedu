package com.changh.sccms.action.classPackage;

import com.changh.sccms.service.ClassPackageService;

public class DealFindAction {
	private int dealId;
	private String dealName;
	private ClassPackageService classPackageService;

	public String execute(){
		setDealName(classPackageService.findByDealId(dealId).getDealName());
		return "success";
	}
	public int getDealId() {
		return dealId;
	}

	public void setDealId(int dealId) {
		this.dealId = dealId;
	}


	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}

	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public String getDealName() {
		return dealName;
	}
	public void setDealName(String dealName) {
		this.dealName = dealName;
	}
	
	
}
