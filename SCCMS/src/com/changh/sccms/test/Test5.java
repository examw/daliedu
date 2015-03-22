package com.changh.sccms.test;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

public class Test5 {
	public static void main(String[] args) {
		
//	String a = "";
//	try
//    {
//        String c = new String(a.getBytes("iso8859-1"),"utf-8");
//        System.out.println(Arrays.toString("A&B&C&".split("&")));
//        String criteria = "select * from xxxxx";
//        System.out.println(criteria.substring(criteria.indexOf("from")));
//    }
//    catch (UnsupportedEncodingException e)
//    {
//        e.printStackTrace();
//    }
		String includeCid = "1001,1002,1003,11003";
		String gradeId = "11003";
		includeCid = ","+includeCid+",";
		String idd = ","+gradeId+",";
		String first = includeCid.substring(0,includeCid.indexOf(idd));
		String after = includeCid.substring(includeCid.indexOf(idd)+idd.length(),includeCid.length());
		includeCid = first+","+after;
		includeCid = includeCid.substring(1,includeCid.length()-1);
		System.out.println(includeCid);
}
}