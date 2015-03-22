package com.changh.eschool.action.paper;

import java.util.List;

import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.entity.ExamRecord;
import com.changh.eschool.entity.ExamRule;
import com.changh.eschool.service.ExamPaperService;

public class QuestionListOfRuleWithAnswerAction {
	private int rcdId;
	private int ruleId;
	private int textareaNum; //前面问答题的个数
	private int qNum; 		 //前面大题的总题数
	private int count=0; 		//有答案的问题的个数
	private List<ExamQuestion> list;
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		ExamRecord record = examPaperService.findRecordById(rcdId);
		ExamRule rule = examPaperService.findRuleById(ruleId);
		list  = examPaperService.findQuestionOfRule(ruleId);	//该大题下所有问题
		if(list!=null&&list.size()>0&&list.get(0).getQuestType()!=4)//非问答题
		{
			String answers = record.getRcdAnswers();
			String answer1 = answers.split("  ")[0]; //非问答题的答案
			String[] arr = answer1.split("&");
			String scoreArr = record.getRcdScoreForEachQuestion();
			for(int i=0;i<list.size();i++)
			{
				ExamQuestion q = list.get(i);
				q.setStandardScore(rule.getRuleScoreForEach());// 本题的分数
				//学员该题的得分
				q.setUserScore(getEachScore(scoreArr,rule.getRuleId()+"-"+q.getQuestId()+"-"));
				for(int j=1;j<arr.length;j++)
				{
					String[] arr_ = arr[j].split("-");
					if(q.getQuestId().equals(Integer.parseInt(arr_[1])))
					{
						q.setUserAnswer(arr_[2]);
						count++;
						break;
					}
				}
			}
		}else if(list!=null&&list.size()>0&&list.get(0).getQuestType()==4)
		{
			String answers = record.getRcdAnswers();
			String scoreArr = record.getRcdScoreForEachQuestion();
			String[] arr = answers.split("  ");
			for(int i=0;i<list.size();i++)
			{
				ExamQuestion q = list.get(i);
				q.setStandardScore(rule.getRuleScoreForEach());// 本题的分数
				//学员该题的得分
				q.setUserScore(getEachScore(scoreArr,rule.getRuleId()+"-"+q.getQuestId()+"-"));
				for(int j=1;j<arr.length;j++)
				{
					String[] arr_ = arr[j].split("=");
					if(q.getQuestId().equals(Integer.parseInt(arr_[0])))
					{
						q.setUserAnswer(arr_[1]);
						count++;
						break;
					}
				}
			}
		}
		return "success";
	}
	public int getRcdId() {
		return rcdId;
	}
	public void setRcdId(int rcdId) {
		this.rcdId = rcdId;
	}
	public int getRuleId() {
		return ruleId;
	}
	public void setRuleId(int ruleId) {
		this.ruleId = ruleId;
	}
	public int getTextareaNum() {
		return textareaNum;
	}
	public void setTextareaNum(int textareaNum) {
		this.textareaNum = textareaNum;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	public List<ExamQuestion> getList() {
		return list;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public int getCount() {
		return count;
	}
	private static double getEachScore(String scores,String flag)
	{
		try{
			String s1 = scores.substring(scores.indexOf(flag),scores.length());
			return Double.parseDouble(s1.substring(s1.indexOf(flag)+flag.length(),s1.indexOf("&")));
		}catch(Exception e)
		{
			return 0;
		}
	}
}
