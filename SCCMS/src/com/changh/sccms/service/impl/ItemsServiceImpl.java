package com.changh.sccms.service.impl;

import java.util.List;

import com.changh.sccms.dao.ItemsDAO;
import com.changh.sccms.entity.Items;
import com.changh.sccms.service.ItemsService;

public class ItemsServiceImpl implements ItemsService{
	private ItemsDAO itemsDao;
	
	public void setItemsDao(ItemsDAO itemsDao) {
		this.itemsDao = itemsDao;
	}
	//根据订单号获取条目集合
	public List<Items> getItemsByOrderId(int orderId) throws Exception {
		return itemsDao.findByOrderId(orderId);
	}
}
