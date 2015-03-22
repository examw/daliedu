package com.changh.eschool.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.TeacherDAO;
import com.changh.eschool.entity.Teacher;

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
		String hql="from Teacher where "+searchName+"like ?";
		Object[] params=new Object[1];
		try
		{
			int id = Integer.parseInt(str);
			params[0]="'%"+id+"%'";
		}catch(Exception e)
		{
			params[0]="'%"+str+"%'";
		}
		List list=this.getHibernateTemplate().find(hql, params);
		return list;
	}
	public Teacher findBytchId(int tchId) {
		String hql ="from Teacher t where t.tchId="+tchId;
		return (Teacher) this.getHibernateTemplate().find(hql).get(0);
	}
}
