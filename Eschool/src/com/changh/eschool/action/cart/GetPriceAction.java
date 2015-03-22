package com.changh.eschool.action.cart;

import java.util.HashMap;
import java.util.Map;

import com.changh.eschool.service.CartService;

public class GetPriceAction {
	private Map<String,Object> data = new HashMap<String,Object>();
	
	public Map<String, Object> getData() {
		return data;
	}

	private CartService cartService;
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	
	public String execute()
	{
		data.put("totalOMoney",cartService.getTotalOMoney());
		data.put("totalRMoney",cartService.getTotalRMoney());
		return "success";
	}
}
