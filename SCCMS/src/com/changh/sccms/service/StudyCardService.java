package com.changh.sccms.service;

import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.StudyCard;

public interface StudyCardService {
	/**
	 * 生成学习卡的业务方法
	 * @param num			生成数量
	 * @param value			面值
	 * @param date			过期时间
	 * @param pwdNum		密码长度
	 * @param isPresent		是否赠送
	 * @throws Exception
	 */
	public void createCards(int num,int value,Date month,int pwdNum,int isPresent,String prefix)throws Exception;
	/**
	 * 找出所有记录
	 * @return 所有记录的集合
	 * @throws Exception
	 */
	public List<StudyCard> findAll()throws Exception;
	/**
	 * 找出指定日期之后生成的所有记录
	 * @param date 指定的日期
	 * @return 符合的记录集合
	 * @throws Exception
	 */
	public List<StudyCard> findAll(Date date)throws Exception;
	/**
	 * 找出最近生成的前N个记录
	 * @param num 数量N
	 * @return 前N个记录的集合
	 * @throws Exception
	 */
	public List<StudyCard> findTopN(int num) throws Exception;
	public List<StudyCard> findTopN(int num,int page,int pagesize,String sortName,String sortorder) throws Exception;
	/**
	 * 分页查询
	 * @param page		第几页
	 * @param pagesize  每页的数量
	 * @param sortName  排序名字
	 * @param sortorder 正序or逆序
	 * @return   		符合要求的记录的集合（封装成map）
	 * @throws Exception
	 */
	public Map<String,Object> findPage(int page,int pagesize,String sortName,String sortorder)throws Exception;
	/**
	 * 获得Excel输入流
	 * @param list 需要写入excel的集合
	 * @return 一个输入流
	 * @throws Exception
	 */
	public InputStream getExcelInputStream( List<StudyCard> list) throws Exception;
	
	public StudyCard findById(int cardId)throws Exception;
	
	public Map<String,Object> findPageByParam(int page,int pagesize,String sortName,String sortorder,String params)throws Exception;
	
	public Map<String,Object> findRecord(int cardId)throws Exception;
}
