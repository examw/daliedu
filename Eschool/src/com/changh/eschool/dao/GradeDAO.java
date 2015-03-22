package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.GradeCategory;



public interface GradeDAO {
	public List<Grade> findGradeByExamPidAndGradeCategory(String gtypeName,int examId);
	public List<GradeCategory> findAll();
	public Grade findById(int gradeId);
	//学员所买班级的集合
	public List<Grade> findByStuId(int stuId)throws Exception;
	/**
	* @Title: findGradeList
	* @Description: TODO(下拉框联动查找班级)
	* @param stuId
	* @param examId
	* @return List<Grade>
	* @throws Exception    设定文件
	 */
	public List<Grade> findGradeList(int stuId,int examId)throws Exception;
	public List<Grade> findByCriteria(String criteria)throws Exception;
	public String findExamName(int gradeId)throws Exception;
	/**
	 * 查找当前老师所教的班级
	 * @param tchId
	 * @return
	 */
	public List<Grade> findByTchId(int tchId);
	
	//fw 2013.06.15 add method//
	/**
	 * 查询套餐下班级的集合
	 * @param packageId
	 * @return
	 * @throws Exception
	 */
	public List<Grade> findByIds(String ids)throws Exception;
	//
}
