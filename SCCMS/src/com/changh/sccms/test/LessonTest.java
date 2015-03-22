package com.changh.sccms.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.changh.sccms.dao.TeacherDAO;

public class LessonTest {
	public void testAdd() throws Exception{
		String[] configs = {"applicationContext-base.xml"};
		ApplicationContext ac = 
			new ClassPathXmlApplicationContext(configs);
		TeacherDAO TeacherDao = (TeacherDAO)ac.getBean("teacherDao");
		
		System.out.println(TeacherDao.search("1011", "tchId").size());
	}
}
