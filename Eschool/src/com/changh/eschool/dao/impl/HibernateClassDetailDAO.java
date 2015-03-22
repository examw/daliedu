package com.changh.eschool.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ClassDetailDAO;
import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Lecture;
import com.changh.eschool.entity.Note;

public class HibernateClassDetailDAO extends HibernateDaoSupport implements
		ClassDetailDAO {

	// 分页
	public List<ClassDetail> findByGid(final int gid, final int page,
			final int pagesize) {
		// TODO Auto-generated method stub
		final Date date1 = new Date();
		if (page == 0 || pagesize == 0) {
			String hql = "from ClassDetail cd where cd.gradeId=:gradeId and cd.classOpenTime <=:time";
			String[] key = { "gradeId", "time" };
			Object[] param = { gid, date1 };
			return this.getHibernateTemplate()
					.findByNamedParam(hql, key, param);
		} else {
			return (List) this.getHibernateTemplate().execute(
					new HibernateCallback() {
						public Object doInHibernate(Session session) {
							// 使用session执行分页查询代码
							String hql = "from ClassDetail cd where cd.gradeId="
									+ gid
									+ " and cd.classOpenTime <='"
									+ new SimpleDateFormat("yyyy-MM-dd")
											.format(date1)
									+ "'order by cd.classId";
							Query query = session.createQuery(hql);
							if (page != 0 && pagesize != 0) {
								query.setFirstResult((page - 1) * pagesize);
								query.setMaxResults(pagesize);
							}
							return query.list();
						}
					});
		}

	}

	public int findTotal(int gid) {
		String hql = "select count(*) from ClassDetail cd where cd.gradeId="
				+ gid;
		Long total = (Long) this.getHibernateTemplate().find(hql).get(0);
		return total.intValue();
	}

	public Grade findById(int gradeId) {
		String hql = "select grade from Grade grade where grade.gradeId="
				+ gradeId;
		List list = this.getHibernateTemplate().find(hql);
		return (Grade) list.get(0);
	}

	public void save(ClassDetail classDetail) {
		String hql2 = "select g from Grade g where g.gradeId="
				+ classDetail.getGradeId();
		Grade g = (Grade) this.getHibernateTemplate().find(hql2).get(0);
		g.setGradeTime(g.getGradeTime() + 1);
		this.getHibernateTemplate().update(g);
		this.getHibernateTemplate().save(classDetail);
	}

	public void delete(int classId) {
		String hql = "select lect from Lecture lect where lect.classId="
				+ classId;
		String hql1 = "select c from ClassDetail c where c.classId=" + classId;
		ClassDetail c = (ClassDetail) this.getHibernateTemplate().find(hql1)
				.get(0);
		String hql2 = "select g from Grade g where g.gradeId=" + c.getGradeId();
		Grade g = (Grade) this.getHibernateTemplate().find(hql2).get(0);
		g.setGradeTime(g.getGradeTime() - 1);
		this.getHibernateTemplate().update(g);
		List list = this.getHibernateTemplate().find(hql);
		this.getHibernateTemplate().deleteAll(list);
		this.getHibernateTemplate().delete(findByClassId(classId));
	}

	public ClassDetail findByClassId(int classId) {
		String hql = "select c from ClassDetail c where c.classId=" + classId;
		return (ClassDetail) this.getHibernateTemplate().find(hql).get(0);
	}

	public void update(ClassDetail classDetail) {
		String hql = "select cd from ClassDetail cd where cd.classId="
				+ classDetail.getClassId();
		List list = this.getHibernateTemplate().find(hql);
		ClassDetail c = (ClassDetail) list.get(0);
		c.setClassAudio(classDetail.getClassAudio());
		c.setClassHdUrl(classDetail.getClassHdUrl());
		c.setClassIfFree(classDetail.getClassIfFree());
		c.setClassOpenTime(classDetail.getClassOpenTime());
		c.setClassTime(classDetail.getClassTime());
		c.setClassYear(classDetail.getClassYear());
		c.setClassTitle(classDetail.getClassTitle());
		c.setClassTriUrl(classDetail.getClassTriUrl());
		this.getHibernateTemplate().update(c);

	}

	/**
	 * 查找当前课节下面的所以讲义
	 */
	public List<Lecture> findLectureByClassId(int classId) {
		String hql = "select lect from Lecture lect where lect.classId ="
				+ classId;
		return this.getHibernateTemplate().find(hql);
	}

	public Grade findGradeByClassId(int classId) {
		// TODO Auto-generated method stub
		String hql = "select c from ClassDetail c where c.classId=" + classId;
		int gradeId = ((ClassDetail) this.getHibernateTemplate().find(hql)
				.get(0)).getGradeId();
		String hql1 = "select g from Grade g where g.gradeId=" + gradeId;
		Date newdate = new Date();
		// 创建基于当前时间的日历对象
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		String date = dd.format(newdate);
		String hql3 = "select c from ClassDetail c where c.gradeId=" + gradeId
				+ " and c.classOpenTime <= '" + date + "'";
		List<ClassDetail> list = this.getHibernateTemplate().find(hql3);
		Grade grade = (Grade) this.getHibernateTemplate().find(hql1).get(0);
		grade.setClassDetails(list);
		return grade;
	}

	public void addOrUpdateNote(Note note) {
		this.getHibernateTemplate().saveOrUpdate(note);
	}

	public int getNotePK() {
		String hql = "select max(note.noteId) from Note note";
		Integer id = (Integer) this.getHibernateTemplate().find(hql).get(0);
		if (id == null) {
			return 1001;
		} else {
			return id + 1;
		}

	}

	public List<Note> findMyNote(int classId, int stuId, int type) {
		String hql = "select note from Note note where note.classId=" + classId
				+ " and note.stuId=" + stuId + " and note.noteCouresType="
				+ type + " order by note.noteAddTime desc";
		List<Note> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	public void deleteNode(int noteId) {
		String hql = "select note from Note note where note.noteId=" + noteId;
		this.getHibernateTemplate().delete(
				this.getHibernateTemplate().find(hql).get(0));
	}

	@Override
	public List<ClassDetail> findClassDetailByGid(int gid, int status) {
		String hql = "from ClassDetail cd where cd.gradeId=? and cd.classIfFree=?";
		Object[] params = { gid, status };
		return this.getHibernateTemplate().find(hql, params);
	}

	@Override
	public Grade findGbyclassId(int classId) {
		// TODO Auto-generated method stub
		String hql = "select c from ClassDetail c where c.classId=" + classId;
		int gradeId = ((ClassDetail) this.getHibernateTemplate().find(hql).get(0)).getGradeId();
		String hql1 = "select g from Grade g where g.gradeId=" + gradeId;	
		Grade grade = (Grade) this.getHibernateTemplate().find(hql1).get(0);
		return grade;
	}
	
	@Override
	public List<ClassDetail> findFreeClassByGid(int gid) throws Exception {
		// TODO Auto-generated method stub
		String hql ="from ClassDetail cd where cd.classIfFree = 1 and cd.gradeId=?";
		Object[] param = new Object[]{gid};
		return this.getHibernateTemplate().find(hql, param);
	}
}
