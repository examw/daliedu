package com.changh.sccms.dao;

import java.util.Date;
import java.util.List;

import com.changh.sccms.entity.LessonCard;
import com.changh.sccms.entity.StudyCard;

public interface LessonCardDAO {
	//��������
	public void createCards(List<LessonCard> list)throws Exception;
	//�ҳ����еļ�¼
	public List<LessonCard> findAll(String admUsername)throws Exception;
	//�ҳ�date֮�����ɵ����м�¼
	public List<LessonCard> findAll(Date date,String admUsername)throws Exception;
	//�ҳ�������ɵ�N��
	public List<LessonCard> findTopN(int num,String admUsername)throws  Exception;
	//�ҳ���¼���ܸ���
	public long findTotal(String admUsername)throws Exception;
	//��ҳ��ѯ
	public List<LessonCard> findPage(int page,int pagesize,String sortName,String sortorder,String admUsername)throws Exception;
	public List<LessonCard> findTopN(int num, int page, int pagesize,
			String sortName, String sortorder,String admUsername);
	//find by id
	public LessonCard findById(int cardId)throws Exception;
	
	public List<LessonCard> findPageByParams(int page,int pagesize,String sortName,String sortorder,String admUsername,String params)throws Exception;
	public long findTotalByParams(String admUsername,String params)throws Exception;
}
