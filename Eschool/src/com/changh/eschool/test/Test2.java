package com.changh.eschool.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import com.changh.eschool.until.Arith;
import com.changh.eschool.until.DegistUtil;
import com.changh.eschool.until.Escape;
import com.changh.eschool.until.TimeFormat;

public class Test2 {
	public static void main(String[] args) throws ParseException, CloneNotSupportedException, UnsupportedEncodingException {
		
		
//		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
//		String str = format.format(new Date());
//		Date today = format.parse(str);
//		Date day = format.parse("2013-02-02");
//		System.out.println(day);
//		System.out.println(today);
//		System.out.println(day.compareTo(today));
//		String str = "MyGradeID=1";
//		System.out.println(!str.endsWith("="));
//		System.out.println(Arrays.toString(str.split("=")[1].split(",")));
//		System.out.println(str.split("=")[1].split(",")[0]);
		//System.out.println(Escape.unescape("MyGradeID%3D1005%2C1001"));
		//System.out.println(new StringBuffer().length());
//		System.out.println("120:".split("[:]")[0]);
//		ArrayList<String> list = new ArrayList<String>();
//		for(String l:list)
//		{
//			System.out.println(l);
//		}
//		System.out.println(new Date().getTime());
//		System.out.println(Escape.unescape("http://www.edu24ol.com/user_center/login.asp?from=http%3a%2f%2fwww.edu24ol.com%2fV_2012%2fusercenter%2flogin.aspx%3furl%3dhttp%3a%2f%2fwww.edu24ol.com%2fv_2012%2fusercenter%2faccount%2fFace.aspx%26n_firstlogin%3dtrue"));
//		Student stu = new Student();
//		Student stu2 = (Student) stu.clone();
//		System.out.println(stu==stu2);
//		String keywords ="%E5%A5%97%E9%A4%90";
//		System.out.println(URLDecoder.decode(keywords, "UTF-8"));
//		System.out.println(DegistUtil.md5Digest(""));
//		System.out.println(DegistUtil.md5Digest("1"));
//		System.out.println(DegistUtil.md5Digest("123"));
//		System.out.println(DegistUtil.md5Digest("1a2a3adddddddddddddddddd"));
//		String body ="Ì×²Í|ÔùËÍ:½Ì²Ä";
//		String present = null;
//		int index = body.indexOf("ÔùËÍ");
//		if(index!=-1)
//		{
//			present = body.substring(index);
//		}
//		System.out.println(present);
//		System.out.println("1212afde12a1df .jpgÖÐs".matches("[0-9]*[\\s|\\S]*[\u4E00-\u9FA5]+[\\s|\\S]*"));
//		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
//		String str = format.format(new Date());
//		Date today = format.parse(str);
//		System.out.println(format.parse("2013-04-01").compareTo(today));
//		System.out.println(Arith.add(0.01, 0.05));
//		System.out.println(0.01+0.05);System.out.println(1-0.42);
//		System.out.println(Arith.sub(1.0, 0.42));
//		System.out.println(TimeFormat.format(new Date()).substring(8));
//		System.out.println("2001-200101010101".substring("2001-200101010101".indexOf("-")+1));
//		System.out.println("2013L£»ÁË".matches("[\\s|\\S]*[\u4E00-\u9FA5]+[\\s|\\S]*"));
//		System.out.println(Escape.unescape("%25u4E00%25u7EA7%25u5EFA%25u9020"));
//		System.out.println(UUID.randomUUID());
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
//		System.out.println(sdf.parse("2013-04-14 14:00:00 888").compareTo(new Date()));
		String s = DegistUtil.md5Digest("nimabi");
		System.out.println(s.replaceAll("[^0-9A-Za-z]", ""));
		String s1 = s+"12345";
		System.out.println(s1.substring(s.length(),s1.length()));
		System.out.println("12345".contains(s));
		System.out.println(DegistUtil.md5Digest("hahaha|oxxC4EJT2YIvncmGe4VCmw="));
		System.out.println(DegistUtil.md5Digest("hahaha|oxxC4EJT2YIvncmGe4VCmw=="));
	}
}
