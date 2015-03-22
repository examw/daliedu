package com.changh.sccms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.TeacherDAO;
import com.changh.sccms.entity.Teacher;

public class HibernateTeacherDAO extends HibernateDaoSupport implements TeacherDAO {
	
	//
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(findById(id));
		
	}
	//查询所有的老师
	public List<Teacher> findAll() throws Exception {
		List<Teacher> list = null;
		String hql ="from Teacher";
		list=this.getHibernateTemplate().find(hql);
		return list;
	}
	public List<Teacher> findAll(final int page, final int pagesize, final String sortname,
			final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Teacher order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	
	public Teacher findById(int id) throws Exception {
		Teacher tch = null;
		tch = (Teacher)this.getHibernateTemplate().get(Teacher.class, id);
		return tch;
	}

	public Teacher findByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Teacher where tchUsername=?";
		Object[] params={username};
		List list=this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty())
		{
			return null;
		}
		return (Teacher)list.get(0);
	}

	public List<Teacher> findByName(String name) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Teacher where tchName=?";
		Object[] params={name};
		List list=this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty())
		{
			return null;
		}
		return list;
	}

	public void update(Teacher teacher) throws Exception {
		this.getHibernateTemplate().update(teacher);
	}
	public void save(Teacher teacher) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(teacher);
	}
	public List<Teacher> search(String str, String searchName) throws Exception {
		StringBuffer hql=new StringBuffer("from Teacher where ");
		hql.append(searchName);
		hql.append(" like ");
		try
		{
			int id = Integer.parseInt(str);
			hql.append("'%");
			hql.append(id);
			hql.append("%'");
		}catch(Exception e)
		{
			hql.append("'%");
			hql.append(str);
			hql.append("%'");
		}
		List list=this.getHibernateTemplate().find(hql.toString());
		return list;
	}
	public List<Teacher> search(final int page,final int pagesize,final String sortname,
			final String sortorder,final String str,final String searchName) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Teacher where "+searchName+" like ? order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						try
						{
							int id = Integer.parseInt(str);
							//query.setInteger(0, id);
							query.setString(0, ("%"+id+"%"));
						}catch(Exception e)
						{
							query.setString(0, ("%"+str+"%"));
						}
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public long getTotal(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Teacher "+criteria;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	public Teacher findTeacherByTchId(int tchId) {
		String hql ="from Teacher where tchId="+tchId;
		return (Teacher) this.getHibernateTemplate().find(hql).get(0);
	}
}
