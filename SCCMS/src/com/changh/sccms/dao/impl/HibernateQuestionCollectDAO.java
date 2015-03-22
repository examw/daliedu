package com.changh.sccms.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.QuestionCollectDAO;
import com.changh.sccms.entity.QuestionCollect;

public class HibernateQuestionCollectDAO extends HibernateDaoSupport implements QuestionCollectDAO {
	public List<QuestionCollect> findByStuId(int stuId) throws Exception {
		String hql = "from QuestionCollect qc where qc.student.stuId= "+stuId;
		return this.getHibernateTemplate().find(hql);
				
	}
	
	public void save(QuestionCollect qc) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(qc);
	}
	public void delete(QuestionCollect qc)throws Exception
	{
		this.getHibernateTemplate().delete(qc);
	}
}
