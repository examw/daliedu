package com.changh.sccms.action.classPackage;

import java.util.List;

import com.changh.sccms.entity.Deal;
import com.changh.sccms.service.ClassPackageService;

public class DealListAction {
	private List<Deal> dealList;
	private ClassPackageService classPackageService;
	
	public String execute(){
		dealList= classPackageService.findAllDeal();
		return "success";
	}
	public List<Deal> getDealList() {
		return dealList;
	}
	public void setDealList(List<Deal> dealList) {
		this.dealList = dealList;
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	
}
