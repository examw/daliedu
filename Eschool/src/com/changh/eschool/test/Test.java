package com.changh.eschool.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import open189.sign.ParamsSign;

import org.json.JSONObject;

import com.changh.eschool.until.HttpInvoker;
public class Test
{
	static String app_id = "300129840000034964";
	static String app_secret = "5084fe200a4e6f1ab83f8460e3340370";
//	static String access_token = "749a88b12fad6a0b91dff61b3466d4061395132590786";
	private static String getAccess_token()throws Exception {
		String postUrl = "https://oauth.api.189.cn/emp/oauth2/v2/access_token"; //获取access_token的地址
		TreeMap<String, String> paramsMap1 = new TreeMap<String, String>();
		paramsMap1.put("app_id", app_id);
		paramsMap1.put("app_secret", app_secret);
		paramsMap1.put("grant_type", "client_credentials");
		String postEntity = "grant_type="+"client_credentials"+"&app_id="+app_id+"&app_secret="+app_secret;
		String resJson =  HttpInvoker.httpPost(postUrl,null,postEntity);
		System.err.println(resJson);
		JSONObject json = new JSONObject(resJson);
		System.out.println(json.get("access_token"));
		System.out.println(json.get("expires_in"));
		System.out.println(json.getString("res_code"));
		System.out.println(json.get("res_message"));
		return (String) json.get("access_token");
	}
	private static String sendSms(String userPhone,String access_token) throws Exception {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timestamp = dateFormat.format(date);
		System.err.println(timestamp);
		TreeMap<String, String> paramsMap = new TreeMap<String, String>();
		paramsMap.put("app_id", app_id);
		paramsMap.put("access_token", access_token);
		paramsMap.put("timestamp", timestamp);
		
		String getUrl = "http://api.189.cn/v2/dm/randcode/token?app_id=" + app_id
				+ "&access_token=" + access_token + "&timestamp="+timestamp + "&sign="+ParamsSign.value(paramsMap, app_secret);
		String resJson = HttpInvoker.httpGet(getUrl);
		System.err.println(resJson);
		JSONObject json = new JSONObject(resJson);
		System.out.println(json.get("token"));

		TreeMap<String, String> paramsMap1 = new TreeMap<String, String>();
		paramsMap1.put("app_id", app_id);
		paramsMap1.put("access_token", access_token);
		paramsMap1.put("timestamp", timestamp);
		paramsMap1.put("token", json.get("token").toString());
		paramsMap1.put("url", "http://wx.daliedu.cn");
		paramsMap1.put("phone", userPhone);
		paramsMap1.put("exp_time", "2");
		
		String postUrl = "http://api.189.cn/v2/dm/randcode/send?app_id="
		                 + app_id + "&access_token=" + access_token + "&timestamp=" + timestamp + "";
		String postEntity = "token=" + json.get("token")
				          + "&phone=" + userPhone
				          + "&url=" + "http://wx.daliedu.cn"// 有开发者实现的验证码通知接口
				          + "&exp_time=" + "2"
				          + "&sign="+ParamsSign.value(paramsMap1, app_secret);
		
		String resJson1 = HttpInvoker.httpPost(postUrl,null,postEntity);
		System.out.println(resJson1);
		JSONObject json2 = new JSONObject(resJson1);
		System.out.println(json2.getInt("res_code"));
		
		return resJson1;
	}
	public static void main(String[] args) throws Exception {
		//getAccess_token();
//		sendSms("18613985700",getAccess_token());
		String area = URLEncoder.encode("北京(省)东城(市/区)","UTF-8");
		String url = "http://localhost:8080/mobile/register?username=ggfgd23&pwd=123456&email=ssdaq23@163.com&phone=18613985700&qq=135245889&area="+area+"&exam=一级建造师&name=得令";
		baseHttpGet(url,5000);
	}
	public static String baseHttpGet(String urladdr,int millis)throws Exception
	{
		System.out.println("get url = " + urladdr);
		HttpURLConnection conn = null;
		BufferedReader br = null;
		String result = "";
		try {
			URL url = new URL(urladdr);
			conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(millis);
			conn.setReadTimeout(millis);
			conn.setRequestMethod("GET");
			// 检查网络
			conn.connect();
			// 连接错误
			if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
				throw new Exception();
			}else if(conn.getResponseCode() == HttpURLConnection.HTTP_OK)
			{
//				Map<String,List<String>> map=conn.getHeaderFields();
//				Set<String> set=map.keySet();
//				for (Iterator iterator = set.iterator(); iterator.hasNext();) {
//					String key = (String) iterator.next();
//					if (key.equals("Set-Cookie")) {
//						List<String> list = map.get(key);
//						StringBuilder builder = new StringBuilder();
//						for (String str : list) {
//							builder.append(str);
//						}
//						String tmpcookies = builder.toString();
//						System.out.println("cookies == "+ tmpcookies);
//						// 保存cookie
//						break;
//					}
//				}
			}
			InputStream in = conn.getInputStream();
			br = new BufferedReader(new InputStreamReader(in));
			StringBuffer buf = new StringBuffer();
			String line = null;
			while ((line = br.readLine()) != null) {
				buf.append(line);
			}
			result = buf.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (conn != null) {
				conn.disconnect();
			}
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}
}