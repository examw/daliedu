package com.changh.eschool.action.member;

import com.changh.eschool.entity.Order;
import com.changh.eschool.service.ItemsService;

public class DeleteItemAction {
	private Integer itemId;
	
	private boolean ok=false;
	private ItemsService itemsService;
	
	public String execute(){
		Order order = itemsService.findByItemId(itemId);
		if(order.getOrderMoney()!=order.getOrderPrice()){
			ok= false;
			return "success";
		}
		itemsService.delete(itemId);
		setOk(true);
		return "success";
	}
	
	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public ItemsService getItemsService() {
		return itemsService;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
