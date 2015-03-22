package com.changh.eschool.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ReplyDAO;
import com.changh.eschool.entity.Reply;

public class HibernateReplyDAO extends HibernateDaoSupport implements ReplyDAO{
	public void save(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(reply);
	}
	public Reply findByAcId(int acId) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from Reply where acId = ?";
		Object[] params ={acId};
		List<Reply> list = (List<Reply>) this.getHibernateTemplate().find(hql, params);
		if(list.isEmpty()) return null;
		return list.get(0);
	}
}
