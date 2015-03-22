package com.changh.eschool.dao;

import com.changh.eschool.entity.LessonCard;

public interface LessonCardDAO {
	//find by id
	public LessonCard findById(int cardId)throws Exception;
	//update
	public void update(LessonCard lessonCard)throws Exception;
	public LessonCard findCard(int cardId,String password)throws Exception;
}
