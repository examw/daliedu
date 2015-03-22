package com.changh.sccms.action.grade;

import com.changh.sccms.entity.Grade;
import com.changh.sccms.service.GradeService;

public class LoadAction {
	private int gradeId;
	private Grade grade;
	private GradeService gradeService;
	
	public String execute(){
		grade=gradeService.findById(gradeId);
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
	public GradeService getGradeService() {
		return gradeService;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
}
