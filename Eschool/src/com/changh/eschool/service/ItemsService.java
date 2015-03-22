package com.changh.eschool.service;

import java.util.List;

import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;


public interface ItemsService {
	//delete
	public void delete(int itemId);
	public List<Items> findByOrderId(int orderId)throws Exception;
	/**
	 * 查找前前5的套餐
	 * @param examId
	 * @return classPckage
	 */
	public List findByExamId(int examId,int itemPType);
	/**
	 * 查找卖的最好的产品
	 */
	public List findBest();
	/**
	 * 按itemId查找所属订单
	 * @param itemId
	 * @return
	 */
	public Order findByItemId(int itemId);
}

