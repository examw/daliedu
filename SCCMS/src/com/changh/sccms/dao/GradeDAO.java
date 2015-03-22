package com.changh.sccms.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.GradeCategory;
import com.changh.sccms.entity.Teacher;

public interface GradeDAO {
	//查找当前考试的所以班级
	public List<Grade> findbyExamId(int id);
	//查找当前考试的所有老师
	public List<Object[]> findByExamPid(int examId,int examPid);
	//查找当前班级的类别
	public List<GradeCategory> findAll();
	/**
	 * 添加考试类别
	 * @param gc
	 * @return
	 */
	public boolean saveGradeCategory(GradeCategory gc);
	/**
	 * 获取gtypeId
	 * @return
	 */
	public int getGCId();
	//查找上级考试类别下所有考试
	public List<ExamCategory> findByPid(int examPid);
	//按Id查找Grade
	public Grade findById(int gradeId);
	//删除班级
	public void delete(int gradeId);
	//按gtypeId查找班级类型
	public GradeCategory findByGtypeId(int gtypeId);
	//修改班级
	public void update(Grade grade);
	//添加班级
	public void save(Grade grade);
	public int getGradeId();
	/**
	 * 按考试 和班级类型查找班级
	 * @param gtypeName
	 * @param examId
	 * @return
	 */
	public List<Grade1> findGradeByExamPidAndGradeCategory(String gtypeName,int examId);
	/**
	 * 查找当前老师所教的班级
	 * @param tchId
	 * @return
	 */
	public List<Grade1> findByTchId(int tchId);
	
	//2014.03.15
	public String findExamName(final int gradeId) throws Exception ;
	//2014.03.17
	public List<Grade> findbyExamPid(int pid);
	//2014.06.09
	public void update(Integer gradeId,String dataFileUrl);
}
