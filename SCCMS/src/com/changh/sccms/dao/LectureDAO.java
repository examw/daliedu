package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.Lecture;

public interface LectureDAO {
	//添加讲义
	public void save(Lecture lecture);
	//查找当期课节下的所以讲义
	public List<Lecture> findByClassId(int classId);
	//查找讲义id
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
