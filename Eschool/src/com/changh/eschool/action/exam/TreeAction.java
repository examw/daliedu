package com.changh.eschool.action.exam;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.entity.ExamCategory1;
import com.changh.eschool.service.ExamCategoryService;



public class TreeAction {
	private List<ExamCategory1> list;

	public List<ExamCategory1> getList() {
		return list;
	}

	public void setList(List<ExamCategory1> list) {
		this.list = list;
	}
	private ExamCategoryService examCategoryService;
	
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}

	public String execute() throws Exception
	{
		List<ExamCategory1> all=examCategoryService.findAll();
		list = examCategoryService.findByPid(0);
		for(ExamCategory1 ec:list)
		{
			List<ExamCategory1> l=new ArrayList<ExamCategory1>();
			for(ExamCategory1 c:all)
			{
				if(c.getExamPid().equals(ec.getExamId()))
				{
					l.add(c);
				}
			}
			ec.setChildren(l);
		}
		return "success";
	}
	
}
