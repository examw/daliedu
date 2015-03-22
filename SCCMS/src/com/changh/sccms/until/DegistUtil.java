package com.changh.sccms.until;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import sun.misc.BASE64Encoder;
/**
 * Degist Util
 * @author Mr.rong
 *
 */
public class DegistUtil {
	/**
	 * 利用MD5算法加密
	 * @param seq
	 * @return
	 */
	public static String md5Digest(String seq) {
		try {
			//采用MD5算法加密
			MessageDigest md5Code =
				MessageDigest.getInstance("md5");
			byte[] bTmp=md5Code.digest(seq.getBytes());
			//采用Base64算法将加密后的byte[]转换成string
			BASE64Encoder base64=new BASE64Encoder();
			seq=base64.encode(bTmp);
			return seq;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	public static String getMd5CodeOfQuestion(String content)
	{

		//解析这个题目
		content = content.toUpperCase().replaceAll("[^0-9A-Za-z\u4E00-\u9FA5]", "");
		String[] arrStr = content.replaceAll("[ABCD]{1}","@@@").split("@@@");
/*		if(arrStr.length>50)
		{
			System.out.println("这个题目选项不规则没有办法判断是否重复");
		}else
		{
			Arrays.sort(arrStr);
			System.out.println(Arrays.toString(arrStr));
		}*/
		try
		{
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte[] temp = digest.digest(Arrays.toString(arrStr).getBytes());
			BASE64Encoder encoder = new BASE64Encoder();
			String dest = encoder.encode(temp);
			return dest;
		} catch (NoSuchAlgorithmException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
//	public static void main(String[] args) {
//		System.out.println(md5Digest("11111111111"));
//		System.out.println(md5Digest("22"));
//	}
}
