package com.changh.eschool.action.mobile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ExamPaper;
import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.entity.ExamRule;
import com.changh.eschool.service.ExamPaperService;
import com.changh.eschool.until.XMLCreatorUtil;

public class GetXMLFormatPaper  extends BaseAction{
	private int paperId;
	private ExamPaper paper;
	private List<ExamRule> rules;
	private List<List<ExamQuestion>> questionList;
	private InputStream inputStream;
	private ExamPaperService examPaperService;
	public String execute()
	{
		try{
			paper = examPaperService.findById(paperId);
			if(paper==null)
			{
				return "success";
			}
			rules = paper.getExamRules();
			if(rules!=null&&rules.size()>0)
			{
				questionList  = new ArrayList<List<ExamQuestion>>();
				for(ExamRule r:rules)
				{
					questionList.add(examPaperService.findQuestionOfRule(r.getRuleId()));
				}
			}
			inputStream = XMLCreatorUtil.createPaperXML(paper,rules,questionList);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "success";
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public ExamPaper getPaper() {
		return paper;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	
}
