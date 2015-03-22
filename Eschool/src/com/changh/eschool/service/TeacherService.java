package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.Teacher;

public interface TeacherService {
	//findAll
	public List<Teacher> teacherList() throws Exception;
	//findById
	public Teacher getTeacher(int id)throws Exception;
	//findByUsername
	public Teacher getTeacher(String username) throws Exception;
	//add
	public void addTeacher(Teacher teacher)throws Exception;
	//update
	public boolean updateTeacher(Teacher teacher) throws Exception;
	//delete
	public void deleteTeacher(int id)throws Exception;
	//search
	public List<Teacher> searchTeacher(String str,String searchName)throws Exception;
	//login
	public boolean login(String tchUsername,String password)throws Exception;
	/**
	 * by TchId
	 * @param tchId
	 * @return
	 */
	public Teacher findBytchId(int tchId);
}
