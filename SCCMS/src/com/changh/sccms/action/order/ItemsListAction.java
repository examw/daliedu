package com.changh.sccms.action.order;

import java.util.List;
import java.util.Map;

import com.changh.sccms.entity.Items;
import com.changh.sccms.service.ItemsService;
import com.changh.sccms.until.GridDataUtil;

public class ItemsListAction {
	private int orderId;
	
	private Map<String,Object> itemList;
	
	public Map<String, Object> getItemList() {
		return itemList;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	private ItemsService itemsService;

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}
	public String execute() throws Exception
	{
		List<Items> list = itemsService.getItemsByOrderId(orderId);
		itemList = GridDataUtil.gridMap(list, list.size());
		return "success";
	}
}
