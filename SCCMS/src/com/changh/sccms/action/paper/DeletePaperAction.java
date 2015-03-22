package com.changh.sccms.action.paper;

import com.changh.sccms.service.ExamPaperService;

public class DeletePaperAction
{
	private int paperId;
	private ExamPaperService examPaperService;
	private boolean ok;
	public String execute()throws Exception
	{
		ok = examPaperService.deletePaper(paperId);
		return "success";
	}
	public int getPaperId()
	{
		return paperId;
	}
	public void setPaperId(int paperId)
	{
		this.paperId = paperId;
	}
	public boolean isOk()
	{
		return ok;
	}
	public void setExamPaperService(ExamPaperService examPaperService)
	{
		this.examPaperService = examPaperService;
	}
}