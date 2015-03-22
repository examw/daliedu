package com.changh.eschool.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.changh.eschool.action.mobile.GradeGroup;
import com.changh.eschool.dao.ClassPackageDAO;
import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.entity.Deal;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.PackageCategory;
import com.changh.eschool.entity.SimpleTeacher;
import com.changh.eschool.entity.StuDeal;
import com.changh.eschool.service.ClassPackageService;


public class ClassPackageServiceImpl implements ClassPackageService{
	private ClassPackageDAO classPackageDao;
	public List<ClassPackage> findClassPackage(int ptypeId){
		List<ClassPackage> list = new ArrayList<ClassPackage>();
		List<PackageCategory> listPcCategory = classPackageDao.findPackageId(ptypeId);
		if(listPcCategory!=null&&listPcCategory.size()!=0){
			for(PackageCategory pc:listPcCategory){
				list.addAll(findClassPackage(pc.getPtypeId()));
			}
		}else{
			List<ClassPackage> listpc = classPackageDao.findPackage(ptypeId);
			for(ClassPackage cp :listpc){
				cp.setTch(findTchName(cp.getPkgId()));
			}
			list.addAll(listpc);
		}
		return list;
	} 
	
	public List<ClassPackage> findClassPackageNoTeacher(int ptypeId){
		List<ClassPackage> list = new ArrayList<ClassPackage>();
		List<PackageCategory> listPcCategory = classPackageDao.findPackageId(ptypeId);
		if(listPcCategory!=null&&listPcCategory.size()!=0){
			for(PackageCategory pc:listPcCategory){
				list.addAll(findClassPackageNoTeacher(pc.getPtypeId()));
			}
		}else{
			List<ClassPackage> listpc = classPackageDao.findPackage(ptypeId);
			list.addAll(listpc);
		}
		return list;
	} 
	public List<List<ClassPackage>> findByExamId(int examId) {
		List<List<ClassPackage>> list1 = new ArrayList<List<ClassPackage>>();
		List<PackageCategory> list = classPackageDao.findByExamId(examId);
		if(list!=null&&list.size()!=0){
			for(PackageCategory pc:list){
				list1.add(findClassPackage(pc.getPtypeId()));
				}
			return list1;
		}else{
			return null;
		}	
	}
	////method for mobileApp 2013.06.14 fw/////
	public List<GradeGroup> findPackageGroupByExamId(int examId) {
		List<GradeGroup> list1 = new ArrayList<GradeGroup>();
		List<PackageCategory> list = classPackageDao.findByExamId(examId);
		if(list!=null&&list.size()!=0){
			for(PackageCategory pc:list){
				List l = findClassPackage(pc.getPtypeId());
				if(l!=null&&l.size()>0)
				{
					GradeGroup gg = new GradeGroup(pc.getPtypeName(),l,1);
					list1.add(gg);
				}
			}
			return list1;
		}else{
			return null;
		}
	}
	//////////
	public ClassPackageDAO getClassPackageDao() {
		return classPackageDao;
	}
	public void setClassPackageDao(ClassPackageDAO classPackageDao) {
		this.classPackageDao = classPackageDao;
	}
	public HashSet<SimpleTeacher> findTchName(int pkgId) {
		List<Grade> gradeList = classPackageDao.findByPkgId(pkgId);
		HashSet<SimpleTeacher> list =new HashSet<SimpleTeacher>();
		for(Grade g :gradeList){
			SimpleTeacher tch = new SimpleTeacher();
			tch.setTchName(g.getTchName());
			tch.setTchId(g.getTeacher().getTchId());
			/*String tchName = g.getTchName();*/
			list.add(tch);	
		}
		/*for(int i=0;i<list.size()-1;i++){
			pkgTchName+=list.get(i)+"/";
		}
		pkgTchName +=list.get(list.size()-1);*/
		return list;
	}
	public List<Grade> findByPkgId(int pkgId) {
		return classPackageDao.findByPkgId(pkgId);
	}
	public Deal findByDealId(int dealId) {
		return classPackageDao.findByDealId(dealId);
	}
	public void saveStuDeal(StuDeal sd) {
		// TODO Auto-generated method stub
		classPackageDao.deleteStuDeal(sd);
		
	}
	public void update(StuDeal sd) {
		// TODO Auto-generated method stub
		classPackageDao.update(sd);
	}
	public void deleteStuDeal(StuDeal sd) {
		// TODO Auto-generated method stub
		classPackageDao.deleteStuDeal(sd);
	}
	public StuDeal findByStuDealId(int stuDealId) {	
		return classPackageDao.findByStuDealId(stuDealId);
	}
	public Deal findDealByPkgId(int pkgId) {
		return classPackageDao.findDealByPkgId(pkgId);
	}
	
	public int findStuDealId(){
		return classPackageDao.findStuDealId();
	}
	public List<StuDeal> findStuDealByStuId(int stuId,int page,int pagesize) {
		return classPackageDao.findStuDealByStuId(stuId, page, pagesize);
	}
	public int findStuDealTotal(int stuId) {
		return classPackageDao.findStuDealTotal(stuId);
	}
	@Override
	public List<PackageCategory> findPCbyExamId(int examId) {
		// TODO Auto-generated method stub
		return classPackageDao.findByExamId(examId);
	}
	@Override
	public ClassPackage findById(int pkgId) {
		
		return classPackageDao.findById(pkgId);
	}
	
}
