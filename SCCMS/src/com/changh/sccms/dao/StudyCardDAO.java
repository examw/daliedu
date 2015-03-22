package com.changh.sccms.dao;

import java.util.Date;
import java.util.List;

import com.changh.sccms.entity.StudyCard;

public interface StudyCardDAO {
	//批量插入
	public void createCards(List<StudyCard> list)throws Exception;
	//找出所有的记录
	public List<StudyCard> findAll(String admUsername)throws Exception;
	//找出date之后生成的所有记录
	public List<StudyCard> findAll(Date date,String admUsername)throws Exception;
	//找出最近生成的N个
	public List<StudyCard> findTopN(int num,String admUsername)throws  Exception;
	//找出记录的总个数
	public long findTotal(String admUsername)throws Exception;
	//分页查询
	public List<StudyCard> findPage(int page,int pagesize,String sortName,String sortorder,String admUsername)throws Exception;
	public List<StudyCard> findTopN(int num, int page, int pagesize,
			String sortName, String sortorder,String admUsername);
	//find by id
	public StudyCard findById(int cardId)throws Exception;
	
	public List<StudyCard> findPageByParams(int page,int pagesize,String sortName,String sortorder,String admUsername,String params)throws Exception;
	public long findTotalByParams(String admUsername,String params)throws Exception;
}
