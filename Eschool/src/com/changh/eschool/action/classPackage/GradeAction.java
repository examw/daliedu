package com.changh.eschool.action.classPackage;

import java.util.List;

import com.changh.eschool.entity.Grade;
import com.changh.eschool.service.GradeService;

public class GradeAction {
	private int examId;
	private List<List<Grade>> e;
	private GradeService gradeService;
	
	public String execute(){
		setE(gradeService.findByExamId(examId));
		return "success";
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}

	public GradeService getGradeService() {
		return gradeService;
	}
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public List<List<Grade>> getE() {
		return e;
	}
	public void setE(List<List<Grade>> e) {
		this.e = e;
	}
	
	
}
