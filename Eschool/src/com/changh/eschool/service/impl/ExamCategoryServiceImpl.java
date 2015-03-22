package com.changh.eschool.service.impl;

import java.util.List;

import com.changh.eschool.dao.ExamCategoryDAO;
import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.entity.ExamCategory1;
import com.changh.eschool.service.ExamCategoryService;



public class ExamCategoryServiceImpl implements ExamCategoryService {
	
	private ExamCategory examCategory = new ExamCategory();
	//injection
	private ExamCategoryDAO examCategoryDao;
	public void setExamCategoryDao(ExamCategoryDAO examCategoryDao) {
		this.examCategoryDao = examCategoryDao;
	}
	public List<ExamCategory1> findAll() throws Exception {
		
		return examCategoryDao.findAll1();
	}
	public List<ExamCategory1> findByPid(int id) throws Exception {
		return examCategoryDao.findByPid1(id);
	}
	////////////////////////////////////////
	public List<ExamCategory>  examList() throws Exception{
		List<ExamCategory> list=null;
	    list = examCategoryDao.findAll();
		return list;
	}

	public void examDelete(int id,int examPid) throws Exception {
		examCategoryDao.delete(examPid,id);
	}

	public ExamCategory examLoad(int examId) throws Exception {
		return examCategoryDao.findById(examId);
	}

	public void modifyStudent(ExamCategory exam) throws Exception {
		System.out.println(1);
		
	}
	public void examUpdate(int id, String examName) throws Exception {
		examCategoryDao.update(id, examName);	
	}

	public List<ExamCategory> findByExamPid(int examPid) {
		return examCategoryDao.findByExamPid(examPid);
	}

	public boolean checkExamAdd(int examId) {
		return examCategoryDao.checkAdd(examId);
	}
	public List<ExamCategory> findByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		return examCategoryDao.findByStuId(stuId);
	}
	
	// 2013.07.18 for mobile
	public List<ExamCategory1> search(String keywords) throws Exception
	{
		return examCategoryDao.search(keywords);
	}
}
