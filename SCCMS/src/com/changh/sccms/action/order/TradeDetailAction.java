package com.changh.sccms.action.order;

import java.util.List;

import com.changh.sccms.entity.Trade;
import com.changh.sccms.service.TradeService;

public class TradeDetailAction {
	private int orderId;
	private String orderNo;
	private List<Trade> tradeList;
	private TradeService tradeService;
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public List<Trade> getTradeList() {
		return tradeList;
	}

	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}

	public String execute()throws Exception
	{
		tradeList = tradeService.findByOrderId(orderId);
		return "success";
	}
}
