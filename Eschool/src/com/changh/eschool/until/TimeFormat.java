package com.changh.eschool.until;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeFormat {
	public static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	public static String format(Date date)
	{
		return sdf.format(date); 
	}
	public static void main(String[] args) {
	}
}
