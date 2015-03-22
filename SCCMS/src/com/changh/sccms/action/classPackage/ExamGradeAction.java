package com.changh.sccms.action.classPackage;

import java.util.List;

import com.changh.sccms.entity.ExamGrade;
import com.changh.sccms.service.ClassPackageService;

public class ExamGradeAction {
	private int examId;
	private List<ExamGrade>  examGradeList;
	private ClassPackageService classPackageService;
	
	public String execute(){
		setExamGradeList(classPackageService.gradeTree(3));
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
	public List<ExamGrade> getExamGradeList() {
		return examGradeList;
	}
	public void setExamGradeList(List<ExamGrade> examGradeList) {
		this.examGradeList = examGradeList;
	}
}
