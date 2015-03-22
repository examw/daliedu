package com.changh.sccms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ExamRuleDAO;
import com.changh.sccms.entity.ExamRule;

public class HibernateExamRuleDAO extends HibernateDaoSupport implements
		ExamRuleDAO {

	public void save(ExamRule rule) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(rule);
	}

	public ExamRule findById(int ruleId) throws Exception {
		// TODO Auto-generated method stub
		return (ExamRule) this.getHibernateTemplate().get(ExamRule.class, ruleId);
	}

	public void update(ExamRule paper) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(paper);
	}

	public List<ExamRule> findPageByExamId(final int paperId, final int page, final int pagesize,
			final String sortname, final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from ExamRule er where er.paperId = ? order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setInteger(0, paperId);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}

	public long findTotalByExamId(int paperId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from ExamRule er where er.paperId = ?";
		Object[] params = {paperId};
		return (Long) this.getHibernateTemplate().find(hql, params).get(0);
	}

	public void delete(ExamRule rule) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(rule);
	}
	public void deleteAll(List<ExamRule> rules)throws Exception
	{
		this.getHibernateTemplate().deleteAll(rules);
	}
	//保存或更新
	public void saveOrUpdate(List<ExamRule> rules) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdateAll(rules);
	}
}
