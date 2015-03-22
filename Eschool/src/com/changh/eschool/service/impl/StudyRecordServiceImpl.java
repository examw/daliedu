package com.changh.eschool.service.impl;

import java.util.List;

import com.changh.eschool.dao.StudyRecordDAO;
import com.changh.eschool.entity.StudyRecord;
import com.changh.eschool.service.StudyRecordService;

public class StudyRecordServiceImpl implements StudyRecordService{
	private StudyRecordDAO studyRecordDao;

	public void setStudyRecordDao(StudyRecordDAO studyRecordDao) {
		this.studyRecordDao = studyRecordDao;
	}
	public void save(StudyRecord studyRecord) {
		studyRecordDao.save(studyRecord);
	}
	
	public int findRecordId( int stuId,int classId) {
		return 	studyRecordDao.findSRecordId(stuId,classId);	
	}
	public List<StudyRecord> findByStuId(int stuId) {
		return studyRecordDao.findByStuId(stuId);
	}
	public void deleteByStuId(int stuId) {
		studyRecordDao.deleteByStuId(stuId);
	}
	public StudyRecord findByGreadId(int gradeId,int stuId) {
		return studyRecordDao.findByGradeId(gradeId,stuId);
	}
	@Override
	public StudyRecord findSRecord(int stuId, int classId) {
		return studyRecordDao.findSRecord(stuId, classId);
	}
}
