package com.changh.eschool.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.LessonCardDAO;
import com.changh.eschool.entity.LessonCard;

public class HibernateLessonCardDAO extends HibernateDaoSupport implements
		LessonCardDAO {

	public LessonCard findById(int cardId) throws Exception {
		return (LessonCard) this.getHibernateTemplate().get(LessonCard.class,
				cardId);
	}

	public void update(LessonCard lessonCard) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(lessonCard);
	}

	public LessonCard findCard(int cardId, String password) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from LessonCard where cardId =? and cardPassword = ?";
		Object[] params = {cardId,password};
		List<LessonCard> list= this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
}
