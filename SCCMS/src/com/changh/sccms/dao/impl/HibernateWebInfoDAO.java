package com.changh.sccms.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.WebInfoDAO;
import com.changh.sccms.entity.WebInfo;

public class HibernateWebInfoDAO extends HibernateDaoSupport implements WebInfoDAO{

	public void saveOrUpdate(WebInfo info) {
		this.getHibernateTemplate().saveOrUpdate(info);
		
	}

	public WebInfo findWebInfo() {		
		List list = this.getHibernateTemplate().find("from WebInfo");
		if(list!=null&&list.size()!=0){
			return (WebInfo) list.get(0);
		}else{
			return null;
		}
	}

}
