package com.changh.sccms.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.LectureDAO;
import com.changh.sccms.entity.Lecture;

public class HibernateLectureDAO extends HibernateDaoSupport implements LectureDAO{

	public void save(Lecture lecture) {
		this.getHibernateTemplate().save(lecture);
	}

	public List<Lecture> findByClassId(int classId) {
		String hql ="select lect from Lecture lect where lect.classId ="+classId;
		return this.getHibernateTemplate().find(hql);
	}

	public Lecture findByLectId(int lectId) {
		return (Lecture) this.getHibernateTemplate().get(Lecture.class, lectId);
	}

	public void update(Lecture lecture) {
		this.getHibernateTemplate().update(lecture);
	}

	public void delete(int lectId) {
		this.getHibernateTemplate().delete(findByLectId(lectId));
	}

	public int getLectId() {
		String hql = "select max(lect.lectId) from Lecture lect";	
		Integer curr_id = (Integer)this.getHibernateTemplate().find(hql).get(0);//获取最大的id值
		if(curr_id == null){//如果没有记录,返回一个0001编号
			return 1001;
		}
		//2.根据当前id+1,获取下一个
		return curr_id+1;
	}

}
