package com.changh.sccms.action.exam;

import java.util.List;
import java.util.Map;

import com.changh.sccms.service.ExamCategoryService;
import com.changh.sccms.until.GridDataUtil;

public class ExamChildrenAction {
	private int examPid;
	private Map examMap;
	private ExamCategoryService examCategoryService;
	
	public String execute(){
		List list = examCategoryService.findByExamPid(examPid);
		examMap = GridDataUtil.gridMap(list, list.size());
		return "success";
	}
	public int getExamPid() {
		return examPid;
	}
	public void setExamPid(int examPid) {
		this.examPid = examPid;
	}
	public Map getExamMap() {
		return examMap;
	}
	public void setExamMap(Map examMap) {
		this.examMap = examMap;
	}
	public ExamCategoryService getExamCategoryService() {
		return examCategoryService;
	}
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}
	
	
}
