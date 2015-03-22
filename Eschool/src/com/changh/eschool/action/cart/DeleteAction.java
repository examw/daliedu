package com.changh.eschool.action.cart;

import java.util.HashMap;
import java.util.Map;

import com.changh.eschool.service.CartService;

/**
 * 删除购物车中的条目
 * @author Administrator
 *
 */
public class DeleteAction {
	private int productId;
	private int pType;
	private CartService cartService;
	private Map<String,Object> data = new HashMap<String,Object>();
	
	public Map<String, Object> getData() {
		return data;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getpType() {
		return pType;
	}
	public void setPType(int pType) {
		this.pType = pType;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public String execute()throws Exception
	{
		cartService.delete(productId, pType);
		data.put("ok", 1);
		data.put("packageIds", cartService.getProIds(0));
		data.put("gradeIds", cartService.getProIds(1));
		return "success";
	}
}
