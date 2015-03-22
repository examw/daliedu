package com.changh.eschool.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.QuestionCollectDAO;
import com.changh.eschool.entity.QuestionCollect;

public class HibernateQuestionCollectDAO extends HibernateDaoSupport implements QuestionCollectDAO {
	public List<QuestionCollect> findByStuId(final int page, final int pagesize,
			final String sortname,final String sortorder,final int stuId) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from QuestionCollect qc join fetch qc.question q where qc.student.stuId =? order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setInteger(0, stuId);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public void save(QuestionCollect qc) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(qc);
	}
	public void delete(QuestionCollect qc)throws Exception
	{
		this.getHibernateTemplate().delete(qc);
	}
	public QuestionCollect isCollected(int stuId, int questionId)
			throws Exception {
		// TODO Auto-generated method stub
		String hql="from QuestionCollect qc where qc.student.stuId= ? and qc.question.questionId= ?";
		Object[] params = {stuId,questionId};
		List list = this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return (QuestionCollect) list.get(0);
	}
	public long findTotalByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="select count(*) from QuestionCollect qc where qc.student.stuId = ?";
		Object[] param = {stuId};
		List list = this.getHibernateTemplate().find(hql, param);
		return (Long) list.get(0);
	}
}
