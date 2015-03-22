package com.changh.sccms.action.exam;

import com.changh.sccms.service.ExamCategoryService;

public class DeleteAction {
	private int examId;
	private int examPid;
	private boolean ok=false;

	private ExamCategoryService examCategoryService;

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}
	

	public String execute() {
		try {
			examCategoryService.deleteExam(examId,examPid);
			ok=true;
		} catch (Exception e) {
			ok = false;
			e.printStackTrace();
		}
		return "success";
	}


	public boolean isOk() {
		return ok;
	}


	public void setOk(boolean ok) {
		this.ok = ok;
	}


	public int getExamId() {
		return examId;
	}


	public void setExamId(int examId) {
		this.examId = examId;
	}


	public int getExamPid() {
		return examPid;
	}


	public void setExamPid(int examPid) {
		this.examPid = examPid;
	}

}
