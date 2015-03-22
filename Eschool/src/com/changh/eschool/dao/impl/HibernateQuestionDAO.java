package com.changh.eschool.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.QuestionDAO;
import com.changh.eschool.entity.Question;

public class HibernateQuestionDAO extends HibernateDaoSupport implements QuestionDAO {
	//find by id
	public Question findById(int questionId) throws Exception {
		String hql = "from Question q left join fetch q.tbAnswers a join fetch q.student s where q.questionId = ?";
		Object[] param ={questionId};
		List<Question> list = this.getHibernateTemplate().find(hql,param);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
	//分页
	public List<Question> findPage(final int page,final  int pagesize, final String sortname,
			final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Question q join fetch q.student s order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	//条件搜索，带分页
	public List<Question> searchPage(final int page, final int pagesize,final  String sortname,
			final String sortorder,final String content) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Question q join fetch q.student s "+content+" order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
		
		
	}
	//保存
	public void save(Question question) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(question);
	}
	//find by stuId
	public List<Question> findByStuId(int stuId) throws Exception {
		String hql ="from Question q where q.student.stuId = "+stuId;
		
		return this.getHibernateTemplate().find(hql);
	}
	public long findTotal(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Question q "+criteria;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	public boolean delete(Question question) throws Exception {
		// TODO Auto-generated method stub
		if(question==null)		return false;
		this.getHibernateTemplate().delete(question);
		return true;
	}
	public Question findBy2Id(int questionId, int stuId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Question q where q.questionId = ? and q.student.stuId = ?";
		Object[] params  = {questionId,stuId};
		List<Question> list = this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
	public List<Question> findByClassId(int classId,int type) {
		if(type==-1){
			String hql = "select q from Question q where q.classId =  "+classId;
			return this.getHibernateTemplate().find(hql);
		}else{
			String hql ="select q from Question q where q.classId ="+classId +" and q.questionStatus="+type;
			return this.getHibernateTemplate().find(hql);
		}
		
	}
}
