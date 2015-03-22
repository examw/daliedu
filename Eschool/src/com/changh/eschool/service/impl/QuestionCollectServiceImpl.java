package com.changh.eschool.service.impl;

import java.util.List;

import com.changh.eschool.dao.QuestionCollectDAO;
import com.changh.eschool.entity.QuestionCollect;
import com.changh.eschool.service.QuestionCollectService;

public class QuestionCollectServiceImpl implements QuestionCollectService{
	private QuestionCollectDAO questionCollectDao;
	
	public void setQuestionCollectDao(QuestionCollectDAO questionCollectDao) {
		this.questionCollectDao = questionCollectDao;
	}
	public List<QuestionCollect> findByStuId(int page, int pagesize,
			String sortname, String sortorder, int stuId) throws Exception {
		// TODO Auto-generated method stub
		return questionCollectDao.findByStuId(page, pagesize, sortname, sortorder, stuId);
	}
	public boolean isCollected(int stuId, int questionId) throws Exception {
		// TODO Auto-generated method stub
		return questionCollectDao.isCollected(stuId, questionId)!=null;
	}
	public long findTotalByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		return questionCollectDao.findTotalByStuId(stuId);
	}
	public void save(QuestionCollect qc) throws Exception {
		// TODO Auto-generated method stub
		questionCollectDao.save(qc);
	}
	public boolean delete(int stuId, int questionId) throws Exception {
		// TODO Auto-generated method stub
		QuestionCollect qc = questionCollectDao.isCollected(stuId, questionId);
		if(qc!=null)
		{
			questionCollectDao.delete(qc);
			return true;
		}
		return false;
	}
}
