package com.changh.sccms.dao;

/*
 * 教师数据接口
 */

import java.util.List;

import com.changh.sccms.entity.Teacher;

public interface TeacherDAO {
	//找出所有的老师
	public List<Teacher> findAll()throws Exception;
	public List<Teacher> findAll(int page,int pagesize,String sortname,String sortorder)throws Exception;
	//找指定id的老师
	public Teacher findById(int id)throws Exception;
	//找指定用户名的老师
	public Teacher findByUsername(String username)throws Exception;
	//找指定姓名的老师
	public List<Teacher> findByName(String name)throws Exception;
	//修改老师信息
	public void update(Teacher teacher)throws Exception;
	//删除
	public void delete(int id)throws Exception;
	//添加
	public void save(Teacher teacher)throws Exception;
	//搜索
	public List<Teacher> search(String str,String searchName)throws Exception;
	public List<Teacher> search(int page,int pagesize,String sortname,String sortorder,String str,String searchName)throws Exception;
	//get total
	public long getTotal(String criteria)throws Exception;
	/**
	 * 按TchId查找老师
	 * @param tchId
	 * @return
	 */
	public Teacher findTeacherByTchId(int tchId);
}
