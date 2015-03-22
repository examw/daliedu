package com.changh.eschool.action.classPackage;

import java.util.List;

import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.service.ClassPackageService;

public class ListAction {
	private int examId;
	private List<List<ClassPackage>> p ;
	
	private ClassPackageService classPackageService;
	
	public String execute(){
		p=(classPackageService.findByExamId(examId));
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
	
	public List<List<ClassPackage>> getP() {
		return p;
	}
	public void setP(List<List<ClassPackage>> p) {
		this.p = p;
	}
	
}
