package com.changh.sccms.test;

import org.apache.log4j.Logger;

import com.changh.sccms.until.LogUtil;

public class TestLog4j {
	//static Logger logger = Logger.getLogger(TestLog4j.class);
	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		logger.debug("调试信息");
//		logger.info("普通消息");
////		System.out.println("lalala");
//		logger.warn("警告信息");
//		logger.error("错误消息");
//		logger.fatal("致命消息");
//		for(int i=0;i<10000;i++)
//		{
//			LogUtil.logger.warn("hahaha_"+i);
//		}
		String s = "/upload/haha.jax";
		System.out.println(s.substring(s.lastIndexOf("/")));
	}
	

}
