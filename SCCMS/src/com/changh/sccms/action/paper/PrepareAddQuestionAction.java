package com.changh.sccms.action.paper;

import java.util.ArrayList;
import java.util.List;

import com.changh.sccms.entity.ExamRule;
import com.changh.sccms.service.ExamPaperService;

public class PrepareAddQuestionAction {
	private int ruleId;
	private ExamRule rule;
	private List<String> questionNo;
	private String link;
	private String actionFlag="";
	private String flag;
	
	public String getActionFlag() {
		return actionFlag;
	}
	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		rule = examPaperService.findRuleById(ruleId);
		questionNo = createList(rule.getRuleQuestionNum());
		questionNo = examPaperService.findQuestionNo(ruleId,questionNo);
		if(link==null) //刚开始没有要查一次
		{
			link = examPaperService.findLinkedQid();
		}
		if("bulkAdd".equals(flag))
		return "success";
		return "success1";
	}
	public int getRuleId() {
		return ruleId;
	}
	public void setRuleId(int ruleId) {
		this.ruleId = ruleId;
	}
	public ExamRule getRule() {
		return rule;
	}
	
	public List<String> getQuestionNo() {
		return questionNo;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	private List<String> createList(int num)
	{
		List<String> list = new ArrayList<String>();
		for(int i=1;i<=num;i++)
		{
			list.add(String.valueOf(i));
		}
		return list;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
