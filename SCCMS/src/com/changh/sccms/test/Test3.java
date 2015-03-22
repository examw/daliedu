package com.changh.sccms.test;

import java.util.Arrays;

import com.changh.sccms.entity.ExamQuestion;


public class Test3 {
	public static void main(String[] args) throws Exception{
		//String str = "1231%' or '1%' = '1";
		//String str1 ="1231";
		//System.out.println(str.replace("%", "\\%"));
		//System.out.println(str1.replace("%", "\\%"));	
		String str = "sssssA) 15 	    B) 50     C) 55     D) 5E) 5F) 5G) 5H) 5I) 5";
		System.out.println(Arrays.toString(str.replaceAll("[ABCD][.)、．]", "@@@").split("@@@")));
		System.out.println(str.replaceAll("[A-Z][.)、．]", "@@@").split("@@@").length);
		System.out.println(str.replaceAll("<[/]?p>", "").replaceAll("&nbsp;", ""));
		String questContent = "<p><br /></p><p>1、某新建高速公路路基修筑，判断其路基干湿类型的标准是( &nbsp; &nbsp;)。<br />A．分界相对含水量<br />B．分界稠度划分<br />C．路基临界高度<br />D．路基土压实度<br />[答案]:A<br />[解析]:这个题目的解析<br /><br />2、下列路段中，不宜在雨期施工的是（）<br />A．碎砾石路段<br />B．路堑弃方路段<br />C．膨胀土路段<br />D．丘陵区砂类土路段<br />[答案]:C<br />[解析]:这个题目的解析</p>";
		questContent = questContent.replaceAll("<[/]?p>", "").replaceAll("&nbsp;", "").replaceAll("<br />[0-9]+[.、．]", "@@@@");
		String[] contentArr = questContent.split("@@@@");
		String content = "<p>1、某新建高速公路路基修筑，判断其路基干湿类型的标准是( &nbsp; &nbsp;)。<br />A．分界相对含水量<br />B．分界稠度划分<br />C．路基临界高度<br />D．路基土压实度<br />2、下列路段中，不宜在雨期施工的是（）<br />A．碎砾石路段<br />B．路堑弃方路段<br />C．膨胀土路段<br />D．丘陵区砂类土路段<br />[答案]:</p><p>1.C 2.C<br /></p>";
		content = "<p><br /></p>"+content;
		content = content.replaceAll("<[/]?p>", "").replaceAll("&nbsp;", "");
		String answer[] = content.substring(content.indexOf("[答案]:"), content.length()).replaceAll("[0-9]+[.、．]", "@@@@").split("@@@@");
		content = (content.substring(0, content.indexOf("[答案]:")).replaceAll("<br />[0-9]+[.、．]", "@@@@"));
		String[] arr = content.split("@@@@");
//		System.out.println(arr[1]);
		StringBuffer buf = new StringBuffer();
		for(int i=1;i<arr.length;i++)
		{
			String s = arr[i];
			System.out.println(s.replaceAll("<br />", "\n"));
			System.out.println("答案："+answer[i]);
		}
		System.out.println("ddd".contains(" "));
		System.out.println("ddd-".split("-").length);
	}
}
