package com.changh.eschool.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.changh.eschool.entity.ExamRecord;
import com.changh.eschool.entity.SimpleTeacher;
import com.changh.eschool.until.Escape;

public class Test5 {
	public static void main(String[] args) throws ParseException, UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d1 = sdf.parse("2013-05-08 8:32:10");
		Date d2 = sdf.parse("2013-05-08 8:33:25");
		long l = (d2.getTime()-d1.getTime())/1000;
		System.out.println(l/1000);
		System.out.println(l%60!=0?l/60+1:l/60);

		
		SimpleTeacher s = new SimpleTeacher();
		s.setTchId(1);
		s.setTchName("2");
		SimpleTeacher s1 = new SimpleTeacher();
		s1.setTchId(1);
		s1.setTchName("2");
		System.out.println(s.hashCode());
		System.out.println(s1.hashCode());
				System.out.println(s1.equals(s));
				
		System.out.println("2".equals("2"));

		System.out.println(URLDecoder.decode("CookiesState&1049-C%2CD%2CE&1050-C&","utf-8"));
		System.out.println("C,d".split(",").length);
		System.out.println("A,B,C".contains("A,B,"));
		System.out.println("5005SS".replaceAll("[A-Z]", ""));
		System.out.println(Escape.unescapeId("5005SS"));

	}
	private static double getEachScore(String scores,String flag)
	{
		String s1 = scores.substring(scores.indexOf(flag),scores.length());
		return Double.parseDouble(s1.substring(s1.indexOf(flag)+flag.length(),s1.indexOf("&")));
	}
}
