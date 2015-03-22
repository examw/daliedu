package com.changh.eschool.action.member;

import com.changh.eschool.entity.StuDeal;
import com.changh.eschool.service.ClassPackageService;

public class DealAction {
	private Integer studealId;
	private StuDeal stuDeal;
	private ClassPackageService classPackageService;
	
	public String execute(){
		setStuDeal(classPackageService.findByStuDealId(studealId));
		return "success";
	}

	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	

	public Integer getStudealId() {
		return studealId;
	}

	public void setStudealId(Integer studealId) {
		this.studealId = studealId;
	}

	public StuDeal getStuDeal() {
		return stuDeal;
	}

	public void setStuDeal(StuDeal stuDeal) {
		this.stuDeal = stuDeal;
	}
	
	
}
