package com.changh.sccms.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ClassDetailDAO;
import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.until.HibernateSessionFactory;

public class HibernateClassDetailDAO extends HibernateDaoSupport implements ClassDetailDAO{

	public List<ClassDetail> findByGid(int gid) {
		String hql ="select cd from ClassDetail cd where cd.gradeId="+gid +" order by cd.classAddTime desc";
		return this.getHibernateTemplate().find(hql);
	}

	public List<ClassDetail> findClassDetailByGid(int gid, int status) {
		String hql ="from ClassDetail cd where cd.gradeId=? and cd.classIfFree=?";
		Object[] params= {gid,status};
		return this.getHibernateTemplate().find(hql, params);
	}
	public Grade findById(int gradeId) {
		String hql ="select grade from Grade grade where grade.gradeId="+gradeId;
		List list = this.getHibernateTemplate().find(hql);
		return (Grade) list.get(0);
	}

	public void save(ClassDetail classDetail) {
		String hql2 ="select g from Grade g where g.gradeId="+classDetail.getGradeId();
		Grade g = (Grade) this.getHibernateTemplate().find(hql2).get(0);
		g.setGradeTime(g.getGradeTime()+1);
		this.getHibernateTemplate().update(g);
		this.getHibernateTemplate().save(classDetail);
	}

	public void delete(String  classId) {
		String[] strClassId = classId.split(",");
		for(String s:strClassId){
			int	id = Integer.parseInt(s);
			String hql ="select lect from Lecture lect where lect.classId="+id;
			String hql1 ="select c from ClassDetail c where c.classId="+id;
			ClassDetail c = (ClassDetail) this.getHibernateTemplate().find(hql1).get(0);
			String hql2 ="select g from Grade g where g.gradeId="+c.getGradeId();
			Grade g = (Grade) this.getHibernateTemplate().find(hql2).get(0);
			g.setGradeTime(g.getGradeTime()-1);
			this.getHibernateTemplate().update(g);
			List list=	this.getHibernateTemplate().find(hql);
			if(list!=null&&list.size()!=0){
				this.getHibernateTemplate().deleteAll(list);
			}
			this.getHibernateTemplate().delete(findByClassId(id));
		}
	}
	public ClassDetail findByClassId(int classId){
		String hql ="select c from ClassDetail c where c.classId="+classId;
		return (ClassDetail) this.getHibernateTemplate().find(hql).get(0);
	}

	public void update(ClassDetail classDetail) {
		String hql ="select cd from ClassDetail cd where cd.classId="+classDetail.getClassId();
		List list = this.getHibernateTemplate().find(hql);
		ClassDetail c = (ClassDetail) list.get(0);
		c.setClassAudio(classDetail.getClassAudio());
		c.setClassHdUrl(classDetail.getClassHdUrl());
		c.setClassIfFree(classDetail.getClassIfFree());
		c.setClassOpenTime(classDetail.getClassOpenTime());
		c.setClassTime(classDetail.getClassTime());
		c.setClassYear(classDetail.getClassYear());
		c.setClassTitle(classDetail.getClassTitle());
		c.setClassTriUrl(classDetail.getClassTriUrl());
		this.getHibernateTemplate().update(c);
		
	}
	
	public int getClassId() {
		String hql = "select max(c.classId) from ClassDetail c";	
		Integer curr_id = (Integer)this.getHibernateTemplate().find(hql).get(0);//获取最大的id值
		if(curr_id == null){//如果没有记录,返回一个0001编号
			return 1001;
		}
		//2.根据当前id+1,获取下一个
		return curr_id+1;
	}
	public long findNumByGid(int gradeId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from ClassDetail c where c.gradeId="+gradeId;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}

	public Grade findGradeByClassId(int classId) {
		String hql ="select c from ClassDetail c where c.classId="+classId;
		int gradeId = ((ClassDetail)this.getHibernateTemplate().find(hql).get(0)).getGradeId();
		String hql1 ="select g from Grade g where g.gradeId="+gradeId;
		Grade grade = (Grade) this.getHibernateTemplate().find(hql1).get(0);
		return grade;
	}
	
	@Override
	public void updateOpenTime(String ids, Date time) {
		String hql = "update ClassDetail c set c.classOpenTime = ? where c.classId in("+ids+")";
		Object[] params = new Object[]{time};
		this.getHibernateTemplate().bulkUpdate(hql, params);
	}
}
