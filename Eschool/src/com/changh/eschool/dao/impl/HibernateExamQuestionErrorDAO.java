package com.changh.eschool.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ExamQuestionErrorDAO;
import com.changh.eschool.entity.ExamQuestionError;

public class HibernateExamQuestionErrorDAO extends HibernateDaoSupport implements ExamQuestionErrorDAO{
	@Override
	public void save(ExamQuestionError error) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(error);
	}
	
}
