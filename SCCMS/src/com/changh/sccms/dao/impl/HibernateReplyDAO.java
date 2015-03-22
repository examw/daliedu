package com.changh.sccms.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ReplyDAO;
import com.changh.sccms.entity.Reply;

public class HibernateReplyDAO extends HibernateDaoSupport implements ReplyDAO{
	public void save(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(reply);
	}
	public List<Reply> findByAcId(int acId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Reply where acId = ?";
		Object[] param = {acId};
		return this.getHibernateTemplate().find(hql, param);
	}
}
