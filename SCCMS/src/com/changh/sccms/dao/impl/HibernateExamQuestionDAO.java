package com.changh.sccms.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ExamQuestionDAO;
import com.changh.sccms.entity.ExamQuestion;
import com.changh.sccms.entity.ExamRule;

public class HibernateExamQuestionDAO extends HibernateDaoSupport implements
		ExamQuestionDAO {

	public int save(final ExamQuestion question) throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		return (Integer) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						session.save(question);
						// 采用数据库函数来自定义主键，而Hibernate的主键生成方式是native，
						// save方法返回的id值并不是主键order_id而是identity值
						// 这么做不知道在并发量大的情况下是否正常，是否能保证就是刚刚生成的那条记录
						String hql = "select questId from ExamQuestion where id = "
								+ question.getQuestId();
						Query query = session.createQuery(hql);
						int id = (Integer) query.list().get(0);
						session.evict(question);// 脱管
						return id;
					}
				});
	}
	public void save1(ExamQuestion question) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(question);
	}
	public void save(final List<ExamQuestion> list,final int num) throws Exception {
		this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				int count = 0,j=Math.min(num, list.size());
				for (int i = 0; i < j; i++) {
//					if(list.get(i)!=null)
//					{
						session.save(list.get(i));
						count++;
//					}
					if (count % 20 == 0) {
						session.flush();
						session.clear();// 不让hibernate缓存太多对象
					}
				}
				session.flush();
				session.clear();
				return null;
			}
		});
	}

	public ExamQuestion findById(int questId) throws Exception {
		// TODO Auto-generated method stub
		return (ExamQuestion) this.getHibernateTemplate().get(
				ExamQuestion.class, questId);
	}

	public List<ExamQuestion> findByMD5Code(String md5code,int ruleId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from ExamQuestion eq where eq.questMd5code = ? and eq.questRuleId = ?";
		Object[] params = { md5code,ruleId };
		List<ExamQuestion> list = this.getHibernateTemplate().find(hql, params);
		if (list.isEmpty())
			return null;
		return list;
	}

	public void update(ExamRule question) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(question);
	}

	public List<ExamQuestion> findPageByCriteria(final String criteria,
			final int page, final int pagesize, final String sortname,
			final String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return (List<ExamQuestion>) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from ExamQuestion eq " + criteria
								+ " order by " + sortname + " " + sortorder;
						Query query = session.createQuery(hql);
						query.setFirstResult((page - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
	}

	public long findTotalByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from ExamQuestion eq " + criteria;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	public List<ExamQuestion> findByCriteria(String criteria) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from ExamQuestion eq "+criteria;
		return (List<ExamQuestion>)this.getHibernateTemplate().find(hql);
	}

	public void delete(ExamQuestion question) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(question);
	}

	public List<ExamQuestion> findAllByPaperId(int paperId) throws Exception {
		String hql = "from ExamQuestion where questPaperId = ? order by questRuleId asc,questOrderId asc";
		Object[] params = { paperId };
		return this.getHibernateTemplate().find(hql, params);
	}

	public List<ExamQuestion> findAllByRuleId(int ruleId) throws Exception {
		String hql = "from ExamQuestion where questRuleId = ? order by questOrderId asc";
		Object[] params = { ruleId };
		return this.getHibernateTemplate().find(hql, params);
	}

	public void deleteAll(List<ExamQuestion> questionList) throws Exception {
		this.getHibernateTemplate().deleteAll(questionList);
	}
	
	public void deleteAll(final String questIds) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				String sql = "delete from ExamQuestion where questId in "+questIds;
				Query query = session.createQuery(sql);
				return query.executeUpdate();
			}
		});
	}

	// 找题号
	public List<String> findQuestionNo(final int ruleId) throws Exception {
		// TODO Auto-generated method stub
		List<Integer> list = (List<Integer>) this.getHibernateTemplate()
				.execute(new HibernateCallback() {
					public Object doInHibernate(Session session) {
						String sql = "select questOrderId from ExamQuestion where questRuleId=? order by questOrderId asc";
						Query query = session.createQuery(sql);
						query.setInteger(0, ruleId);
						return query.list();
					}
				});
		List<String> list1 = new ArrayList<String>();
		for (Integer i : list) {
			list1.add(i.toString());
		}
		return list1;
	}
	public String findLinkedQid() throws Exception {
		// TODO Auto-generated method stub
		List<String> list = (List<String>)this.getHibernateTemplate()
		.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) {
				String sql = "select questLinkQuestionId from ExamQuestion order by questOrderId desc";
				Query query = session.createQuery(sql);
				return query.list();
			}
		});
		if(list.isEmpty()) return null;
		return list.get(0);
	}
}
