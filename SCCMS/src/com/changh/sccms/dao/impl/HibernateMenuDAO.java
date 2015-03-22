package com.changh.sccms.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.MenuDAO;
import com.changh.sccms.entity.Menu;
import com.changh.sccms.entity.Role;

public class HibernateMenuDAO extends HibernateDaoSupport implements MenuDAO {

	public List<Menu> findByPidMenu(int pid) {
		String hql ="from Menu m where m.menuPid="+pid;
		return this.getHibernateTemplate().find(hql);
	}

	public void saveOrUpdate(Menu m) {
		this.getHibernateTemplate().saveOrUpdate(m);
	}
	public Menu findMenuById(int id){
		return (Menu) this.getHibernateTemplate().find("from Menu m where m.id="+id).get(0);
	}
	
	public boolean delete(int id) {
		this.getHibernateTemplate().delete(getHibernateTemplate().find("from Menu m where m.id="+id).get(0));
		return true;
	}

	public List<Role> findAll() {
		String hql = "from Role";
		return this.getHibernateTemplate().find(hql);
	}

	public void saveOrUpdateRole(Role role) {
		this.getHibernateTemplate().saveOrUpdate(role);
	}

	public void deleteRole(int id) {
		this.getHibernateTemplate().delete(findById(id));
	}

	public Role findById(int id) {
		String hql ="from Role r where r.roleId="+id;
		return (Role) this.getHibernateTemplate().find(hql).get(0);
	}
    public List<Menu> findByAdmin(final int pid, final List list){  
    	return (List<Menu>) getHibernateTemplate().execute(new HibernateCallback(){  
            public Object doInHibernate(Session session) throws HibernateException,SQLException {  
            	String hql = "select m from Menu m where m.menuPid=? and m.id in(:ids)";
            	Query query=session.createQuery(hql);
                query.setInteger(0,pid); 
                query.setParameterList("ids", list); 
                return query.list();  
            }  
        });  
    }  
	

}