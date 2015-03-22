package com.changh.eschool.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.changh.eschool.dao.ClassDetailDAO;
import com.changh.eschool.dao.ExamCategoryDAO;
import com.changh.eschool.dao.ExamRecordDAO;
import com.changh.eschool.dao.impl.HibernateExamCategoryDAO;

public class Test1 {
	@Test
	public void TestDao()throws Exception
	{
		String[] configs = {"applicationContext-base.xml"};
		ApplicationContext ac = 
			new ClassPathXmlApplicationContext(configs);
	/*	ExamRecordDAO dao = (ExamRecordDAO)ac.getBean("examRecordDao");*/
//		dao.findPageByCriteria(0, 0, null, null, null);
//		System.out.println(dao.findPageByItemKeywords(2, 10, 127, "一级建造", "order_addTime","desc").size());
		//QuestionDAO dao = (QuestionDAO) ac.getBean("questionDao");
		//dao.findPage(1, 10, " questionAddTime", " desc");
		//dao.findById(1);
		//dao.findByStuId(125);
//		RechargeRecordDAO dao = (RechargeRecordDAO) ac.getBean("RechargeDao");
		//dao.findByStuId(125);
		//GradeDAO dao = (GradeDAO) ac.getBean("gradeDao");
		//System.out.println(dao.findExamName(1001));
//		int total = (int) dao.findTotal(",Items i where (1=1 and i.itemName like '%套餐%') and o.orderId = i.orderId");
//		System.out.println(total);
//		List<Order> list = dao.findPageByCriteria(1, 10, ",Items i where (1=1 and o.student.stuId=127 and i.itemName like '%套餐%') and o.orderId = i.orderId", " o.orderAddTime ", " desc");
//		System.out.println(list);
		/*AskOrComplainDAO dao = (AskOrComplainDAO) ac.getBean("askOrComplainDao");
		System.out.println(dao.findById(1));*/
//		ExamCategoryDAO dao = (ExamCategoryDAO) ac.getBean("examCategoryDao");
//		System.out.println(dao.findByStuId(127));
/*		GradeDAO dao = (GradeDAO) ac.getBean("gradeDao");
		System.out.println(dao.findByStuId(127).get(0).getName());*/
		//dao.searchPage(1, 10, " q.questionAddTime ", " desc ", " ,QuestionCollect qc join fetch Student qcs where qcs.stuId=127 and q.questionId = qc.questionId ");
		//StudentDAO dao = (StudentDAO) ac.getBean("studentDao");
		//dao.isExist("gaga", "45@qq.com");
		
	}
	
}
