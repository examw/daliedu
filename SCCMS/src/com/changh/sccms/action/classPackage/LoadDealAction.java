package com.changh.sccms.action.classPackage;

import com.changh.sccms.entity.Deal;
import com.changh.sccms.service.ClassPackageService;

public class LoadDealAction {
	private Deal deal;
	private Integer dealId;
	
	private ClassPackageService classPackageService;
	
	
	public String execute(){
		if(dealId==null){
			deal =null;
			return "success";
		}
		deal = classPackageService.findByDealId(dealId);
		return "success";
	}
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public Deal getDeal() {
		return deal;
	}
	public void setDeal(Deal deal) {
		this.deal = deal;
	}
	
	public Integer getDealId() {
		return dealId;
	}
	public void setDealId(Integer dealId) {
		this.dealId = dealId;
	}
}
