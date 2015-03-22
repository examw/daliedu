package com.changh.sccms.service.impl;

import java.util.List;

import com.changh.sccms.dao.QuestionDAO;
import com.changh.sccms.entity.Question;
import com.changh.sccms.service.QuestionService;

public class QuestionServiceImpl implements QuestionService {
	private QuestionDAO questionDao;
	
	public void setQuestionDao(QuestionDAO questionDao) {
		this.questionDao = questionDao;
	}
	public List<Question> findAll(int page, int pagesize, String sortname,
			String sortorder) throws Exception {
		return questionDao.findPage(page, pagesize, sortname, sortorder);
				
	}
	public List<Question> findByContent(int page, int pagesize,
			String sortname, String sortorder, String content) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer buf = new StringBuffer();
		buf.append(" where questionTitle like '%");
		buf.append(content);
		buf.append("%' or");
		buf.append("questionContent like '%");
		buf.append(content);
		buf.append("%' ");
		return questionDao.searchPage(page, pagesize, sortname, sortorder, buf.toString());
		
	}
	public Question findById(int questionId) throws Exception {
		return questionDao.findById(questionId);
	}
	
	public List<Question> findByType(int page, int pagesize, String sortname,
			String sortorder, int type) throws Exception {
		// TODO Auto-generated method stub
		String content = " where questionSource = "+type;
		return questionDao.searchPage(page, pagesize, sortname, sortorder, content);
	}
	public List<Question> findByStatus(int page, int pagesize, String sortname,
			String sortorder, int status) throws Exception {
		String content = " where questionStatus = "+status;
		return questionDao.searchPage(page, pagesize, sortname, sortorder, content);
	}
	
}
