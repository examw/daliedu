package com.changh.eschool.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ExamQuestionDAO;
import com.changh.eschool.entity.ExamQuestion;
import com.changh.eschool.entity.ExamRule;

public class HibernateExamQuestionDAO extends HibernateDaoSupport implements
		ExamQuestionDAO {

	public ExamQuestion findById(int questId) throws Exception {
		// TODO Auto-generated method stub
		return (ExamQuestion) this.getHibernateTemplate().get(
				ExamQuestion.class, questId);
	}

	public void update(ExamRule question) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(question);
	}

	public List<ExamQuestion> findPageByCriteria(final String criteria,
			final int page, final int pagesize, final String sortname,
			final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List<ExamQuestion>) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from ExamQuestion eq " + criteria
								+ " order by " + sortname + " " + sortorder;
						Query query = session.createQuery(hql);
						query.setFirstResult((page - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
	}

	public long findTotalByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from ExamQuestion eq " + criteria;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	public List<ExamQuestion> findByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from ExamQuestion eq "+criteria;
		return (List<ExamQuestion>)this.getHibernateTemplate().find(hql);
	}

	public void delete(ExamQuestion question) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(question);
	}

	public List<ExamQuestion> findAllByPaperId(int paperId) throws Exception {
		String hql = "from ExamQuestion where questPaperId = ? order by questRuleId asc,questOrderId asc";
		Object[] params = { paperId };
		return this.getHibernateTemplate().find(hql, params);
	}

	public List<ExamQuestion> findAllByRuleId(int ruleId) throws Exception {
		String hql = "from ExamQuestion where questRuleId = ? order by questOrderId asc";
		Object[] params = { ruleId };
		return this.getHibernateTemplate().find(hql, params);
	}
	// ’“Ã‚∫≈
	public List<String> findQuestionNo(final int ruleId) throws Exception {
		// TODO Auto-generated method stub
		List<Integer> list = (List<Integer>) this.getHibernateTemplate()
				.execute(new HibernateCallback() {
					public Object doInHibernate(Session session) {
						String sql = "select questOrderId from ExamQuestion where questRuleId=? order by questOrderId asc";
						Query query = session.createQuery(sql);
						query.setInteger(0, ruleId);
						return query.list();
					}
				});
		List<String> list1 = new ArrayList<String>();
		for (Integer i : list) {
			list1.add(i.toString());
		}
		return list1;
	}
	public String findLinkedQid() throws Exception {
		// TODO Auto-generated method stub
		List<String> list = (List<String>)this.getHibernateTemplate()
		.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				String sql = "select questLinkQuestionId from ExamQuestion order by questOrderId desc";
				Query query = session.createQuery(sql);
				return query.list();
			}
		});
		if(list.isEmpty()) return null;
		return list.get(0);
	}
	
}
