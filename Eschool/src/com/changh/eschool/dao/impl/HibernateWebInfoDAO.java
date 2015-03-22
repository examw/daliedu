package com.changh.eschool.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.WebInfoDAO;
import com.changh.eschool.entity.WebInfo;

public class HibernateWebInfoDAO extends HibernateDaoSupport implements WebInfoDAO{

	public WebInfo findWebInfo() {		
		List list = this.getHibernateTemplate().find("from WebInfo");
		if(list!=null&&list.size()!=0){
			return (WebInfo) list.get(0);
		}else{
			return null;
		}
	}

}
