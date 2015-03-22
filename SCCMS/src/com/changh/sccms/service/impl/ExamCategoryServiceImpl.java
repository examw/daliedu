package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.List;

import com.changh.sccms.dao.ExamCategoryDAO;
import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.ExamCategory1;
import com.changh.sccms.service.ExamCategoryService;

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

	public void deleteExam(int id,int examPid) throws Exception {
		examCategoryDao.delete(examPid,id);
	}

	public ExamCategory examLoad(int examId) throws Exception {
		return examCategoryDao.findById(examId);
	}

	public void modifyStudent(ExamCategory exam) throws Exception {
		System.out.println(1);
		
	}

	public void saveExam(int id,String examName,String examUrl,String examDescription) throws Exception {
		examCategory.setExamAddTime(new Date());
		examCategory.setExamChildrenNum(0);
		examCategory.setIsexpand("false");
		examCategory.setExamId(examCategoryDao.getExamId());
		examCategory.setExamName(examName);
		examCategory.setExamUrl(examUrl);
		examCategory.setExamDescription(examDescription);
		ExamCategory ec =examCategoryDao.findByIdExamAdd(id);
		if(ec==null){
			examCategory.setExamOrderId(examCategoryDao.findByExamPid(0).size());
			examCategory.setExamPid(0);
		}else{
			examCategory.setExamOrderId(ec.getExamChildrenNum()-1);
			examCategory.setExamPid(ec.getExamId());
		}
		this.examCategoryDao.save(examCategory);
	}

	public void updateExam(int id, String examName,String examUrl,String examDescription) throws Exception {
		examCategoryDao.update(id, examName,examUrl,examDescription);	
	}

	public List<ExamCategory> findByExamPid(int examPid) {
		return examCategoryDao.findByExamPid(examPid);
	}

	public boolean checkExamAdd(int examId) {
		return examCategoryDao.checkAdd(examId);
	}
	public int getExamId() {
		return examCategoryDao.getExamId();
	}
	@Override
	public List<ExamCategory> findByPro(String pro, Object value) {
		// TODO Auto-generated method stub
		return examCategoryDao.findByPro(pro, value);
	}
}
