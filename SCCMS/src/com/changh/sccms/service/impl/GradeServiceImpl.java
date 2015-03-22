package com.changh.sccms.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.changh.sccms.dao.GradeDAO;
import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.GradeCategory;
import com.changh.sccms.service.GradeService;

public class GradeServiceImpl implements GradeService{
	//injection
	private GradeDAO gradeDao;	
	
	
	public List<Grade> gradeList(int id) {
		List<Grade> list=gradeDao.findbyExamId(id);
		return list;
	}


	public void setGradeDao(GradeDAO gradeDao) {
		this.gradeDao = gradeDao;
	}


	public List<Object[]> TeacherList(int examId,int examPid) {
		List<Object[]> list = gradeDao.findByExamPid(examId,examPid);
		return list;
	}


	public List<GradeCategory> classList() {
		return gradeDao.findAll();
	}


	public List<ExamCategory> examList(int examPid) {
		
		return gradeDao.findByPid(examPid);
	}


	public Grade findById(int gradeId) {
		return gradeDao.findById(gradeId);
	}


	public void delete(int gradeId) {
		gradeDao.delete(gradeId);	
	}


	public GradeCategory findByGtypeId(int gtypeId) {
		return gradeDao.findByGtypeId(gtypeId);
	}


	public void update(Grade grade) {
		gradeDao.update(grade);
	}
	
	public void save(Grade grade){
		gradeDao.save(grade);
	}


	public int getGradeId() {
		return gradeDao.getGradeId();
	}


	public boolean saveGradeCategory(GradeCategory gc) {
		return gradeDao.saveGradeCategory(gc);
	}


	public int getGCId() {
		return gradeDao.getGCId();
	}
	
	public List<List<Grade1>> findByExamId(int examId) {
		List<GradeCategory> list =gradeDao.findAll();
		List<List<Grade1>> l = new ArrayList<List<Grade1>>();
		if(list!=null&&list.size()!=0){		
			for(GradeCategory g:list){
				List<Grade1> list1=gradeDao.findGradeByExamPidAndGradeCategory(g.getGtypeName(), examId);
				if(list1!=null&&list1.size()!=0){
					l.add(list1);
				}
			}
			return l;
		}else{
			return null;
			
		}
		
	}

	public List<Grade1> findByTchId(int tchId) {	
		return gradeDao.findByTchId(tchId);
	}
	@Override
	public List<Grade> findbyExamPid(int pid) {
		// TODO Auto-generated method stub
		return gradeDao.findbyExamPid(pid);
	}
	@Override
	public void update(Integer gradeId, String dataFileUrl) {
		gradeDao.update(gradeId, dataFileUrl);
	}
}
