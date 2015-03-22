package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.ExamPaper;

public interface ExamPaperDAO {
	//保存试卷，返回该卷的主键值
	public int save(ExamPaper paper)throws Exception;
	//findbyId
	public ExamPaper findById(int paperId)throws Exception;
	//修改试卷
	public void update(ExamPaper paper)throws Exception;
	public void updatePaperScore(int paperId,double score)throws Exception;
	//分页查询某考试下的所有试卷
	public List<ExamPaper> findPageByExamId(int examId,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByExamId(int examId)throws Exception;
	public List<ExamPaper> findPageByContent(String content,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByContent(String content)throws Exception;
	//删除试卷
	public void delete(ExamPaper paper)throws Exception;
	//findByName
	public ExamPaper findByName(String paperName)throws Exception;
}
