package com.changh.eschool.action.exam;

import java.util.List;

import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.entity.PackageCategory;
import com.changh.eschool.service.ClassPackageService;
import com.changh.eschool.service.ExamCategoryService;

public class ExamAction {
	private Integer examId;
	private ExamCategory exam;
	private ExamCategoryService examCategoryService;
	private ClassPackageService classPackageService;
	private List<PackageCategory> listPc;
	public ExamCategory getExam() {
		return exam;
	}
	public void setExam(ExamCategory exam) {
		this.exam = exam;
	}
	public ExamCategoryService getExamCategoryService() {
		return examCategoryService;
	}
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}
	public String execute(){
		try {
			listPc = classPackageService.findPCbyExamId(examId);
			exam = examCategoryService.examLoad(examId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}

	public void setClassPackageService(ClassPackageService classPackageService) {
		this.classPackageService = classPackageService;
	}
	public List<PackageCategory> getListPc() {
		return listPc;
	}
	public void setListPc(List<PackageCategory> listPc) {
		this.listPc = listPc;
	}
}
