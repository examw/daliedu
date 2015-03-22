package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ExamCategoryService;

public class GetExamCategoryAction extends BaseAction{
	private List<ExamCategory> list;
	private ExamCategoryService examCategoryService;
	
	public List<ExamCategory> getList() {
		return list;
	}

	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public String execute()throws Exception
	{
		Student stu = (Student) session.get("student");
		list = examCategoryService.findByStuId(stu.getStuId());
		return "success";
	}
}
