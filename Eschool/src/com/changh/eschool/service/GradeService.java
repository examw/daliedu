package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.action.mobile.GradeGroup;
import com.changh.eschool.entity.Grade;

public interface GradeService {
	public List<List<Grade>> findByExamId(int examId);
	public Grade findById(int gradeId);
	/**
	* @Title: findByStuId
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @param stuId
	* @return
	* @throws Exception    设定文件
	* @return List<Grade>    返回类型
	* @throws
	 */
	public List<Grade> findByStuId(int stuId)throws Exception;
	
	//fw findByExamId
	public List<Grade> findByExamId2(int examId)throws Exception;
	/**
	 * 按老师查找班级
	 * @param tchId
	 * @return
	 */
	public List<Grade> findByTchId(int tchId);
	/**
	* @Title: findGradeList
	* @Description: TODO(下拉框联动查找班级)
	* @param stuId
	* @param examId
	* @return List<Grade>
	* @throws Exception    设定文件
	 */
	public List<Grade> findGradeList(int stuId,int examId)throws Exception;
	
	public String findExamName(int gradeId)throws Exception;
	
	//fw 2013.06.15 addmethod
	public List<Grade> findByPackageId(int packageId)throws Exception;
	
	public List<GradeGroup> findGroupGradeByExamId(int examId);
	
	
}
