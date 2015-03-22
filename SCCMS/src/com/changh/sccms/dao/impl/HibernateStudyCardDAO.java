package com.changh.sccms.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.StudyCardDAO;
import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.StudyCard;

public class HibernateStudyCardDAO extends HibernateDaoSupport implements StudyCardDAO {
	//批量生成学习卡
	public void createCards(final List<StudyCard> list) throws Exception {
		this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				int count=0;
				for(int i=0;i<list.size();i++)
				{
					session.save(list.get(i));
					count++;
					if(count%20==0)
					{
						session.flush();
						session.clear();//不让hibernate缓存太多对象，没必要
					}
				}
				session.flush();
				session.clear();
				return null;
			}
			
		});
	}
	//find all
	public List<StudyCard> findAll(String admUsername) throws Exception {
		String hql = "from StudyCard";
		if(admUsername != null){
			hql = "from StudyCard where createUsername = ? ";
		}
		return this.getHibernateTemplate().find(hql,new Object[]{admUsername});
	}
	//找出一定日期后生成的所有
	public List<StudyCard> findAll(Date date,String admUsername) throws Exception {
		String hql="from StudyCard s where s.cardAddTime > ? ";
		Object[] params= null;
		if(admUsername == null){
			params = new Object[]{date};
		}else{
			hql = hql+" and s.createUsername = ?";
			params = new Object[]{date,admUsername};
		}
		return this.getHibernateTemplate().find(hql, params);
	}
	//
	public List<StudyCard> findTopN(final int num,final String admUsername) throws Exception {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from StudyCard where cardUseTime is null order by cardAddTime desc";
						if(admUsername != null){
							hql = "from StudyCard where cardUseTime is null and createUsername = '"+admUsername+"' order by cardAddTime desc";
						}
						Query query=session.createQuery(hql);
						query.setFirstResult(0);
						query.setMaxResults(num);
						return query.list();
					}
				}
			);
	}
	public List<StudyCard> findTopN(int num,final int page,final int pagesize,
			String sortName, String sortorder,final String admUsername) {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from StudyCard where cardUseTime is null order by cardAddTime desc";
						if(admUsername != null){
							hql = "from StudyCard where cardUseTime is null and createUsername = '"+admUsername+"' order by cardAddTime desc";
						}
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	//分页查询
		public List<StudyCard> findPage(final int page,final int pagesize,final String sortName,final String sortorder,final String admUsername)
		{
			return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from StudyCard order by "+sortName+" "+sortorder;
						if(admUsername != null){
							hql="from StudyCard where createUsername = '"+admUsername+"' order by "+sortName+" "+sortorder;
						}
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
		}
		public long findTotal(String admUsername) throws Exception {
			String hql = "select count(*) from StudyCard";
			if(admUsername != null){
				hql = "select count(*) from StudyCard where createUsername = '"+admUsername+"'";
			}
			return (Long) this.getHibernateTemplate().find(hql).get(0);
					
		}
		public StudyCard findById(int cardId) throws Exception {

			return (StudyCard) this.getHibernateTemplate().get(StudyCard.class, cardId);
		}
	@Override
	public List<StudyCard> findPageByParams(final int page,final int pagesize,
			final String sortName,final String sortorder,final String admUsername,final String params)
			throws Exception {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql= "from StudyCard where 1 = 1 ";
						if(params!=null){
							hql += " and( prefix like '%"+params+"%' or cardId like '%"+params+"%')";
						}
						if(admUsername != null){
							hql +=" and createUsername = '"+admUsername+"'";
						}
						hql +=  " order by "+sortName+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	@Override
	public long findTotalByParams(String admUsername, String params)
			throws Exception {
		String hql = "select count(*) from StudyCard where 1 = 1 ";
		if(admUsername != null){
			hql += " and createUsername = '"+admUsername+"' ";
		}
		if(params!=null){
			hql += " and (prefix like '%"+params+"%' or cardId like '%"+params+"%')";
		}
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
}
