package com.changh.eschool.action.cart;

import com.changh.eschool.service.CartService;

public class RemoveAllAction {
	private CartService cartService;
	private boolean ok=true;
	
	public boolean isOk() {
		return ok;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public String execute() throws Exception
	{
		if(cartService.getBuyPros()==null)
		{
			ok=false;
		}
		cartService.remove();
		return "success";
	}
}
