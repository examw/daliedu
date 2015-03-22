package com.changh.sccms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ExamPaperDAO;
import com.changh.sccms.entity.ExamPaper;
import com.changh.sccms.until.Arith;

public class HibernateExamPaperDAO extends HibernateDaoSupport implements
		ExamPaperDAO {

	// 保存
	public int save(final ExamPaper paper) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						session.save(paper);
						// 采用数据库函数来自定义主键，而Hibernate的主键生成方式是native，
						// save方法返回的id值并不是主键order_id而是identity值
						// 这么做不知道在并发量大的情况下是否正常，是否能保证就是刚刚生成的那条记录
						String hql = "select paperId from ExamPaper where id = "
								+ paper.getPaperId();
						Query query = session.createQuery(hql);
						int id = (Integer) query.list().get(0);
						session.evict(paper);// 脱管
						return id;
					}
				});
	}
	public ExamPaper findById(int paperId) throws Exception {
		// TODO Auto-generated method stub
		return (ExamPaper) this.getHibernateTemplate().get(ExamPaper.class,
				paperId);
	}

	public void update(ExamPaper paper) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(paper);
	}
	public void updatePaperScore(int paperId, double score) throws Exception {
		// TODO Auto-generated method stub
		ExamPaper paper = findById(paperId);
		paper.setPaperScore((int) Arith.sub(paper.getPaperScore(), score));
	}

	public List<ExamPaper> findPageByExamId(final int examId, final int page,
			final int pagesize, final String sortname, final String sortorder)
			throws Exception {
		// TODO Auto-generated method stub
		return (List) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						// 使用session执行分页查询代码
						String hql = "from ExamPaper ep where ep.paperExamId = ? order by "
								+ sortname + " " + sortorder;
						Query query = session.createQuery(hql);
						query.setInteger(0, examId);
						query.setFirstResult((page - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
	}
	public List<ExamPaper> findPageByContent(final String content, final int page,
			final int pagesize, final String sortname, final String sortorder)
					throws Exception {
		// TODO Auto-generated method stub
		return (List) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						// 使用session执行分页查询代码
						String hql = "select distinct ep from ExamPaper ep "+ content+ "order by "
								+ sortname + " " + sortorder;
						Query query = session.createQuery(hql);
						query.setFirstResult((page - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
	}
	public long findTotalByContent(String content) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(distinct ep.paperId) from ExamPaper ep "+content;
		return (Long) this.getHibernateTemplate().find(hql).get(0);
	}
	public long findTotalByExamId(int examId) throws Exception {
		// TODO Auto-generated method stub
		String hql = "select count(*) from ExamPaper ep where ep.paperExamId = ?";
		Object[] params = { examId };
		return (Long) this.getHibernateTemplate().find(hql, params).get(0);
	}

	public void delete(ExamPaper paper) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(paper);
	}

	public ExamPaper findByName(String paperName) throws Exception {
		String hql = "from ExamPaper where paperName = ?";
		Object[] params = { paperName };
		List<ExamPaper> list = this.getHibernateTemplate().find(hql, params);
		if (list.isEmpty())
			return null;
		return list.get(0);
	}
}
