package com.changh.eschool.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.StudyRecordDAO;
import com.changh.eschool.entity.StudyRecord;

public class HibernateStudyRecordDAO extends HibernateDaoSupport implements StudyRecordDAO{

	public void save(StudyRecord studyRecord) {
		this.getHibernateTemplate().saveOrUpdate(studyRecord);
	}

	public int findSRecordId(int stuId,int classId) {
		String hql1 ="select sr.recordId from StudyRecord sr where sr.stuId="+stuId+" and sr.classId ="+classId;
		List list =this.getHibernateTemplate().find(hql1);
		if(list!=null&&list.size()!=0){
			return (Integer) list.get(0);
		}else{
			String hql ="select max(sr.recordId) from StudyRecord sr";
			Integer id=	(Integer) this.getHibernateTemplate().find(hql).get(0);
			if(id==null){
				return 1001;
			}else{
				return id+1;
			}
		}
	}

	public List<StudyRecord> findByStuId(int stuId) {
		String hql ="select sr from StudyRecord sr where sr.stuId="+stuId +"order by sr.recordStartTime desc";
		return this.getHibernateTemplate().find(hql);
	}
	
	public void deleteByStuId(int stuId) {		
		this.getHibernateTemplate().deleteAll(findByStuId(stuId));
	}

	public StudyRecord findByGradeId(int gradeId,int stuId) {
		String hql ="select sr from StudyRecord sr where sr.gradeId=? and sr.stuId=?";
		Object[] params = {gradeId,stuId};
		List<StudyRecord> list = this.getHibernateTemplate().find(hql, params);
		if(list!=null&&list.size()!=0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public StudyRecord findSRecord(int stuId, int classId) {
		String hql1 ="from StudyRecord sr where sr.stuId="+stuId+" and sr.classId ="+classId;
		List list =this.getHibernateTemplate().find(hql1);
		if(list!=null&&list.size()!=0){
			return (StudyRecord) list.get(0);
		}else{
			return null;
		}
	}
}
