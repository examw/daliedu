package com.changh.eschool.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.changh.eschool.dao.TeacherDAO;
import com.changh.eschool.entity.Teacher;
import com.changh.eschool.service.TeacherService;
import com.changh.eschool.until.Constant;


public class TeacherServiceImpl implements TeacherService {
	//injection
	private TeacherDAO teacherDao;
	
	//查找所有教师
	public List<Teacher>  teacherList() throws Exception{
		List<Teacher> list=null;
	    list = teacherDao.findAll();
		return list;
	}
	
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
		if(teacher.getTchValuation()==null)
		{
			Teacher tch = teacherDao.findById(teacher.getTchId());
			if(tch==null)
			{
				return false;
			}
			teacher.setTchAddTime(tch.getTchAddTime());
			teacher.setTchValuation(tch.getTchValuation());
			teacher.setTchScore(tch.getTchScore());
			teacher.setTchImgUrl(tch.getTchImgUrl());
		}
		teacherDao.update(teacher);
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
	public boolean login(String tchUsername, String password) throws Exception {
		// TODO Auto-generated method stub
		Teacher tch = teacherDao.findByUsername(tchUsername);
		if(tch!=null&&tch.getTchPassword().equals(password)&&tch.getTchStatus()==Constant.ALLOWED)
		{
			//绑session
			ServletActionContext.getRequest().getSession().setAttribute("teacher", tch);
			return true;
		}
		return false;
	}

	public Teacher findBytchId(int tchId) {
		return teacherDao.findBytchId(tchId);
	}
}
