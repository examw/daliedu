package com.changh.eschool.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.changh.eschool.action.mobile.GradeGroup;
import com.changh.eschool.dao.ClassPackageDAO;
import com.changh.eschool.dao.GradeDAO;
import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.GradeCategory;
import com.changh.eschool.service.GradeService;

public class GradeServiceImpl implements GradeService {
	private GradeDAO gradeDao;
	private ClassPackageDAO classPackageDao;
	public void setClassPackageDao(ClassPackageDAO classPackageDao) {
		this.classPackageDao = classPackageDao;
	}
	
	public GradeDAO getGradeDao() {
		return gradeDao;
	}

	public void setGradeDao(GradeDAO gradeDao) {
		this.gradeDao = gradeDao;
	}

	public List<List<Grade>> findByExamId(int examId) {
		List<GradeCategory> list =gradeDao.findAll();
		List<List<Grade>> l = new ArrayList<List<Grade>>();
		if(list!=null&&list.size()!=0){		
			for(GradeCategory g:list){
				List<Grade> list1=gradeDao.findGradeByExamPidAndGradeCategory(g.getGtypeName(), examId);
				l.add(list1);
			}
			return l;
		}else{
			return null;
			
		}
		
	}
	public Grade findById(int gradeId) {
		return gradeDao.findById(gradeId);
	}
	public List<Grade> findByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		return gradeDao.findByStuId(stuId);
	}
	public List<Grade> findByExamId2(int examId) throws Exception {
		// TODO Auto-generated method stub
		return gradeDao.findByCriteria(" where g.examCategory.examPid ="+examId);
	}

	public List<Grade> findByTchId(int tchId) {
		return gradeDao.findByTchId(tchId);
	}

	@Override
	public List<Grade> findGradeList(int stuId, int examId) throws Exception {
		return gradeDao.findGradeList(stuId, examId);
		
	}

	@Override
	public String findExamName(int gradeId) throws Exception {
		
		return gradeDao.findExamName(gradeId);
	}
	
////method for mobileApp 2013.06.14 fw/////
	public List<GradeGroup> findGroupGradeByExamId(int examId) {
		List<GradeCategory> list =gradeDao.findAll();
		List<GradeGroup> l = new ArrayList<GradeGroup>();
		if(list!=null&&list.size()!=0){		
			for(GradeCategory g:list){
				List<Grade> list1=gradeDao.findGradeByExamPidAndGradeCategory(g.getGtypeName(), examId);
				if(list1!=null&&list1.size()>0)
				{
					GradeGroup gg = new GradeGroup(g.getGtypeName(), list1,0);
					l.add(gg);
				}
			}
			return l;
		}else{
			return null;
		}
	}
	
	@Override
	public List<Grade> findByPackageId(int packageId) throws Exception {
		// TODO Auto-generated method stub
		ClassPackage cp = classPackageDao.findById(packageId);
		if(cp!=null)
			return gradeDao.findByIds(cp.getPkgIncludeCid());
		return null;
	}
}
