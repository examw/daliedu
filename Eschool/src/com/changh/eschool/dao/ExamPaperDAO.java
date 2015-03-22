package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.ExamPaper;

public interface ExamPaperDAO {
	//findbyId
	public ExamPaper findById(int paperId)throws Exception;
	//修改试卷
	public void update(ExamPaper paper)throws Exception;
	public void updatePaperScore(int paperId,double score)throws Exception;
	//分页查询某考试下的所有试卷
	public List<ExamPaper> findPageByGradeId(int gradeId,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByGradeId(int gradeId)throws Exception;
	public List<ExamPaper> findPageByContent(String content,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByContent(String content)throws Exception;
	//findByName
	public ExamPaper findByName(String paperName)throws Exception;
}
