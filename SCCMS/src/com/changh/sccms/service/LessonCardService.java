package com.changh.sccms.service;

import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.LessonCard;

public interface LessonCardService {
	/**
	 * 生成学习卡的业务方法
	 * @param num			生成数量
	 * @param date			过期时间
	 * @param pwdNum		密码长度
	 * @param includeClassIds		包含的课程ID
	 * @throws Exception
	 */
	public void createCards(int num,Date month,int pwdNum,String includeClassIds,String className,String prefix)throws Exception;
	/**
	 * 找出所有记录
	 * @return 所有记录的集合
	 * @throws Exception
	 */
	public List<LessonCard> findAll()throws Exception;
	/**
	 * 找出指定日期之后生成的所有记录
	 * @param date 指定的日期
	 * @return 符合的记录集合
	 * @throws Exception
	 */
	public List<LessonCard> findAll(Date date)throws Exception;
	/**
	 * 找出最近生成的前N个记录
	 * @param num 数量N
	 * @return 前N个记录的集合
	 * @throws Exception
	 */
	public List<LessonCard> findTopN(int num) throws Exception;
	public List<LessonCard> findTopN(int num,int page,int pagesize,String sortName,String sortorder) throws Exception;
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
	public InputStream getExcelInputStream( List<LessonCard> list) throws Exception;
	
	public LessonCard findById(int cardId)throws Exception;
	
	public Map<String,Object> findPageByParam(int page,int pagesize,String sortName,String sortorder,String params)throws Exception;
}
