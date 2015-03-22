package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.List;

import com.changh.sccms.dao.ClassDetailDAO;
import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.service.ClassDetailService;

public class ClassDetailServiceImpl implements ClassDetailService{
	private ClassDetailDAO classDetailDao;
	
	public List<ClassDetail> listClassDetail(int gid) {
		return classDetailDao.findByGid(gid);
	}

	public void setClassDetailDao(ClassDetailDAO classDetailDao) {
		this.classDetailDao = classDetailDao;
	}

	public Grade findById(int gradeId) {	
		return classDetailDao.findById(gradeId);
	}

	public void save(ClassDetail classDetail) {
		classDetailDao.save(classDetail);
	}

	public void delete(String classId) {
		classDetailDao.delete(classId);
	}

	public ClassDetail findByClassId(int classId) {
		return classDetailDao.findByClassId(classId);
	}

	public void update(ClassDetail classDetail) {
		classDetailDao.update(classDetail);
	}

	public int getClassId() {
		// TODO Auto-generated method stub
		return classDetailDao.getClassId();
	} 
	public int findNumByGid(int gradeId) throws Exception {
		// TODO Auto-generated method stub
		return (int) classDetailDao.findNumByGid(gradeId);
	}

	public Grade findGradeByClassId(int classId) {
		
		return classDetailDao.findGradeByClassId(classId);
	}
	public List<ClassDetail> findClassDetailByGid(int gid, int status) {
		return classDetailDao.findClassDetailByGid(gid, status);
	}
	
	@Override
	public boolean updateOpenTime(String ids, Date time) {
		if(ids==null || ids.trim().isEmpty())
			return false;
		if(time == null ) return false;
		this.classDetailDao.updateOpenTime(ids,time);
		return true;
	}
}
