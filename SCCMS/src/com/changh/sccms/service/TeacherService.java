package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.Teacher;

public interface TeacherService {
	//findAll
	public List<Teacher> teacherList() throws Exception;
	public List<Teacher> teacherList(int page,int pagesize,String sortname,String sortorder) throws Exception;
	//findById
	public Teacher getTeacher(int id)throws Exception;
	//findByUsername
	public Teacher getTeacher(String username) throws Exception;
	//add
	public void addTeacher(Teacher teacher)throws Exception;
	//update
	public boolean updateTeacher(Teacher teacher) throws Exception;
	public boolean updateTeacherImgUrl(Teacher teacher) throws Exception;
	//delete
	public void deleteTeacher(int id)throws Exception;
	//search
	public List<Teacher> searchTeacher(String str,String searchName)throws Exception;
	
	public long getTotal(String criteria) throws Exception;
	/**
	 * findByTchId
	 */
	public Teacher findTeacherByTchId(int tchId);
}
