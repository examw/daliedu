package com.changh.sccms.service;

import java.io.InputStream;
import java.util.List;

import com.changh.sccms.entity.ExamRecord;
import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.StudyRecord;

public interface StudentService {
	//findAll
	public List<Student> studentList(int page,int pagesize,String sortName,String sortOrder) throws Exception;
	public void deleteStudent(int stuId) throws Exception;
	public Student updateStudent(int stuId) throws Exception;
	public void modifyStudent(Student stu) throws Exception;
	public List<Student> studentSelect(String date,int page,int pagesize,String sortname,String sortorder) throws Exception;
	
	//新增
	public void addStudent(Student stu)throws Exception;
	//find by username
	public Student findByUsername(String username)throws Exception;
	//find by email
	public Student findByEmail(String email)throws Exception;
	//find by id
	public Student findById(int id)throws Exception;
	//总数
	public int getTotal(String date);
	/**
	 * 查询
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
	
	//手动充现金值
	public boolean updateAccount(int stuId,double money,String tradePattern,String content)throws Exception;
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
	 * 查找学员的考试记录
	 * @param stuId
	 * @return
	 */
	public List<ExamRecord> findExamRecord(int stuId,int page,int pagesize,String sortname,String sortorder);
	/**
	 * 学习记录总条数
	 * @param stuId
	 * @return
	 */
	public Integer getStudyRecordTotal(int stuId);
	/**
	 * 考试记录总条数
	 * @param stuId
	 * @return
	 */
	public Integer getExamRecordTotal(int stuId);
	
	//2014.03.21
	public InputStream getExcelInputStream(List<Student> list) throws Exception;
	
	public List<Student> exportList(String area,String date) throws Exception;
	
	//2014.06.12
	public void updatePwdReset(int stuId)throws Exception;
	//2014.06.14
	//手动扣除学习卡
	public boolean updateAccount(int stuId,double money,String content)throws Exception;
	//2014.06.12
	public void updateDeviceIdReset(int stuId)throws Exception;
	//2014.08.01
	//查找已经不能再听课的学习记录
	public List<StudyRecord> findLimitStudyRecord(int stuId)throws Exception;
	//更新听课数量
	public boolean updateListenNum(int recordId,int num)throws Exception;
	
	
}
