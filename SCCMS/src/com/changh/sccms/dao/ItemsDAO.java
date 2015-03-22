package com.changh.sccms.dao;

import java.util.List;

import com.changh.sccms.entity.Items;

public interface ItemsDAO {
	//根据订单号查询订单条目
	public List<Items> findByOrderId(int orderId)throws Exception;
	//增加
	public void save(Items item)throws Exception;
	
}
