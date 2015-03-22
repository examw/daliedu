package com.changh.eschool.dao;

import java.util.List;

import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;

public interface ItemDAO {
	public void save(Items item)throws Exception;
	public void delete(int itemId);
	public List<Items> findByOrderId(int orderId)throws Exception;
	/**
	 * 查找当前考试类别下面销量前10的班级和套餐
	 * @param examId
	 * @return
	 */
	public List findByExamId(int examId,int itemPType);
	/**
	 * 销量前10的所以暴击或者套餐
	 * @return
	 */
	public List findHot();
	/**
	 * 按itemId查找所属订单
	 * @param itemId
	 * @return
	 */
	public Order findByItemId(int itemId);
	//2014.03.17
	public Items findById(int itemId);
	//2014.03.18
	public void update(Items item);
}
