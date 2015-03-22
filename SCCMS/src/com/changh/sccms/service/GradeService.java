package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.GradeCategory;

public interface GradeService {
	public List<Grade> gradeList(int id);
	public List<Object[]> TeacherList(int examId,int examPid);
	public List<GradeCategory> classList();
	public List<ExamCategory> examList(int examPid);
	public Grade findById(int gradeId);
	public void delete(int gradeId);
	public GradeCategory findByGtypeId(int gtypeId);
	
	public void update(Grade grade);
	public void save(Grade grade);
	public int getGradeId();
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
	/**
	 * 发布班级
	 * @param examId
	 * @return
	 */
	public List<List<Grade1>> findByExamId(int examId);
	/**
	* @Title: findByTchId
	* @Description: TODO(查找老师所有的班级)
	* @param tchId
	* @return    设定文件
	 */
	public List<Grade1> findByTchId(int tchId);
	
	//2014.03.17
	public List<Grade> findbyExamPid(int pid);
	//2014.06.09
	public void update(Integer gradeId,String dataFileUrl);
	//2014.06.24
	
}
