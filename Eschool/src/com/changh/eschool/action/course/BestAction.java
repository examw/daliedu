package com.changh.eschool.action.course;

import java.util.List;

import com.changh.eschool.service.ItemsService;

public class BestAction {
	private List list;
	private ItemsService itemsService;
 
	public String execute(){
		list =itemsService.findBest();
		return "success";
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	
	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}
 
 
}
