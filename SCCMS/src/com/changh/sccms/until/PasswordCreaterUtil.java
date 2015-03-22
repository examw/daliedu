package com.changh.sccms.until;

import java.util.Random;

/*
 * 学习卡密码生成器
 */
public class PasswordCreaterUtil {
	private static char[] chars={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q',
		'r','s','t','u','w','v','x','y','z','0','1','2','3','4','5','6','7','8','9'
		,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','W','R','S'
		,'T','U','V','W','X','Y','Z'};
	/*
	 * 生成密码的方法
	 * @param n 密码的长度
	 */
	public static String createPassword(int n)
	{
		Random r = new Random();
		StringBuffer buffer = new StringBuffer();
		for(int i=0;i<n;i++)
		{
			buffer.append(chars[r.nextInt(chars.length)]);
		}			
		return buffer.toString();
	}
}
