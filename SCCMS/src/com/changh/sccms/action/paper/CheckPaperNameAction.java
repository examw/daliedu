package com.changh.sccms.action.paper;

import com.changh.sccms.service.ExamPaperService;

public class CheckPaperNameAction {
	private String paperName;
	private ExamPaperService examPaperService;
	private boolean ok;
	public boolean isOk()
	{
		return this.ok;
	}
	public String getPaperName()
	{
		return this.paperName;
	}
	public void setPaperName(String paperName)
	{
		this.paperName = paperName;
	}
	public void setExamPaperService(ExamPaperService examPaperService)
	{
		this.examPaperService = examPaperService;
	}
	public String execute()throws Exception
	{
		ok = examPaperService.findPaperByName(paperName)==null; //为真表示为空
		return "success";
	}
}
