package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.entity.Deal;
import com.changh.sccms.entity.ExamGrade;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.PackageCategory;

public interface ClassPackageService {
	/**
	 * 查找考试下面的所以套餐
	 * @param examId
	 * @return
	 */
	public  List<List<ClassPackage>> findClassPackageByExamId(int examId);
	public List<PackageCategory> findByExamId(int examId);
	public List<ClassPackage> findByPtypeId(int ptypeId);
	public List<Grade> findByPkgId(int pkgId);
	public List<ExamGrade> gradeTree(int examId);
	//查找所有订单
	public List<Deal> findAllDeal();
	//按pkgIncludeCid 查找套餐课时
	public ClassPackage findByPkgIncludeCid(ClassPackage classPackage);
	//save classPackage
	public void save(ClassPackage classPackage);
	//判读套餐类别下面是否存在具体套擦
	public boolean checkPackage(int ptypeId);
	//添加套餐类别
	public void savePackageCategory(PackageCategory packageCategory);
	//load套餐类别
	public PackageCategory loadCategory(int ptypeId);
	//modify套餐类别
	public void modifyPackageCategory(PackageCategory packageCategory);
	//删除套餐类别
	public boolean deletePackageCategory(int ptypeId);
	//load具体套餐
	public ClassPackage loadClassPackage(int pkgId);
	//按dealId查找协议
	public Deal findByDealId(int dealId);
	//修改具体套餐
	public void modifyClassPackage(ClassPackage classPackage);
	//删除具体套餐
	public void deleteClassPackage(int pkgId);
	/**
	* @Title: findPCbyExamId
	* @Description: TODO(找到该考试类别下面的一级套餐类别)
	* @param examId
	* @return    设定文件
	 */
	public List<PackageCategory> findPCbyExamId(int examId);
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
	public void addDeal(Deal deal);
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
	public List<ClassPackage> findPackagesByExamId(int examId);
}
