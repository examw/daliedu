package com.changh.sccms.service;

import java.util.Date;
import java.util.List;

import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.entity.Grade;

public interface ClassDetailService {
	public List<ClassDetail> listClassDetail(int gid);
	public Grade findById(int gradeId);
	public void save(ClassDetail classDetail);
	public void delete(String classId);
	public ClassDetail findByClassId(int classId);
	public void update(ClassDetail classDetail);
	/**
	 * 查找 获取主键
	 * @return
	 */
	public int getClassId();
	public int findNumByGid(int gradeId)throws Exception; //2014.04.20 fw 添加方法用于查找某班级的章节数
	/**
	* @Title: findGradeByClassId
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @param classId
	* @return  Grade
	 */
	public Grade findGradeByClassId(int classId);
	/**
	* @Title: findClassDetailByGid
	* @Description: TODO(查找班级下面的课程)
	* @param gid
	* @param status(免费，收费，全部)
	* @return    设定文件
	 */
	public List<ClassDetail> findClassDetailByGid(int gid,int status);
	//批量改开放时间
	public boolean updateOpenTime(String ids,Date time);
}
