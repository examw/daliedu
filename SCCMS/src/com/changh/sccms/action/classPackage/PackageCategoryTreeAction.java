package com.changh.sccms.action.classPackage;

import java.util.ArrayList;
import java.util.List;

import com.changh.sccms.entity.PackageCategory;
import com.changh.sccms.service.ClassPackageService;

public class PackageCategoryTreeAction {
	private int examId;
	private List<PackageCategory> list = new ArrayList<PackageCategory>();
	private ClassPackageService classPackageService;
	
	public String execute(){
		List<PackageCategory> list1 =classPackageService.findByExamId(examId);
		PackageCategory pc = new PackageCategory();
		pc.setChildren(list1);
		pc.setExamId(examId);
		pc.setId(0);
		pc.setPtypeChildrenNum(list1.size());
		pc.setPtypeId(0);
		pc.setPtypeName("Ì×²ÍÀà±ð");
		pc.setPtypePid(-1);
		list.add(pc);
		return "success";
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	
	public ClassPackageService getClassPackageService() {
		return classPackageService;
	}
	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public List<PackageCategory> getList() {
		return list;
	}
	public void setList(List<PackageCategory> list) {
		this.list = list;
	}
}
