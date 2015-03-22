package com.changh.eschool.service;

import java.util.Date;
import java.util.List;

import com.changh.eschool.entity.ExamPaper;
import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.entity.ExamRecord;
import com.changh.eschool.entity.ExamRule;
import com.changh.eschool.entity.Student;

public interface ExamPaperService {
	//查找某班级下所有考试
	public List<ExamPaper> findPageByGradeId(int gradeId,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByGradeId(int gradeId)throws Exception;
	//findById
	public ExamPaper findById(int paperId)throws Exception;
	public ExamRule findRuleById(int ruleId)throws Exception;
	//findPaperByName
	public ExamPaper findPaperByName(String paperName)throws Exception;
	//查找小题目
	//按id找
	public ExamQuestion findQuestionById(int questionId)throws Exception;
	//查找某大题下的所有小题
	public List<ExamQuestion> findQuestionOfRule(int ruleId)throws Exception;
	//查找某条件下的所有小题
	public List<ExamQuestion> findByCriteria(String criteria)throws Exception;
	public ExamRecord updateForAnswer(Student stu,int paperId, String answers,List<String> textarea,List<String> qids,Date startTime,Date endTime)throws Exception;
	public ExamRecord updateForManualMark(int paperId, int recordId,
			List<String> qids, List<String> rids, List<String> scores)throws Exception;
	public ExamRecord findRecordById(int rcdId)throws Exception;
	public int findRecordTotalByCriteria(String criteria)throws Exception;
	public List<ExamRecord> findRecordByCriteria(String criteria, int page,
			int pagesize, String sortname, String sortorder)throws Exception;
	public ExamRecord findRecordBy2Id(int stuId, int paperId)throws Exception;
	public int findExamNumbers(int paperId)throws Exception;
	public int findScoreRank(int stuId, int paperId)throws Exception;
	public void saveAnswer(int paperId, int stuId, String optionAnswer,
			String contentAnswer)throws Exception;
}
