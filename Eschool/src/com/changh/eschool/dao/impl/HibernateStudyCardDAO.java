package com.changh.eschool.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.StudyCardDAO;
import com.changh.eschool.entity.StudyCard;

public class HibernateStudyCardDAO extends HibernateDaoSupport implements
		StudyCardDAO {

	public StudyCard findById(int cardId) throws Exception {
		return (StudyCard) this.getHibernateTemplate().get(StudyCard.class,
				cardId);
	}

	public void update(StudyCard studyCard) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(studyCard);
	}

	public StudyCard findCard(int cardId, String password) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from StudyCard where cardId =? and cardPassword = ?";
		Object[] params = {cardId,password};
		List<StudyCard> list= this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
}
