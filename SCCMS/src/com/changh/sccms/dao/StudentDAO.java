package com.changh.sccms.dao;
import java.util.List;

import com.changh.sccms.entity.ExamRecord;
import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.StudyRecord;
import com.changh.sccms.entity.Teacher;

//学员管理
public interface StudentDAO {
	//找到所有学员
	public List<Student> findAll(int page,int pagesize,String sortName,String sortOrder) throws Exception;
	//找出一个时间段内的所有学员
	public List<Student> studentSelect(String date,int page,int pagesize,String sortname,String sortorder) throws Exception;
	//删出学员
	public void  delete(int id) throws Exception;
	//添加学员
	public void insert(Student stu) throws Exception;
	//按id查找学员
	public Student findById(int id) throws Exception;
	//修改学员信息
	public void modify(Student stu) throws Exception;
	//按用户名查找学员
	public Student findByUsername(String username) throws Exception;
	//按email查找学员
	public Student findByEmail(String email) throws Exception;
	//按时间查询学员
	public int getTotal(String date);
	//修改学员信息，不带逻辑 fw2013.03.19
	public void update(Student stu)throws Exception;
	/**
	 * 查询学生
	 * @param page
	 * @param pagesize
	 * @param sortname
	 * @param sortorder
	 * @param str
	 * @param searchName
	 * @return
	 * @throws Exception
	 */
	public List<Student> search(int page,int pagesize,String sortname,String sortorder,String str,String searchName)throws Exception;
	/**
	 * total
	 * @param searchName
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public int getSearchTotal(String searchName,String str) throws Exception;
	/**
	 * 查找学选的学习记录
	 * @param stuId
	 * @return
	 */
	public List<StudyRecord>  findStudyRecord(int stuId,int page,int pagesize,String sortname,String sortorder);
	/**
	 * 学习记录总条数
	 * @param stuId
	 * @return
	 */
	public Integer getStudyRecordTotal(int stuId);
	/**
	 * 查找学员的考试记录
	 * @param stuId
	 * @return
	 */
	public List<ExamRecord> findExamRecord(int stuId,int page,int pagesize,String sortname,String sortorder);
	/**
	 * 考试记录总条数
	 * @param stuId
	 * @return
	 */
	public Integer getExamRecordTotal(int stuId);
	
	public List<Student> exportList(String area,String date);
	
	public List<StudyRecord> findLimitRecord(int stuId);
	
	public StudyRecord findStudyRecord(int recordId);
	public void updateRecord(StudyRecord record);
}
