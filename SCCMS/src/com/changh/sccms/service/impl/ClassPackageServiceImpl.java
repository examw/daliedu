package com.changh.sccms.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import com.changh.sccms.dao.ClassPackageDAO;
import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.entity.Deal;
import com.changh.sccms.entity.ExamGrade;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.PackageCategory;
import com.changh.sccms.entity.SimpleTeacher;
import com.changh.sccms.service.ClassPackageService;

public class ClassPackageServiceImpl implements ClassPackageService {
	private ClassPackageDAO classPackageDao;

	public List<PackageCategory> findByExamId(int examId) {
		return classPackageDao.findByExamId(examId);
	}

	public ClassPackageDAO getClassPackageDao() {
		return classPackageDao;
	}

	public void setClassPackageDao(ClassPackageDAO classPackageDao) {
		this.classPackageDao = classPackageDao;
	}

	public List<ClassPackage> findByPtypeId(int ptypeId) {
		return classPackageDao.findByPtypeId(ptypeId);
	}

	public List<Grade> findByPkgId(int pkgId) {	
		return classPackageDao.findByPkgId(pkgId);
	}

	public List<ExamGrade> gradeTree(int examId) {
		return classPackageDao.gradeTree(examId);
	}

	public List<Deal> findAllDeal() {
		return classPackageDao.findAllDeal();
	}

	public ClassPackage findByPkgIncludeCid(ClassPackage pkgIncludeCid) {
		return classPackageDao.findByPkgIncludeCid(pkgIncludeCid);
	}

	public void save(ClassPackage classPackage) {
		classPackageDao.save(classPackage);
	}

	public boolean checkPackage(int ptypeId) {
		return	classPackageDao.checkPackage(ptypeId);
	}

	public void savePackageCategory(PackageCategory packageCategory) {
		classPackageDao.savePackageCategory(packageCategory);
	}

	public PackageCategory loadCategory(int ptypeId) {
		return classPackageDao.loadCategory(ptypeId);
	}

	public void modifyPackageCategory(PackageCategory packageCategory) {
		classPackageDao.ModifyPackageCategory(packageCategory);
	}

	public boolean deletePackageCategory(int ptypeId) {
		return classPackageDao.deletePackageCategory(ptypeId);
	}

	public ClassPackage loadClassPackage(int pkgId) {
		
		return classPackageDao.loadClassPackage(pkgId);
	}

	public Deal findByDealId(int dealId) {
		return classPackageDao.findByDealId(dealId);
	}

	public void modifyClassPackage(ClassPackage classPackage) {
		classPackageDao.ModifyClassPackage(classPackage);
	}

	public void deleteClassPackage(int pkgId) {
		classPackageDao.DeleteClassPackage(pkgId);
	}

	public void addDeal(Deal deal) {
		classPackageDao.AddDeal(deal);
		
	}

	public int findDealId() {
		return classPackageDao.findDealId();
	}

	public void update(Deal deal) {
		classPackageDao.update(deal);
		
	}

	public void delet(Deal deal) {
		classPackageDao.delet(deal);
		
	}

	public int getPackageCategoryId() {
		return classPackageDao.getPackageCategoryId();
	}

	public int getClassPackageId() {		
		return classPackageDao.getClassPackageId();
	}
	public List<List<ClassPackage>> findClassPackageByExamId(int examId) {
		List<List<ClassPackage>> list1 = new ArrayList<List<ClassPackage>>();
		List<PackageCategory> list = classPackageDao.findByExamId(examId);
		if(list!=null&&list.size()!=0){
			for(PackageCategory pc:list){
				List<ClassPackage> list2 = findClassPackage(pc.getPtypeId());
				if(list2!=null&&list2.size()!=0){
					list1.add(list2);
				}
				}
			return list1;
		}else{
			return null;
		}	
	}
	
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
	
	public HashSet<SimpleTeacher> findTchName(int pkgId) {
		List<Grade1> gradeList = classPackageDao.findGrade1ByPkgId(pkgId);
		HashSet<SimpleTeacher> list =new HashSet<SimpleTeacher>();
		for(Grade1 g :gradeList){
			SimpleTeacher tch = new SimpleTeacher();
			tch.setTchName(g.getTchName());
			tch.setTchId(g.getTeacher().getTchId());
			/*String tchName = g.getTchName();*/
			list.add(tch);	
		}
		return list;
	}
	
	public List<PackageCategory> findPCbyExamId(int examId) {
		// TODO Auto-generated method stub
		return classPackageDao.findByExamId(examId);
	}
	
	@Override
	public List<ClassPackage> findPackagesByExamId(int examId) {
		// TODO Auto-generated method stub
		return classPackageDao.findPackagesByExamId(examId);
	}
}
