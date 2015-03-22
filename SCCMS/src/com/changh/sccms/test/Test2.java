package com.changh.sccms.test;

import java.util.ArrayList;
import java.util.List;


public class Test2 {
	public static void main(String[] args) {
//	String str="http%3A%2F%2Fwww%2Eedu24ol%2Ecom%2Fv%5F2012%2Flessoncenter%2Fgcjsl%2D775%2D0%2D3%2Ehtml";
//	System.out.println(Escape.unescape(str));
//		int tradeType = 0;
//		System.out.println(tradeType==0?"网上支付":tradeType==1?"学习卡支付":"银行汇款");
		//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		//System.out.println(format.format(new Date()));
//		System.out.println(Arrays.toString("0:".split(":")));
		//System.out.println(0-0.01);
//		System.out.println(Math.round((2870.0-2688.0)*100)/100.0);
		List<String> list = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		list2.add("1");
		list2.add("3");
		list2.add("4");
		list2.add("5");
		list2.add("7");
		list2.add("11");
		list2.add("21");
		for(int i=0;i<20;i++)
		{
			list.add(String.valueOf(i));
		}
		list.removeAll(list2);
		System.out.println(list);
		String s = "ssss";
		change(s);
		System.out.println(s);
	}
	private static void change(String s)
	{
		s = "haha";
	}
}
