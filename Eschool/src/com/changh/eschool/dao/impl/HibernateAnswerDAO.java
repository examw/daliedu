package com.changh.eschool.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.AnswerDAO;
import com.changh.eschool.entity.Answer;

public class HibernateAnswerDAO extends HibernateDaoSupport implements AnswerDAO {
	public List<Answer> findByQuestionId(int questionId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Answer a where a.question.questionId = "+questionId;
		return this.getHibernateTemplate().find(hql);
	}
	public void save(Answer answer) throws Exception {
		this.getHibernateTemplate().save(answer);
	}
}
