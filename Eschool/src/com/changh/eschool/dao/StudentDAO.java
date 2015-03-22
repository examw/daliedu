package com.changh.eschool.dao;
import java.util.List;

import com.changh.eschool.entity.Cooperate;
import com.changh.eschool.entity.Student;
import com.changh.eschool.entity.Teacher;

//学员管理
public interface StudentDAO {
	//找到所有学员
	public List<Student> findAll() throws Exception;
	//找出一个时间段内的所有学员
	public List<Student> select(String date) throws Exception;
	//删出学员
	public void  delete(int id) throws Exception;
	//添加学员
	public void insert(Student stu) throws Exception;
	//按id查找学员
	public Student findById(int id) throws Exception;
	//修改学员信息
	public void update(Student stu) throws Exception;
	//按用户名查找学员
	public Student findByUsername(String username) throws Exception;
	//按email查找学员
	public Student findByEmail(String email) throws Exception;
	//根据username或者email看是否存在
	public boolean isExist(String username,String email)throws Exception;
	/**
	 * 按主键查找学生
	 * @param stuId
	 * @return
	 */
	public Student findByStuId(int stuId);
	
	/**合作机构**/
	public Cooperate findCooperate(String url);
	
	/**
	 * 按手机号查找学员
	 * 2014.04.11
	 */
	public Student findByMobilePhone(String phone);
	/**
	 * 按token查找
	 * @param token
	 * @return
	 */
	public Student findByToken(String token);
}
