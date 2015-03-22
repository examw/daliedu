package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.ExamRecord;

public interface ExamRecordDAO {
	public void saveOrUpdate(ExamRecord record)throws Exception;
	public ExamRecord findById(int rcdId)throws Exception;
	public void update(ExamRecord record)throws Exception;
	public List<ExamRecord> findPageByCriteria(String criteria,int page,int pagesize,String sortname,String sortorder)throws Exception;
	public long findTotalByCriteria(String criteria)throws Exception;
	public ExamRecord findBy2Id(int stuId,int paperId)throws Exception;
	/**
	 * 参加考试的人数
	 * @param paperId	试卷id
	 * @return	人数
	 * @throws Exception
	 */
	public long findExamNumbers(int paperId)throws Exception;
	/**
	 * 成绩排名
	 * @param stuId 学员id
	 * @param paperId	试卷id
	 * @return	排名
	 * @throws Exception
	 */
	public long findScoreRank(int stuId,int paperId)throws Exception;
}
