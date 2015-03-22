package com.changh.eschool.service;

import java.util.List;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import com.changh.eschool.entity.Address;
import com.changh.eschool.entity.Cooperate;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;
import com.changh.eschool.entity.Student;

public interface StudentService {
	public Student studentUpdate(int stuId) throws Exception;
	public void updateStudent(Student stu) throws Exception;
	public List<Student> studentSelect(String date) throws Exception;
	
	//新增
	public void addStudent(Student stu)throws Exception;
	//find by username
	public Student findByUsername(String username)throws Exception;
	//find by email
	public Student findByEmail(String email)throws Exception;
	//登录的业务逻辑
	public Student login(String username,String password)throws Exception;
	public Student login(String username,String password,Integer auto)throws Exception;
	public Student login(String username,String password,String deviceId)throws Exception;
	//找回密码的业务逻辑
	public boolean findPwd(String username,String email,JavaMailSender mailSender,SimpleMailMessage mailMessage)throws Exception;
	//重置密码
	public void resetPwd(String username,String password)throws Exception;
	//从购物车那注册
	public boolean registerFromCart(Student stu)throws Exception;
	//获得地址列表
	public List<Address> findAddrListByStuId(int stuId)throws Exception;
	//新增地址
	public void addAddr(Address addr,int stuId)throws Exception;
	//修改地址
	public void updateAddr(Address addr)throws Exception;
	//修改默认
	public void updateDefaultAddr(int aid,int stuId)throws Exception;
	/**
	 * find by stuId
	 */
	public Student findByStuId(int stuId);
	public Address findAddr(int addrId)throws Exception;
	public Student findByNameAndPwd(String username,String password)throws Exception;
	
	/**合作机构**/
	public Cooperate findCooperate(String url);

	/**
	 * 按手机号查找学员
	 * 2014.04.11
	 */
	public Student findByMobilePhone(String phone);
	/**
	 * 按Token查找学员
	 * 2014.06.13
	 */
	public Student findByToken(String token);
}
