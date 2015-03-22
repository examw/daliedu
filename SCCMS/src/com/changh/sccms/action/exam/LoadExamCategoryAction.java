package com.changh.sccms.action.exam;

import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.service.ExamCategoryService;

public class LoadExamCategoryAction {
	private Integer examId;
	private ExamCategory exam;
	private ExamCategoryService examCategoryService;
	
	public String execute(){
		try {
			exam = examCategoryService.examLoad(examId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	public ExamCategory getExam() {
		return exam;
	}
	public Integer getExamId() {
		return examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
	}

	public void setExam(ExamCategory exam) {
		this.exam = exam;
	}
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}
}
