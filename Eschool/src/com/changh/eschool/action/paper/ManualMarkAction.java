package com.changh.eschool.action.paper;

import java.util.List;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.ExamPaper;
import com.changh.eschool.entity.ExamRecord;
import com.changh.eschool.entity.ExamRule;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.ExamPaperService;

public class ManualMarkAction extends BaseAction{
	private int paperId;
	private int recordId;
	private ExamPaper paper;
	private List<ExamRule> ruleList;
	private ExamRecord record;
	private List<String> qids;
	private List<String> rids;
	private List<String> scores;
	private int examNumbers;
	private int rank;
	private ExamPaperService examPaperService;
	public String execute()throws Exception
	{
		Student stu = (Student) session.get("student");
		paper = examPaperService.findById(paperId);
		record = examPaperService.updateForManualMark(paperId, recordId,qids,rids,scores);
		ruleList = paper.getExamRules();
		//参考人数
		examNumbers = examPaperService.findExamNumbers(paper.getPaperId());
		//成绩排名
		rank = examPaperService.findScoreRank(stu.getStuId(),paper.getPaperId());
		String[] str = record.getRcdScoreForEachRule().split(";");
		for(ExamRule r:ruleList)
		{
			for(int i=0;i<str.length;i++)
			{
				if(r.getRuleId().equals(Integer.parseInt(str[i].split("=")[0])))
				{
					r.setUserScore(str[i].split("=")[1]);
				}
			}
			
		}
		return "success";
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	
	public List<ExamRule> getRuleList() {
		return ruleList;
	}
	public ExamRecord getRecord() {
		return record;
	}
	public void setRecord(ExamRecord record) {
		this.record = record;
	}
	public List<String> getQids() {
		return qids;
	}
	public void setQids(List<String> qids) {
		this.qids = qids;
	}
	public List<String> getRids() {
		return rids;
	}
	public void setRids(List<String> rids) {
		this.rids = rids;
	}
	public List<String> getScores() {
		return scores;
	}
	public void setScores(List<String> scores) {
		this.scores = scores;
	}
	public ExamPaper getPaper() {
		return paper;
	}
	public void setExamPaperService(ExamPaperService examPaperService) {
		this.examPaperService = examPaperService;
	}
	public int getExamNumbers() {
		return examNumbers;
	}
	public int getRank() {
		return rank;
	}
	
}
