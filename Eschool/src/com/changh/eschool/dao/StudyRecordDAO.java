package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.StudyRecord;

/**
 * 播放记录DAO
 * @author Administrator
 *
 */
public interface StudyRecordDAO {
	/**
	 * 保存学习记录
	 * @param studyRecord
	 */
	public void save(StudyRecord studyRecord);
	/**
	 * 获得主键
	 * @return
	 */
	public int findSRecordId( int stuId,int classId);
	/**
	 * 查找
	 * @param stuId
	 * @param classId
	 * @return
	 */
	public StudyRecord findSRecord( int stuId,int classId);
	/**
	 * 查找当前登录的学生的学习记录
	 * @param stuId
	 * @return
	 */
	public List<StudyRecord> findByStuId(int stuId);
	/**
	 * 清除播放记录
	 * @param stuId
	 */
	public void deleteByStuId(int stuId);
	/**
	 * 找到每个班级的最新记录
	 * @param gradeId
	 * @return
	 */
	public StudyRecord findByGradeId(int gradeId,int stuId);
}
