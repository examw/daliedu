package com.changh.eschool.action.mobile;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.entity.ExamCategory1;
import com.changh.eschool.service.ExamCategoryService;

public class SearchExamAction  extends BaseAction{
	private List<ExamCategory1> list;
	private String keywords;
	private ExamCategoryService examCategoryService;
	public String execute()
	{
		try
		{
			list = examCategoryService.search(keywords);
//			for(ExamCategory1 ec:list)
//			{
//				if(ec.getExamPid()==0)
//				{
//					ec.setChildren(examCategoryService.findByExamPid(ec.getExamId()));
//				}
//			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "success";
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		try {
			this.keywords = URLDecoder.decode(keywords,"gbk");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<ExamCategory1> getList() {
		return list;
	}
	public void setExamCategoryService(ExamCategoryService examCategoryService) {
		this.examCategoryService = examCategoryService;
	}
	
}
