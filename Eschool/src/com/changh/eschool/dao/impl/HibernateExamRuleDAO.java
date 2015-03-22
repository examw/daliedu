package com.changh.eschool.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ExamRuleDAO;
import com.changh.eschool.entity.ExamRule;

public class HibernateExamRuleDAO extends HibernateDaoSupport implements
		ExamRuleDAO {

	public ExamRule findById(int ruleId) throws Exception {
		// TODO Auto-generated method stub
		return (ExamRule) this.getHibernateTemplate().get(ExamRule.class, ruleId);
	}
}
