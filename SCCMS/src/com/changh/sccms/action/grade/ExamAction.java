package com.changh.sccms.action.grade;

import java.util.List;

import com.changh.sccms.service.GradeService;

public class ExamAction {
	private List listExam;
	private int examPid;
	
	public int getExamPid() {
		return examPid;
	}
	public void setExamPid(int examPid) {
		this.examPid = examPid;
	}
	private GradeService gradeService;
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public String execute(){
		listExam = gradeService.examList(examPid);
		return "success";
	}
	
	public List getListExam() {
		return listExam;
	}
	public void setListExam(List listExam) {
		this.listExam = listExam;
	}
}
