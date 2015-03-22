package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.Lecture;

public interface LectureService {
	public void save(Lecture lecture);
	//查找当期课节的所有讲义
	public List<Lecture> findByClassId(int classId);
	//按lectId查找讲义
	public Lecture findByLectId(int lectId);
	//修改
	public void update(Lecture lecture);
	//删除
	public void delete(int lectId);
	/**
	 * 查找讲义lectId
	 */
	public int getLectId();
}
