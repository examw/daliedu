package com.changh.eschool.test;

import javax.servlet.http.Cookie;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.changh.eschool.service.CartService;

public class Test3 {
	@Test
	public void testCart()throws Exception
	{
		Cookie c = new Cookie("grade","1001,1004");
		String[] configs = {"applicationContext-base.xml"};
		ApplicationContext ac = 
			new ClassPathXmlApplicationContext(configs);
		CartService cartService = (CartService) ac.getBean("cartService");
		System.out.println("--------------------------");
		System.out.println(cartService.getProFromCookie(null, c));
		System.out.println(cartService.add(1001, 1));
		System.out.println(cartService.getBuyPros().size());
		System.out.println("--------------------------");
		System.out.println(getEachScore("&1001-1001-1.0&1001-1002-0.0&","1001-1001-"));
	}
	private double getEachScore(String scores,String flag)
	{
		int s1 = scores.indexOf(flag);
		String ss1 = scores.substring(s1,scores.length());
		int s2 = ss1.indexOf("&");
		return Double.parseDouble(scores.substring(s1,s2));
	}
}
