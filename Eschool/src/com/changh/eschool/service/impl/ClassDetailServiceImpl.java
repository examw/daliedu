package com.changh.eschool.service.impl;

import java.util.List;

import com.changh.eschool.dao.ClassDetailDAO;
import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Lecture;
import com.changh.eschool.entity.Note;
import com.changh.eschool.service.ClassDetailService;



public class ClassDetailServiceImpl implements ClassDetailService{
	private ClassDetailDAO classDetailDao;
	
	public List<ClassDetail> listClassDetail(int gid,int page,int pagesize) {
		return classDetailDao.findByGid(gid,page,pagesize);
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

	public void delete(int classId) {
		classDetailDao.delete(classId);
	}

	public ClassDetail findByClassId(int classId) {
		return classDetailDao.findByClassId(classId);
	}

	public void update(ClassDetail classDetail) {
		classDetailDao.update(classDetail);
	}

	public List<Lecture> findLectureByClassId(int classId) {
		
		return classDetailDao.findLectureByClassId(classId);
	}

	public Grade findGradeByClassId(int classId) {
		return classDetailDao.findGradeByClassId(classId);
	}

	public void addOrUpdateNote(Note note) {
		classDetailDao.addOrUpdateNote(note);
	} 
	public int getNotePK(){
		return classDetailDao.getNotePK();
	}

	public List<Note> findMyNote(int classId, int stuId, int type) {
		return classDetailDao.findMyNote(classId, stuId, type);
	}

	public void deleteNode(int noteId) {
		classDetailDao.deleteNode(noteId);
	}

	public int findTotal(int gradeId) {
		return classDetailDao.findTotal(gradeId);
	}

	@Override
	public List<ClassDetail> findClassDetailByGid(int gid, int status) {
		return classDetailDao.findClassDetailByGid(gid, status);
	}

	@Override
	public Grade findGbyclassId(int classId) {
		return classDetailDao.findGbyclassId(classId);
	}
	
	@Override
	public List<ClassDetail> findFreeClassByGid(int gid) throws Exception {
		// TODO Auto-generated method stub
		return classDetailDao.findFreeClassByGid(gid);
	}
}
