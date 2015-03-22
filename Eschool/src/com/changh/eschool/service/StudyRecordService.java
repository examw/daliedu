package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.StudyRecord;

public interface StudyRecordService {
	/**
	 *	保存播放记录
	 * @param studyRecord
	 */
	public void save(StudyRecord studyRecord);
	/**
	 * 获得主键
	 * @return
	 */
	public int findRecordId(int stuId,int classId);
	/**
	 * 获得当前学生的播放记录
	 * @param stuId
	 * @return
	 */
	public List<StudyRecord> findByStuId(int stuId);
	/**
	 * 删除学生的播放记录
	 * @param stuId
	 */
	public void deleteByStuId(int stuId);
	/**
	 * 找到每个班级的最新学习记录
	 */
	public StudyRecord findByGreadId(int gradeId,int stuId);
	/**
	 * 查找学员的学习该课节记录
	 * @param stuId
	 * @param classId
	 * @return
	 */
	public StudyRecord findSRecord(int stuId, int classId);
}
