package com.changh.eschool.dao.impl;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ExamRecordDAO;
import com.changh.eschool.entity.ExamRecord;

public class HibernateExamRecordDAO extends HibernateDaoSupport implements ExamRecordDAO {
	public ExamRecord findById(int rcdId) throws Exception {
		// TODO Auto-generated method stub
		return (ExamRecord) this.getHibernateTemplate().get(ExamRecord.class, rcdId);
	}
	public void saveOrUpdate(ExamRecord record) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(record);
	}
	public void update(ExamRecord record) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(record);
	}
	@Override
	public List<ExamRecord> findPageByCriteria(final String criteria,final  int page,
			final int pagesize, final String sortname, final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List<ExamRecord>) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from ExamRecord er " + criteria
								+ " order by " + sortname + " " + sortorder;
						Query query = session.createQuery(hql);
						query.setFirstResult((page - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
	}
	@Override
	public long findTotalByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from ExamRecord er " + criteria;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	@Override
	public ExamRecord findBy2Id(int stuId, int paperId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from ExamRecord er where er.stuId = ? and er.paperId = ?";
		Object[] params = {stuId,paperId};
		List<ExamRecord> list =  this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
	@Override
	public long findExamNumbers(int paperId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(distinct er.stuId) from ExamRecord er where er.paperId = ?";
		Object[] params = {paperId};
		return (Long) this.getHibernateTemplate().find(hql, params).get(0);
	}
	@Override
	public long findScoreRank(final int stuId,final int paperId) throws Exception {
		// TODO Auto-generated method stub
		return ((BigInteger) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String sql="select rank from(select ROW_NUMBER() OVER(order by er.rcd_Score desc) as rank,er.* from tbExamRecord er where er.paper_id = ? )as er1 where er1.stu_id=?";
						SQLQuery query = session.createSQLQuery(sql);
						query.setInteger(1, stuId);
						query.setInteger(0, paperId);
						return query.list().get(0);
					}
				})).longValue();
	}
}
