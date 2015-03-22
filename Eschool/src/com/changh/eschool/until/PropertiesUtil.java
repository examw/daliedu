package com.changh.eschool.until;

import java.io.IOException;
import java.util.Properties;

/**
 * 解析properties文件的工具类
 * @author Administrator
 *
 */
public class PropertiesUtil {
	private static Properties props;
	static {
		props = new Properties();
		try {
			props.load(PropertiesUtil.class
					.getClassLoader()
					.getResourceAsStream("opt.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getOptValue(String key){
		String val = props.getProperty(key);
		if(val == null){
			return "";
		}
		return val;
	}
	public static void setOptValue(String key,String value)
	{
		props.setProperty(key, value);
	}
	
}
