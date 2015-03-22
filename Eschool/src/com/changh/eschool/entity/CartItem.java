package com.changh.eschool.entity;

import java.io.Serializable;

public class CartItem implements Serializable{
	//购买的商品
	private Items item;
	//是否删除的标识
	private boolean buy=true;
	public Items getItem() {
		return item;
	}
	public void setItem(Items item) {
		this.item = item;
	}
	public boolean isBuy() {
		return buy;
	}
	public void setBuy(boolean buy) {
		this.buy = buy;
	}
	
}
