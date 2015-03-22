package com.changh.sccms.service;

import java.util.List;

import javax.servlet.http.Cookie;

import com.changh.sccms.entity.CartItem;


public interface CartService 
{
	//����,ɾ��,�ָ�,���,�鿴(Ҫ���,ɾ����),ͳ��
	public boolean add(int productId,int pType)throws Exception;
	public CartItem delete(int productId,int pType);
	public void remove() ;
	public void recovery(int productId,int pType);
	public List<CartItem> getBuyPros ();
	public List<CartItem> getDeletePros();
	public double getSavedMoney();
	public double getTotalOMoney();
	public double getTotalRMoney();
	public double getStuMoney();//��ѧԱ��
	public List<CartItem> getProFromCookie(Cookie packageCookie,Cookie gradeCookie)throws Exception;
	public List<CartItem> getItems();
	public String getProIds(int pType);
	
	//2014.03.15
	public List<CartItem> getProFromIds(String pkgIds, String gradeIds)
			throws Exception;
}
