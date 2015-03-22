<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<% 

//收款方
String spname = "财付通双接口测试";  

//商户号
String partner = "1210866601";

//密钥
String key = "e04d4v60d2a379d8ne3tb1o3a3x19m7a";

//交易完成后跳转的URL
String return_url = "http://127.0.0.1/tenpay/tenpay_api_b2c/payReturnUrl.jsp";

//接收财付通通知的URL
String notify_url = "http://127.0.0.1/tenpay/tenpay_api_b2c/payNotifyUrl.jsp";

%>
