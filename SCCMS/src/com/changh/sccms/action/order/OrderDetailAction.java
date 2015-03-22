package com.changh.sccms.action.order;

import java.util.List;

import com.changh.sccms.entity.Items;
import com.changh.sccms.entity.Order;
import com.changh.sccms.entity.Send;
import com.changh.sccms.service.ItemsService;
import com.changh.sccms.service.OrderService;
import com.changh.sccms.service.SendService;
import com.changh.sccms.until.Constant;

public class OrderDetailAction {
	private int orderId;
	private Order order;
	private List<Items> itemList;
	private List<Send> sendList;
	private ItemsService itemsService;
	private OrderService orderService;
	private SendService sendService;
	private int isAllowReturn;
	public String execute() throws Exception
	{
		itemList = itemsService.getItemsByOrderId(orderId);
		order = orderService.findById(orderId);
		sendList = sendService.findByOrderId(orderId);
		isAllowReturn = isAllow(sendList);
		return "success";
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Order getOrder() {
		return order;
	}
	public List<Items> getItemList() {
		return itemList;
	}
	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public List<Send> getSendList() {
		return sendList;
	}
	public void setSendService(SendService sendService) {
		this.sendService = sendService;
	}
	public int getIsAllowReturn() {
		return isAllowReturn;
	}
	public void setIsAllowReturn(int isAllowReturn) {
		this.isAllowReturn = isAllowReturn;
	}
	private int isAllow(List<Send> sendList)
	{
		if(sendList!=null&&sendList.size()!=0)
		{
			for(Send s :sendList)
			{
				if((s.getSendStatus()==Constant.SENDING||s.getSendStatus()==Constant.SENT))
				{
					return 1;
				}
			}
		}
		return 0;
	}
}
