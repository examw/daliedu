package com.changh.sccms.action.classDetail;

import com.changh.sccms.entity.Grade;
import com.changh.sccms.service.ClassDetailService;

public class LoadAction {
	private int gradeId;
	private Grade grade;

	private ClassDetailService classDetailService;
	
	public String execute(){
		grade=classDetailService.findById(gradeId);
		return "success";
	}
	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public ClassDetailService getClassDetailService() {
		return classDetailService;
	}
	public void setClassDetailService(ClassDetailService classDetailService) {
		this.classDetailService = classDetailService;
	}
	
}
