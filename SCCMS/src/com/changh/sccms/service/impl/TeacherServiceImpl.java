package com.changh.sccms.service.impl;

import java.util.Date;
import java.util.List;

import com.changh.sccms.dao.TeacherDAO;
import com.changh.sccms.entity.Teacher;
import com.changh.sccms.service.TeacherService;
import com.changh.sccms.until.Escape;


public class TeacherServiceImpl implements TeacherService {
	//injection
	private TeacherDAO teacherDao;
	
	//查找所有教师
	public List<Teacher>  teacherList() throws Exception{
		List<Teacher> list=null;
	    list = teacherDao.findAll();
		return list;
	}
	/**
	 * 
	 * @param teacherDao
	 */
	
	public void setTeacherDao(TeacherDAO teacherDao) {
		this.teacherDao = teacherDao;
	}
	//find by id
	public Teacher getTeacher(int id) throws Exception {

		return teacherDao.findById(id);
	}
	//增加教师
	public void addTeacher(Teacher teacher) throws Exception {
		//设置添加时间
		teacher.setTchAddTime(new Date());
		//评分默认5分
		teacher.setTchScore(5);
		teacherDao.save(teacher);
	}
	//修改教师信息
	public boolean updateTeacher(Teacher teacher) throws Exception {
		//只更新部分信息
		Teacher tch = teacherDao.findById(teacher.getTchId());
		if(tch==null)
		{
			return false;
		}
		//用户名，密码，状态，电话，姓名，性别，所叫课程，简介
		tch.setTchUsername(teacher.getTchUsername());
		tch.setTchPassword(teacher.getTchPassword());
		tch.setTchStatus(teacher.getTchStatus());
		tch.setTchDescription(teacher.getTchDescription());
		tch.setTchLessons(teacher.getTchLessons());
		tch.setTchPhone(teacher.getTchPhone());
		tch.setTchSex(teacher.getTchSex());
		tch.setTchName(teacher.getTchName());
		//teacherDao.update(tch);	//加事务后不写
		return true;
	}
	public boolean updateTeacherImgUrl(Teacher teacher) throws Exception {
		// TODO Auto-generated method stub
		Teacher tch = teacherDao.findById(teacher.getTchId());
		if(tch==null)
		{
			return false;
		}
		//用户名，密码，状态，电话，姓名，性别，所叫课程，简介
		tch.setTchImgUrl(teacher.getTchImgUrl());
		//teacherDao.update(tch);	//加事务后不写
		return true;
	}
	//删除教师
	public void deleteTeacher(int id)throws Exception{
		teacherDao.delete(id);
	}
	//按指定条件搜索教师
	public List<Teacher> searchTeacher(String str, String searchName) throws Exception {
		return teacherDao.search(str, searchName);
	}
	//find by username (更改教师信息时，要checkusername唯一性)
	public Teacher getTeacher(String username) throws Exception {
		return teacherDao.findByUsername(username);
	}
	public List<Teacher> teacherList(int page, int pagesize, String sortname,
			String sortorder) throws Exception {
		// TODO Auto-generated method stub
		return teacherDao.findAll(page, pagesize, sortname, sortorder);
	}
	public long getTotal(String criteria) throws Exception
	{
		return teacherDao.getTotal(criteria);
	}
	public Teacher findTeacherByTchId(int tchId) {
		return teacherDao.findTeacherByTchId(tchId);
	}
}
