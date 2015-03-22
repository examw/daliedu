package com.changh.eschool.action.member;

import java.util.List;

import com.changh.eschool.entity.Items;
import com.changh.eschool.service.ItemsService;

public class ItemListAction {
	private int orderId;
	private List<Items> itemList;
	private ItemsService itemsService;
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public List<Items> getItemList() {
		return itemList;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	public String execute()throws Exception
	{
		itemList = itemsService.findByOrderId(orderId);
		return "success";
	}
}
