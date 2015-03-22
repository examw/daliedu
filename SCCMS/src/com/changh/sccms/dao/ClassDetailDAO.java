package com.changh.sccms.dao;

import java.util.Date;
import java.util.List;

import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.entity.Grade;
/**
 * @Title: ClassDetailDAO.java
 * @Package com.changh.sccms.dao
 * @Description: TODO(用一句话描述该文件做什么)
 * @author Failymiss jiangwei3457@163.com
 * @date 2013-6-3 下午4:57:45
 * @version V1.0
 */
public interface ClassDetailDAO {
	public List<ClassDetail> findByGid(int gid);

	public Grade findById(int gradeId);

	public void save(ClassDetail classDetail);

	public void delete(String classId);

	public ClassDetail findByClassId(int classId);

	public void update(ClassDetail classDetail);

	/**
	 * 查找 获取主键
	 * 
	 * @return
	 */
	public int getClassId();
	/**
	* @Title: findClassDetailByGid
	* @Description: TODO(查找班级下面的课程)
	* @param gid
	* @param status(免费，收费，全部)
	* @return    设定文件
	 */
	public List<ClassDetail> findClassDetailByGid(int gid,int status);

	public long findNumByGid(int gradeId) throws Exception; // 2014.04.20 fw
															// 添加方法用于查找某班级的章节数

	/**
	 * @Title: findGradeByClassId
	 * @Description: TODO(按课节找出班级)
	 * @param classId
	 * @return Grade
	 */
	public Grade findGradeByClassId(int classId);
	
	
	public void updateOpenTime(String ids,Date time);
}
