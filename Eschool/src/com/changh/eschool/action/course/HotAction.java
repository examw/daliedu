package com.changh.eschool.action.course;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.service.ClassDetailService;
import com.changh.eschool.service.ClassPackageService;
import com.changh.eschool.service.ItemsService;

public class HotAction {
	private List<Object>  list = new ArrayList<Object>();;
	private Integer classId;
	private ItemsService itemsService;
	private ClassDetailService classDetailService;
	private ClassPackageService classPackageService;

	
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}

	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}

	public String execute(){
		Grade g = classDetailService.findGradeByClassId(classId);
	    int	examId = g.getExamCategory().getExamPid();
	    List<ClassPackage>  list1 = itemsService.findByExamId(examId, 0);
	    for(ClassPackage cp :list1){
	    	cp.setTch(classPackageService.findTchName(cp.getPkgId()));
	    }
	    list.add(list1);
	    List<Grade> list2 = itemsService.findByExamId(examId, 1);
	    list.add(list2);
		return "success";
	}
	
	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public ItemsService getItemsService() {
		return itemsService;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}

	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}

}
