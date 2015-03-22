package com.changh.sccms.action.exam;

import com.changh.sccms.service.ExamCategoryService;

public class CheckAddAction {
	private boolean ok=false;
	private Integer examId;
	private ExamCategoryService examCategoryService;
	
	public String execute(){
		ok=examCategoryService.checkExamAdd(examId);
		return "success";
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public ExamCategoryService getExamCategoryService() {
		return examCategoryService;
	}
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}
	
}
