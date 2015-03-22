package com.changh.eschool.service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.changh.eschool.action.mobile.GradeGroup;
import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.entity.Deal;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Package;
import com.changh.eschool.entity.PackageCategory;
import com.changh.eschool.entity.SimpleTeacher;
import com.changh.eschool.entity.StuDeal;

/**
 * @Title: ClassPackageService.java
 * @Package com.changh.eschool.service
 * @Description: TODO(套餐service)
 * @author Failymiss jiangwei3457@163.com
 * @date 2013-6-7 上午10:00:51
 * @version V1.0
 */
public interface ClassPackageService {
	/**
	 * @Title: findById
	 * @Description: TODO(按ID查找套餐)
	 * @return 设定文件
	 */
	public ClassPackage findById(int pkgId);

	/**
	 * 查找考试下面的所以套餐
	 * 
	 * @param examId
	 * @return
	 */
	public List<List<ClassPackage>> findByExamId(int examId);

	public List<GradeGroup> findPackageGroupByExamId(int examId) ;
	/**
	 * 查找套餐下面的所以班级的不同老师名字
	 */
	public HashSet<SimpleTeacher> findTchName(int pkgId);

	/**
	 * @Title: findPCbyExamId
	 * @Description: TODO(找到该考试类别下面的一级套餐类别)
	 * @param examId
	 * @return 设定文件
	 */
	public List<PackageCategory> findPCbyExamId(int examId);

	/**
	 * @Title: findClassPackage
	 * @Description: TODO(找到该套餐类别下面的所有套餐)
	 * @param ptypeId
	 * @return 设定文件
	 */
	public List<ClassPackage> findClassPackage(int ptypeId);
	/**
	 * @Title: findClassPackageNoTeacher
	 * @Description: TODO(找到该套餐类别下面的所有套餐(不包含老师))
	 * @param ptypeId
	 * @return 设定文件
	 */
	public List<ClassPackage> findClassPackageNoTeacher(int ptypeId);

	/**
	 * 查找套餐下面的所有班级
	 * 
	 * @param pkgId
	 * @return List<Grade>
	 */
	public List<Grade> findByPkgId(int pkgId);

	/**
	 * s 查找协议by dealId
	 * 
	 * @param dealId
	 * @return
	 */
	public Deal findByDealId(int dealId);

	/**
	 * 保存学生协议
	 * 
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
	 * 
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
	 * 
	 * @param stuId
	 * @return
	 */
	public List<StuDeal> findStuDealByStuId(int stuId, int page, int pagesize);

	/**
	 * 总数量
	 * 
	 * @param stuId
	 * @return
	 */
	public int findStuDealTotal(int stuId);

}
