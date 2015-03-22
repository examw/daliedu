package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.ExamCategory1;

public interface ExamCategoryService {
	public List<ExamCategory1> findAll() throws Exception;

	public List<ExamCategory1> findByPid(int id) throws Exception;

	// /////////////////////////
	public List<ExamCategory> examList() throws Exception;

	public void deleteExam(int id, int examPid) throws Exception;

	public ExamCategory examLoad(int examId) throws Exception;

	public void modifyStudent(ExamCategory exam) throws Exception;

	/**
	 * @Title: saveExam
	 * @Description: TODO(添加考试类别)
	 * @param id
	 * @param examName
	 * @param examUrl
	 * @param examDescription
	 * @throws Exception
	 *             设定文件
	 */
	public void saveExam(int id, String examName, String examUrl,
			String examDescription) throws Exception;

	/**
	 * @Title: updateExam
	 * @Description: TODO(修改考试类别)
	 * @param id
	 * @param examName
	 * @throws Exception
	 *             设定文件
	 */
	public void updateExam(int id, String examName,String examUrl,String examDescription) throws Exception;

	public List<ExamCategory> findByExamPid(int examPid);

	// 检查考试是否能够继续分类
	public boolean checkExamAdd(int examId);

	/**
	 * 获得考试类别id
	 * 
	 * @return
	 */
	public int getExamId();
	
	public List<ExamCategory> findByPro(String pro,Object value);

}