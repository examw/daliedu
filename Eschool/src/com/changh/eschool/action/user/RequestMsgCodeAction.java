package com.changh.eschool.action.user;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TreeMap;

import javax.servlet.http.Cookie;

import org.json.JSONObject;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.until.HttpInvoker;
import com.changh.eschool.until.LogUtil;
import com.changh.eschool.until.ParamsSign;

public class RequestMsgCodeAction extends BaseAction {
	static String app_id = "300129840000034964";
	static String app_secret = "5084fe200a4e6f1ab83f8460e3340370";
	private String userPhone;
	private boolean ok;

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	// 先获取Access_token
	private static String getAccess_token() throws Exception {
		String res_code;
		JSONObject json;
		int i = 0;
		do {
			i++;
			String postUrl = "https://oauth.api.189.cn/emp/oauth2/v2/access_token"; // 获取access_token的地址
			TreeMap<String, String> paramsMap1 = new TreeMap<String, String>();
			paramsMap1.put("app_id", app_id);
			paramsMap1.put("app_secret", app_secret);
			paramsMap1.put("grant_type", "client_credentials");
			String postEntity = "grant_type=" + "client_credentials"
					+ "&app_id=" + app_id + "&app_secret=" + app_secret;
			String resJson = HttpInvoker.httpPost(postUrl, null, postEntity);
			json = new JSONObject(resJson);
			res_code = json.getString("res_code");
		} while (!"0".equals(res_code) && i <= 3);
		return (String) json.get("access_token");
	}

	// 发送短信
	private static int sendSms(String userPhone, String access_token,String jsid)
			throws Exception {
		try {
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String timestamp = dateFormat.format(date);
			TreeMap<String, String> paramsMap = new TreeMap<String, String>();
			paramsMap.put("app_id", app_id);
			paramsMap.put("access_token", access_token);
			paramsMap.put("timestamp", timestamp);

			String getUrl = "http://api.189.cn/v2/dm/randcode/token?app_id="
					+ app_id + "&access_token=" + access_token + "&timestamp="
					+ timestamp + "&sign="
					+ ParamsSign.value(paramsMap, app_secret);
			String resJson = HttpInvoker.httpGet(getUrl);
			JSONObject json = new JSONObject(resJson);
			LogUtil.logger.warn(json.get("token"));

			TreeMap<String, String> paramsMap1 = new TreeMap<String, String>();
			paramsMap1.put("app_id", app_id);
			paramsMap1.put("access_token", access_token);
			paramsMap1.put("timestamp", timestamp);
			paramsMap1.put("token", json.get("token").toString());
			paramsMap1.put("url", "http://wx.daliedu.cn/user/getSmsCode;jsessionid="+jsid);
			paramsMap1.put("phone", userPhone);
			paramsMap1.put("exp_time", "2");

			String postUrl = "http://api.189.cn/v2/dm/randcode/send?app_id="
					+ app_id + "&access_token=" + access_token + "&timestamp="
					+ URLEncoder.encode(timestamp,"UTF-8") + "";
			String postEntity = "token=" + json.get("token") + "&phone="
					+ userPhone
					+ "&url="
					+ "http://wx.daliedu.cn/user/getSmsCode;jsessionid="+jsid// 有开发者实现的验证码通知接口
					+ "&exp_time=" + "2" + "&sign="
					+ ParamsSign.value(paramsMap1, app_secret);

			String resJson1 = HttpInvoker.httpPost(postUrl, null, postEntity);
			JSONObject json2 = new JSONObject(resJson1);
			return json2.getInt("res_code");
		} catch (Exception e) {
			LogUtil.logger.warn("mabia", e);
			throw e;
		}
	}

	public String execute() throws Exception {
		int res_code = 1;
		String jsid = httpRequest.getSession().getId();
		try {
			int i = 0;
			do {
				i++;
				res_code = sendSms(userPhone, getAccess_token(),jsid);
			} while (res_code != 0 && i <= 3);
		} catch (Exception e) {
			LogUtil.logger.warn("信息：", e);
		}
		ok = true;
		Cookie c = new Cookie("JSESSIONID",httpRequest.getSession().getId());
		c.setPath("/");
		httpResponse.addCookie(c);
		return "success";
	}

//	private String getSessionCookieString(HttpServletRequest request) throws Exception {
//		Cookie[] cookies = request.getCookies();
//		String s = null;
//		if(cookies == null)
//		{
//			return httpRequest.getSession().getId();
//		}
//		for(Cookie c:cookies)
//		{
//			if("jsessionid".equalsIgnoreCase(c.getName())){
//				s = c.getValue();
//			}
//		}
//		return s;
//	}
}
