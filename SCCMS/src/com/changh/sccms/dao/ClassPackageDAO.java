package com.changh.sccms.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.entity.Deal;
import com.changh.sccms.entity.ExamGrade;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.PackageCategory;

public interface ClassPackageDAO {
	//按ptypeId查找套餐
	public List<ClassPackage> findByPtypeId(int ptypeId);
	//按examId查找套餐分类
	public List<PackageCategory> findByExamId(int examId);
	//按examId查找套餐
	public List<ClassPackage> findPackagesByExamId(int examId);
	//按pkgId查找班级
	public List<Grade> findByPkgId(int pkgId);
	//按examId查找所有班级
	public List<ExamGrade> gradeTree(int examId);
	//按dealId查找协议
	public Deal findByDealId(int dealId);
	//查找全部协议
	public List<Deal> findAllDeal();
	//按pkgIncludeCid查找套餐课时
	public ClassPackage findByPkgIncludeCid(ClassPackage p);
	//添加套餐
	public void save(ClassPackage  classPackage);
	//检查该套餐类别下面是否有具体套餐
	public boolean checkPackage(int ptypeId);
	//添加套餐类别
	public void savePackageCategory(PackageCategory packageCategory);
	//按ptypeId查找套餐类别
	public PackageCategory loadCategory(int ptypeId);
	//修改套餐类别
	public void ModifyPackageCategory(PackageCategory packageCategory);
	//删除套餐类别
	public boolean deletePackageCategory(int ptypeId);
	//按 pkgId查找套餐
	public ClassPackage loadClassPackage(int pkgId);
	//修改具体套餐
	public void ModifyClassPackage(ClassPackage classPackage);
	//删除具体套餐
	public void DeleteClassPackage(int pkgId);
	//按pkgId查找所有子套餐类型
	public List<PackageCategory> findPackageId(int ptypePid);
	//按套餐类型查找所以的具体套餐
	public List<ClassPackage> findPackage(int ptyeId);
	/**
	 * 关联老师的班级
	 * @param pkgId
	 * @return
	 */
	public List<Grade1> findGrade1ByPkgId(int pkgId);
	/**
	 * 套餐类别id
	 * @return
	 */
	public int getPackageCategoryId();
	/**
	 * 获得套餐id
	 * @return
	 */
	public int getClassPackageId();
	/**
	 * 添加协议
	 * @param deal
	 */
	public void AddDeal(Deal deal);
	/**
	 * 获得协议ID
	 * @return
	 */
	public int findDealId();
	/**
	 * 修改协议
	 */
	public void update(Deal deal);
	/**
	 * 删除协议
	 */
	public void  delet(Deal deal);
	
	//2014.03.15
	public int findExamId(int ptypeId);
	public String findExamName(final int pkgId) throws Exception ;


}