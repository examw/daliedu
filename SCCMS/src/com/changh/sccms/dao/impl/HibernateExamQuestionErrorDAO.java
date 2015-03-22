package com.changh.sccms.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ExamQuestionErrorDAO;
import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamQuestionError;

public class HibernateExamQuestionErrorDAO extends HibernateDaoSupport implements ExamQuestionErrorDAO{
	public ExamQuestionError findById(int id) throws Exception {
		// TODO Auto-generated method stub
		return (ExamQuestionError) this.getHibernateTemplate().get(
				ExamQuestionError.class, id);
	}
	public List<ExamQuestionError> findPageByCriteria(final String criteria,
			final int page, final int pagesize, final String sortname,
			final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List<ExamQuestionError>) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from ExamQuestionError eqr " + criteria
								+ " order by " + sortname + " " + sortorder;
						Query query = session.createQuery(hql);
						query.setFirstResult((page - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
	}
	public long findTotalByCriteria(String criteria) throws Exception {
		String hql = "select count(*) from ExamQuestionError eqr " + criteria;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	public void updateError(ExamQuestionError error) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(error);
	}
	
}
