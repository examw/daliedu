package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.ClassDetail;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Lecture;
import com.changh.eschool.entity.Note;



public interface ClassDetailDAO {
	/**
	 * 分页
	 * @param gid
	 * @param page
	 * @param pagesize
	 * @return
	 */
	public List<ClassDetail> findByGid(int gid,int page,int pagesize);
	/**
	* @Title: findClassDetailByGid
	* @Description: TODO(查找班级下面的课程)
	* @param gid
	* @param status(免费，收费，全部)
	* @return    设定文件
	 */
	public List<ClassDetail> findClassDetailByGid(int gid,int status);
	/**
	 * 查找当前班级课节的总数
	 * @param gid
	 * @return
	 */
	public int findTotal(int gid);
	/**
	 * 查找班级
	 * @param gradeId
	 * @return grade
	 */
	public Grade findById(int gradeId);
	/**
	 * 保存讲义
	 * @param classDetail
	 */
	public void save(ClassDetail classDetail);
	/**
	 * 删除讲义
	 * @param classId
	 */
	public void delete(int classId);
	/**
	 * 查找讲义
	 * @param classId
	 * @return classDetail
	 */
	public ClassDetail findByClassId(int classId);
	/**
	 * 修改讲义
	 * @param classDetail
	 */
	public void update(ClassDetail classDetail);
	/**
	 * 查找课节下面的所以讲义
	 * @param classId
	 * @return
	 */
	public List<Lecture> findLectureByClassId(int classId);
	/**
	 * 查找当前课节的班级
	 * @param classId
	 * @return
	 */
	public Grade findGradeByClassId(int classId);
	/**
	 * 查找自己当课程下面的前十笔记
	 * @param classId
	 * @param stuId
	 * @param type
	 * @return
	 */
	public List<Note> findMyNote(int classId,int stuId,int type);
	/**
	 * 添加或者修改笔记
	 * @param note
	 */
	public void addOrUpdateNote(Note note);
	/**
	 * 设置note表主键
	 * @return
	 */
	public int getNotePK();
	/**
	 * 删除笔记
	 * @param noteId
	 */
	public void deleteNode(int noteId);
	/**
	* @Title: findGbyclassId
	* @Description: TODO(按课节查找班级)
	* @param classId
	* @return    设定文件
	 */
	public Grade findGbyclassId(int classId);
	
	/////fw 2013.06.15 add method/////
	/**
	 * 查询所有可以免费试听的课程
	 * @param gid
	 * @return
	 * @throws Exception
	 */
	public List<ClassDetail> findFreeClassByGid(int gid) throws Exception;
}
