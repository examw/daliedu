package com.changh.sccms.service;

import java.util.List;

import com.changh.sccms.entity.Items;

public interface ItemsService {
	//findByOrderId
	public List<Items> getItemsByOrderId(int orderId)throws Exception;
}
