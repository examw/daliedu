package com.changh.eschool.service.impl;

import java.util.Date;

import com.changh.eschool.dao.ExamQuestionErrorDAO;
import com.changh.eschool.entity.ExamQuestionError;
import com.changh.eschool.service.ExamQuestionErrorService;

public class ExamQuestionErrorServiceImpl implements ExamQuestionErrorService {
	private ExamQuestionErrorDAO examQuestionErrorDao;
	
	public void setExamQuestionErrorDao(ExamQuestionErrorDAO examQuestionErrorDao) {
		this.examQuestionErrorDao = examQuestionErrorDao;
	}
	
	@Override
	public boolean save(ExamQuestionError error) throws Exception {
		// TODO Auto-generated method stub
		error.setErrorStatus(0);//Œ¥¥¶¿Ì
		error.setErrorAddTime(new Date());
		examQuestionErrorDao.save(error);
		return true;
	}
}
