
<%
	/* *
	 *功能：支付宝即时到帐接口调试入口页面
	 *版本：3.2
	 *日期：2011-03-17
	 *说明：
	 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
	 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模拟网银支付返回</title>
<script language=JavaScript>

</script>
<style>
* {
	margin: 0;
	padding: 0;
}

ul,ol {
	list-style: none;
}

.title {
	color: #ADADAD;
	font-size: 14px;
	font-weight: bold;
	padding: 8px 16px 5px 10px;
}

.hidden {
	display: none;
}

.new-btn-login-sp {
	border: 1px solid #D74C00;
	padding: 1px;
	display: inline-block;
}

.new-btn-login {
	background-color: transparent;
	background-image: url("../../images/new-btn-fixed.png");
	border: medium none;
}

.new-btn-login {
	background-position: 0 -198px;
	width: 82px;
	color: #FFFFFF;
	font-weight: bold;
	height: 28px;
	line-height: 28px;
	padding: 0 10px 3px;
}

.new-btn-login:hover {
	background-position: 0 -167px;
	width: 82px;
	color: #FFFFFF;
	font-weight: bold;
	height: 28px;
	line-height: 28px;
	padding: 0 10px 3px;
}

.bank-list {
	overflow: hidden;
	margin-top: 5px;
}

.bank-list li {
	float: left;
	width: 153px;
	margin-bottom: 5px;
}

#main {
	width: 750px;
	margin: 0 auto;
	font-size: 14px;
	font-family: '宋体';
}

#logo {
	background-color: transparent;
	background-image: url("../../images/new-btn-fixed.png");
	border: medium none;
	background-position: 0 0;
	width: 166px;
	height: 35px;
	float: left;
}

.red-star {
	color: #f00;
	width: 10px;
	display: inline-block;
}

.null-star {
	color: #fff;
}

.content {
	margin-top: 5px;
}

.content dt {
	width: 100px;
	display: inline-block;
	text-align: right;
	float: left;
}

.content dd {
	margin-left: 100px;
	margin-bottom: 5px;
}

#foot {
	margin-top: 10px;
}

.foot-ul li {
	text-align: center;
}

.note-help {
	color: #999999;
	font-size: 12px;
	line-height: 130%;
	padding-left: 3px;
}

.cashier-nav {
	font-size: 14px;
	margin: 15px 0 10px;
	text-align: left;
	height: 30px;
	border-bottom: solid 2px #CFD2D7;
}

.cashier-nav ol li {
	float: left;
}

.cashier-nav li.current {
	color: #AB4400;
	font-weight: bold;
}

.cashier-nav li.last {
	clear: right;
}

.alipay_link {
	text-align: right;
}

.alipay_link a:link {
	text-decoration: none;
	color: #8D8D8D;
}

.alipay_link a:visited {
	text-decoration: none;
	color: #8D8D8D;
}
</style>
</head>
<body text=#000000 bgColor=#ffffff leftMargin=0 topMargin=4>
<s:debug></s:debug>
<div id="main">
<div id="head">

<span class="title">网银支付</span> <!--<div id="title" class="title">支付宝即时到帐付款快速通道</div>-->
</div>
<div class="cashier-nav">
<ol>
	<li class="current">1、确认付款信息 →</li>
	<li>2、付款 →</li>
	<li class="last">3、付款完成</li>
</ol>
</div>
<form name=alipayment action=Receive.jsp
	method=post target="_blank">
<div id="body" style="clear: left">
<dl class="content">
	<input type="hidden" name="trade_status" value="TRADE_FINISHED"/>
	<dt>订单号：</dt>
	<dd><span class="red-star">*</span> <input size=30 name=v_oid value="201302231006" />
	<span>如：7月5日定货款。</span></dd>
	<dt>支付方式中文说明：</dt>
	<dd><span class="red-star">*</span> <input size=30 name=v_pmode value="中行长城信用卡" />
	<span>如：7月5日定货款。</span></dd>
	<dt>状态：</dt>
	<dd><span class="red-star">*</span> <input size=30 name=v_pstatus value="20" />
	<span>如：7月5日定货款。</span></dd>
	<dt>币种：</dt>
	<dd><span class="red-star">*</span> <input size=30 name=v_moneytype value="CNY" />
	<span>如：7月5日定货款。</span></dd>
	<dt>检验码：</dt>
	<dd><span class="red-star">*</span> <input size=30 name=v_md5str value="36D1975C8FEE1905A205378D5ED60C08" />
	<span>如：7月5日定货款。</span></dd>
	<dt>付款金额：</dt>
	<dd><span class="red-star">*</span> <input maxLength=10 size=30
		name=v_amount onfocus="if(Number(this.value)==0){this.value='';}"
		value="2688.0" /> <span>如：112.21</span></dd>
	<dt>备注1：</dt>
	<dd><span class="null-star">*</span> <textarea
		style="margin-left: 3px;" name=remark1 rows=2 cols=40 wrap="physical">赠送：作图教材</textarea><br />
	<span>（如联系方法，商品要求、数量等。100汉字内）</span></dd>
	<dt></dt>
	<dd><span class="new-btn-login-sp">
	<button class="new-btn-login" type="submit" style="text-align: center;">模拟post</button>
	</span></dd>
</dl>
</div>
</form>
<div id="foot">


</div>
</div>
</body>
</html>
