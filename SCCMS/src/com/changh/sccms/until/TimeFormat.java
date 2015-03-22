package com.changh.sccms.until;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeFormat {
	public static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	public static String format(Date date)
	{
		return sdf.format(date); 
	}
	public static void main(String[] args) {
		System.out.println(TimeFormat.format(new Date()));
	}
}
