package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Lecture;
import com.changh.eschool.entity.Note;


public interface ClassDetailService {
	/**
	 * 查找当前班级（gid）所有课节
	 * @param gid
	 * @return list<ClassDetail>
	 */
	public List<ClassDetail> listClassDetail(int gid,int page,int pagesize);
	/**
	* @Title: findClassDetailByGid
	* @Description: TODO(查找班级下面的课程)
	* @param gid
	* @param status(免费，收费，全部)
	* @return    设定文件
	 */
	public List<ClassDetail> findClassDetailByGid(int gid,int status);
	/**
	* @Title: findGbyclassId
	* @Description: TODO(查找班级)
	* @param classId
	* @return    设定文件
	 */
	public Grade findGbyclassId(int classId);
	/**
	 * total
	 * @param gradeId
	 * @return
	 */
	public int findTotal(int gradeId);
	/**
	 * findbyId(gradeId)
	 * @param gradeId
	 * @return grade
	 */
	public Grade findById(int gradeId);
	/**
	 * 保存课节
	 * @param classDetail
	 */
	public void save(ClassDetail classDetail);
	/**
	 * 删除课节
	 * @param classId
	 */
	public void delete(int classId);
	/**
	 * findByClassId(classId)
	 * @param classId
	 * @return classDetail
	 */
	public ClassDetail findByClassId(int classId);
	/**
	 * 修改课节
	 * @param classDetail
	 */
	public void update(ClassDetail classDetail);
	/**
	 * 查找当前课节下面的所以讲义
	 * @param classId
	 * @return list<Lecture>
	 */
	public List<Lecture> findLectureByClassId(int classId);
	/**
	 * 按课节Id查找班级
	 * @param classId
	 * @return grade
	 */
	public Grade findGradeByClassId(int classId);
	/**
	 * 添加或者修改笔记
	 * @param note
	 */
	public void addOrUpdateNote(Note note);
	/**
	 * 获得笔记主键
	 * @return
	 */
	public int getNotePK();
	/**
	 * 获取最新的前10条记录
	 */
	public List<Note> findMyNote(int classId, int stuId, int type);
	/**
	 * 删除笔记
	 */
	public void deleteNode(int noteId);
	
	////fw 2013.06.15 add method ///
	public List<ClassDetail> findFreeClassByGid(int gid) throws Exception;
	
}
