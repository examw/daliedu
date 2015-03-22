package com.changh.sccms.service.impl;

import java.util.List;

import com.changh.sccms.dao.LectureDAO;
import com.changh.sccms.entity.Lecture;
import com.changh.sccms.service.LectureService;

public class LectureServiceImpl implements LectureService{
	//injection
	private LectureDAO lectureDao;


	public void save(Lecture lecture) {
		lectureDao.save(lecture);
	}
	
	
	public void setLectureDao(LectureDAO lectureDao) {
		this.lectureDao = lectureDao;
	}


	public List<Lecture> findByClassId(int classId) {
		return lectureDao.findByClassId(classId);
	}


	public Lecture findByLectId(int lectId) {
		return lectureDao.findByLectId(lectId);
	}


	public void update(Lecture lecture) {
		lectureDao.update(lecture);
		
	}

	public void delete(int lectId) {
		lectureDao.delete(lectId);	
	}


	public int getLectId() {
		// TODO Auto-generated method stub
		return lectureDao.getLectId();
	}

}
