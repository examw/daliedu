package com.changh.eschool.service.impl;

import java.util.List;

import com.changh.eschool.dao.ItemDAO;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Order;
import com.changh.eschool.service.ItemsService;



public class ItemsServiceImpl implements ItemsService{
	private ItemDAO itemDao;
	
	public void setItemDao(ItemDAO itemDao) {
		this.itemDao = itemDao;
	}
	//根据订单号获取条目集合

	public void delete(int itemId) {
	    itemDao.delete(itemId);
	}
	public List<Items> findByOrderId(int orderId) throws Exception {
		// TODO Auto-generated method stub
		return itemDao.findByOrderId(orderId);
	}
	public List findByExamId(int examId,int itemPType) {
		return itemDao.findByExamId(examId, itemPType);
	}

	public List findBest() {
		return itemDao.findHot();
	}

	public Order findByItemId(int itemId) {
		return itemDao.findByItemId(itemId);
	}
}
