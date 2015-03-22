package com.changh.sccms.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test4 {
	public static void main(String[] args) {
//		System.out.println(PasswordCreaterUtil.createPassword(16));
//		StringBuffer buf = new StringBuffer();
//		String str= null;
//		buf.append(str);
//		System.out.println(buf.toString()+"¡°");
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("date", new Date());
//		System.out.println(JSONObject.fromObject(map).toString());
//		map.put("ok",true);
//		map.put("ok", false);
//		System.out.println(map.get("ok"));
//		 List<String> qids = new ArrayList<String>();
//		 List<String> rids = new ArrayList<String>();
//		 List<String> scores = new ArrayList<String>();
//		 qids.add("1001");
//		 qids.add("1002");
//		 qids.add("1003");
//		 qids.add("1004");
//		 qids.add("1005");
//		 rids.add("1001");
//		 rids.add("1001");
//		 rids.add("1002");
//		 rids.add("1002");
//		 rids.add("1002");
//		 scores.add("10");
//		 scores.add("10");
//		 scores.add("10");
//		 scores.add("10");
//		 scores.add("10");
//		 Map<String,Integer> map = new HashMap<String,Integer>();
//			for(int i=0;i<qids.size();i++)
//			{
//				Integer temp = (Integer)map.get(rids.get(i));
//				map.put(rids.get(i), Integer.parseInt(scores.get(i))+(temp==null?0:temp));
//			}
//			System.out.println(map);
		String[] str = {"A","A","A","A","A","A"};
		for(int i=0;i<str.length;i++)
		{
			str[i] = "B";
		}
		System.out.println(Arrays.toString(str));
		System.out.println(Arrays.toString("A=B=C= d".split("  ")));
		System.out.println("a     d    d".replaceAll("\\s+", " "));
		long l = 179L;
		System.out.println(l/60);
	}
}
