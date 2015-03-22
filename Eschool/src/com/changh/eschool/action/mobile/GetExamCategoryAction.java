package com.changh.eschool.action.mobile;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.service.ExamCategoryService;

public class GetExamCategoryAction  extends BaseAction{
	private List<ExamCategory> list;
	private int stuid;
	private ExamCategoryService examCategoryService;
	
	public List<ExamCategory> getList() {
		return list;
	}

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public String execute()throws Exception
	{
		list = examCategoryService.findByStuId(stuid);
		return "success";
	}

	public int getStuid() {
		return stuid;
	}

	public void setStuid(int stuid) {
		this.stuid = stuid;
	}
	
}
