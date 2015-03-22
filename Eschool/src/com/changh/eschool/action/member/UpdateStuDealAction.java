package com.changh.eschool.action.member;

import java.util.Date;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.StuDeal;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ClassPackageService;

public class UpdateStuDealAction extends BaseAction{
	private StuDeal stuDeal;
	private ClassPackageService classPackageService;
	
	public String execute(){
		Student stu = (Student) session.get("student");
		if(stu==null){
			return "error";
		}
		stuDeal.setDeal(classPackageService.findByDealId(stuDeal.getDeal().getDealId()));
		stuDeal.setStuDealStatus(0);
		stuDeal.setStuDealTime(new Date());
		stuDeal.setStuUsername(stu.getStuUsername());
		stuDeal.setStuId(stu.getStuId());
		classPackageService.update(stuDeal);
		return "success";
	}

	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}

	public StuDeal getStuDeal() {
		return stuDeal;
	}

	public void setStuDeal(StuDeal stuDeal) {
		this.stuDeal = stuDeal;
	}
}
