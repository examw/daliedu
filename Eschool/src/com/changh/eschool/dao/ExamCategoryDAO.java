package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.entity.ExamCategory1;


public interface ExamCategoryDAO {
		//不用hibernate的级联
		public List<ExamCategory1> findAll1()throws Exception;
		public List<ExamCategory1> findByPid1(int pid)throws Exception;
		//////////////////////////
		//找出所有的考试
		public List<ExamCategory> findAll()throws Exception;
		//找指定id的考试
		public ExamCategory  findById(int id)throws Exception;
		//修改考试信息
		public void update(int id, String examName)throws Exception;
		//删除
		public void delete(int examPid,int id)throws Exception;
		//添加
		public void save(ExamCategory exam)throws Exception;
		//查找当前 为pid的数量
		public int fingByPid(int examPid) throws Exception;
		//按id查找ExamCategory
		public ExamCategory findByIdExamAdd(int id) throws Exception;
		//按pid查找ExamCategory
		public List<ExamCategory> findByExamPid(int examPid);
		//检查是否可以在当前考试下面添加分类
		public boolean checkAdd(int examId);
		//查询某学员已买课程所属的课程小类
		public List<ExamCategory> findByStuId(int stuId) throws Exception;
		
		// 2013.07.18 for mobile
		public List<ExamCategory1> search(String keywords) throws Exception;
		
}
