package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.entity.Deal;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.PackageCategory;
import com.changh.eschool.entity.StuDeal;


public interface ClassPackageDAO {
	//按考试examId查找所有的套餐
	public  List<ClassPackage> findClassPackage(int examId);
	//按考试Id以及套餐名字查找套餐Id
	public int findPackageCategory(String pkgName,int examId);
	//按pkgId查找所有子套餐类型
	public List<PackageCategory> findPackageId(int ptypePid);
	//按套餐类型查找所以的具体套餐
	public List<ClassPackage> findPackage(int ptyeId);
	/**
	 * 查找该考试类别下面的一级套餐类型
	 * @param examId
	 * @return
	 */
	public List<PackageCategory> findByExamId(int examId);
	//findbyid
	public ClassPackage findById(int pkgId);
	//查找套餐下面的班级
	public List<Grade> findByPkgId(int pkgId);
	/**
	 * 根据套餐Id查找考试Id
	 * @param pkgId
	 * @return
	 */
	public int findExamId(int ptypeId);
	/**
	 * 根据套餐id查询所在考试的第二级名称
	 */
	public String findExamName(int pkgId)throws Exception;
	/**
	 * 查找协议by dealId
	 * @param dealId
	 * @return
	 */
	public Deal findByDealId(int dealId);
	/**
	 * 保存学生协议
	 * @param sd
	 */
	public void saveStuDeal(StuDeal sd);
	/**
	 * 修改学生协议
	 */
	public void update(StuDeal sd);
	/**
	 * 删除学生协议
	 */
	public void deleteStuDeal(StuDeal sd);
	/**
	 * 查找学生协议
	 */
	public StuDeal findByStuDealId(int stuDealId);
	/**
	 * 按套餐查找协议
	 * @param pkgId
	 * @return
	 */
	public Deal findDealByPkgId(int pkgId);
	/**
	 * 获得学生协议id
	 */
	public int findStuDealId();
	/**
	 * 查找当前学生的协议
	 * @param stuId
	 * @return
	 */
	public List<StuDeal> findStuDealByStuId(int stuId,int page,int pagesize);
	/**
	 * 查找学生协议的数量
	 * @param stuId
	 * @return
	 */
	public int findStuDealTotal(int stuId);
	
}
