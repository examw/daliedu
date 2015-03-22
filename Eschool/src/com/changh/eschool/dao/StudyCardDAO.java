package com.changh.eschool.dao;

import com.changh.eschool.entity.StudyCard;

public interface StudyCardDAO {
	//find by id
	public StudyCard findById(int cardId)throws Exception;
	//update
	public void update(StudyCard studyCard)throws Exception;
	public StudyCard findCard(int cardId,String password)throws Exception;
}
