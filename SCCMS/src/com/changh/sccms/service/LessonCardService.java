package com.changh.sccms.service;

import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.LessonCard;

public interface LessonCardService {
	/**
	 * ����ѧϰ����ҵ�񷽷�
	 * @param num			��������
	 * @param date			����ʱ��
	 * @param pwdNum		���볤��
	 * @param includeClassIds		�����Ŀγ�ID
	 * @throws Exception
	 */
	public void createCards(int num,Date month,int pwdNum,String includeClassIds,String className,String prefix)throws Exception;
	/**
	 * �ҳ����м�¼
	 * @return ���м�¼�ļ���
	 * @throws Exception
	 */
	public List<LessonCard> findAll()throws Exception;
	/**
	 * �ҳ�ָ������֮�����ɵ����м�¼
	 * @param date ָ��������
	 * @return ���ϵļ�¼����
	 * @throws Exception
	 */
	public List<LessonCard> findAll(Date date)throws Exception;
	/**
	 * �ҳ�������ɵ�ǰN����¼
	 * @param num ����N
	 * @return ǰN����¼�ļ���
	 * @throws Exception
	 */
	public List<LessonCard> findTopN(int num) throws Exception;
	public List<LessonCard> findTopN(int num,int page,int pagesize,String sortName,String sortorder) throws Exception;
	/**
	 * ��ҳ��ѯ
	 * @param page		�ڼ�ҳ
	 * @param pagesize  ÿҳ������
	 * @param sortName  ��������
	 * @param sortorder ����or����
	 * @return   		����Ҫ��ļ�¼�ļ��ϣ���װ��map��
	 * @throws Exception
	 */
	public Map<String,Object> findPage(int page,int pagesize,String sortName,String sortorder)throws Exception;
	/**
	 * ���Excel������
	 * @param list ��Ҫд��excel�ļ���
	 * @return һ��������
	 * @throws Exception
	 */
	public InputStream getExcelInputStream( List<LessonCard> list) throws Exception;
	
	public LessonCard findById(int cardId)throws Exception;
	
	public Map<String,Object> findPageByParam(int page,int pagesize,String sortName,String sortorder,String params)throws Exception;
}
