package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.entity.ExamCategory1;


public interface ExamCategoryService {

	public List<ExamCategory1> findAll()throws Exception;
	public List<ExamCategory1> findByPid(int id)throws Exception;
	

	public List<ExamCategory> examList() throws Exception;
	public void examDelete(int id,int examPid) throws Exception;
	public ExamCategory examLoad(int examId) throws Exception;
	public void modifyStudent(ExamCategory exam) throws Exception;
	public void examUpdate(int id,String examName) throws Exception;
	public List<ExamCategory>  findByExamPid(int examPid);
	//检查考试是否能够继续分类
	public boolean checkExamAdd(int examId);
	//某学员所购买课程所属的考试分类
	public List<ExamCategory> findByStuId(int stuId) throws Exception;

	// 2013.07.18 for mobile
	public List<ExamCategory1> search(String keywords) throws Exception;
	
	

}