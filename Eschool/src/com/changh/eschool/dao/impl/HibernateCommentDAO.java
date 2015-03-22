package com.changh.eschool.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.CommentDAO;
import com.changh.eschool.entity.Comment;

public class HibernateCommentDAO extends HibernateDaoSupport implements CommentDAO{

	public List<Comment> findByTchId(final int tchId, final int page, final int pagesize,
			final String sortname, final String sortorder) {
			return (List)this.getHibernateTemplate().execute(
					new HibernateCallback()
					{
						public Object doInHibernate(Session session)
						{
							//使用session执行分页查询代码
							String hql="from Comment c where c.tchId="+tchId+" order by "+sortname+" "+sortorder;
							Query query=session.createQuery(hql);
							query.setFirstResult((page-1)*pagesize);
							query.setMaxResults(pagesize);
							return query.list();
						}
					}
			);
		
	}

	public int findTotal(int tchId) {
		String hql = "select count(*) from Comment c where c.tchId="+tchId;
		Long count = (Long) this.getHibernateTemplate().find(hql).get(0);
		return count.intValue();
	}

	public int findSorce(int tchId) {
		String hql = "select avg(c.commentScore) from Comment c where c.tchId="+tchId;
		List list = this.getHibernateTemplate().find(hql);
		if(list.get(0)!=null){
			double score = (Double) list.get(0);
			return (int) Math.ceil(score);
		}else{
			return 5;
		}
	}

	public void save(Comment comment) {
		this.getHibernateTemplate().save(comment);
	}

	public int getCommentId() {
		String hql ="select max(c.commentId) from Comment c ";
		Integer id=	(Integer) this.getHibernateTemplate().find(hql).get(0);
		if(id==null){
			return 1001;
		}else{
			return id+1;
		}
	}
	
}
