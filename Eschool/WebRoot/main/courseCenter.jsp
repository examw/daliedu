<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>大立教育网络课堂,大立教育网校，大立教育官方网上学习平台、补课平台,专注一级建造师、二级建造师等建筑工程考试辅导</title>
	<META name="ROBOTS" content="All" />
	<META name="Description" content="大立教育网络课堂" />
	<META name="keywords" content="大立教育网络课堂,一级建造师网校,一级建造师网络课堂,大立网校" />
	<link rel="stylesheet" type="text/css" href="/main/css/index.css">
	<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
        <script src="/qqonline/qqkefu.js" type="text/javascript"></script>
    <script src="artDialog/jquery.artDialog.js?skin=default" type="text/javascript"></script> 
	<script language="javascript">
		var currentindex=1;//flash图片参数
		$(function(){
			//发送ajax请求,加载new.jsp信息
			$("#top").load("/common/head1.jsp?date="+Math.random());
			$("#main").load("/main/examTree?time="+Math.random());
			
		});
		function onOver(id){
		    document.getElementById(id).style.display = "none";
		} 
		function onMous(id){
		    document.getElementById(id).style.display = "block";
		}
</script>

</head>
<body>
<div class="top" id="top">
</div>
<div class="loginStr" id="wxlogbox" style="height:249px;display:none;"></div>
<div class="logingc" id="wxregistbox" style="height:530px;display:none;"></div>
<!--<div class="main" id="main"></div>-->
<style type="text/css"><!--
.kccon ul li .kcb2 a {margin-right:20px;font-size:16px;font-family:微软雅黑}
--></style>
<div class="main">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"></meta>
    <div class="kccon">
        <ul>
            <li>
                <div class="kcb1"><a target="_blank" href="javascript:;">建筑工程</a></div>
                <div class="kcb2">
                    <div style="float:left;">
                        <a href="/main/exam1011.html">一级建造师</a>
                        <a href="/main/exam1012.html">二级建造师</a>
                        <a href="/main/exam1013.html">监理工程师</a>
			<a href="/main/exam1033.html">安全工程师</a>
                        <a href="/main/exam1015.html">造价工程师</a>
                        <a href="">咨询工程师</a>
			<a href="/main/exam1002.html">全国造价员</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>

<link rel="stylesheet" type="text/css" href="/common/images/common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="gouke">
  <div class="goukec">
    <div class="liucheng">
      <div class="liucheng1"> 购课指南 </div>
      <ul>
        <li><a href="/user/register.jsp" target="_blank">快速注册用户名</a></li>
        <li><a href="/help/help.html" target="_blank">课程免费试听</a></li>
        <li><a href="/help/help.html" target="_blank">快速报名选课 </a></li>
        <li><a href="/help/help.html" target="_blank">如何支付费用</a></li>
      </ul>
    </div>
    <div class="gouksx" style="width:2px;"><img src="/main/images/gouksx.gif"/></div>
    <div class="liucheng">
      <div class="liucheng1"> 课程与订单 </div>
      <ul>
        <li><a href="/member/center" target="_blank">我的课程</a></li>
        <li><a href="/member/center" target="_blank">课程订单查询</a></li>
        <li><a href="/member/center" target="_blank">已开通课程</a></li>
        <li><a href="/member/center" target="_blank">未付费课程</a></li>
      </ul>
    </div>
    <div class="gouksx" style="width:2px;"><img src="/main/images/gouksx.gif"/></div>
    <div class="liucheng">
      <div class="liucheng1"> 售后与帮助 </div>
      <ul>
        <li><a href="http://www.daliedu.cn/com_linkus.asp" target="_blank">网校联系地址</a></li>
        <li><a href="tencent://message/?uin=262632873&Site=大立教育&Menu=yes" target="_self">QQ技术支持</a></li>
        <li><a href="http://ask.daliedu.cn/" target="_blank">在线答疑中心</a></li>
        <li><a href="http://www.daliedu.cn/fxjm.htm" target="_blank">加盟合作中心</a></li>
      </ul>
    </div>
    <div class="gouksx" style="width:2px;"><img src="/main/images/gouksx.gif"/></div>
    <div class="liucheng">
      <div class="liucheng1"> 支付方式 </div>
      <ul>
        <li><a href="http://www.daliedu.cn/pay.asp" target="_blank">支付方式</a></li>
        <li><a href="http://www.daliedu.cn/pay.asp" target="_blank">网上支付</a></li>
        <li><a href="http://www.daliedu.cn/pay.asp" target="_blank">银行转账汇款</a></li>
        <li><a href="http://www.daliedu.cn/pay.asp" target="_blank">邮局转账汇款</a></li>
      </ul>
    </div>
    <div class="gouksx" style="width:2px;"><img src="/main/images/gouksx.gif"/></div>
    <div class="liuchengd">
      <div class="liucheng1"> 咨询热线 </div>
      <div class="photo">400-6666-458<br>010-62114149</div>
      <div class="time">周一至周日 8:30-21:30</div>
<div class="time"><br /><a href="/app/index.html" target="_blank"><img src="/main/images/android-logo.png">&nbsp;&nbsp;手机客户端下载</a></div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<div class="footer">
	<div class="webinfo" style="padding-top:0px;margin-top:10px;">友情链接:
        <a href="http://www.constructor.cn/" target="_blank">中国注册建造师网</a>&nbsp;&nbsp;&nbsp;
	<a href="http://class.daliedu.cn/" target="_blank">旧版补课系统</a>&nbsp;&nbsp;&nbsp;
	<a href="http://ask.daliedu.cn/" target="_blank">在线答疑</a>&nbsp;&nbsp;&nbsp;
	<a href="http://www.daliedu.cn/topic/mssyj/" target="_blank">名师说一建</a>&nbsp;&nbsp;&nbsp;
         <a href="http://www.daliedu.cn/" target="_blank">大立教育</a>&nbsp;&nbsp;&nbsp;
	</div>
  <div class="webinfo" style="padding-top:0px;margin-top:0px;"><span><img src="/main/images/footer_p1.gif"> <img src="/main/images/footer_p2.gif"></span><div><a href="http://www.miitbeian.gov.cn/" target="_blank">京ICP备11012638号</a> 北京世纪大立教育科技有限责任公司&nbsp;&nbsp;   &copy;support：<a href="http://www.youeclass.com" target="_blank">优异科技</a>
<br />
    Copyright &copy; <a href="http://wx.daliedu.cn"  style="color:#b6afaf;">大立网校</a>（<a href="http://www.daliedu.cn/" style="color:#b6afaf;" target="_blank">www.daliedu.cn</a>) All Rights Reserved&nbsp;&nbsp;<a href="http://www.daliedu.cn/com_wangzhan.asp" target="_blank">关于我们</a> &nbsp;&nbsp; <a href="http://www.daliedu.cn/com_linkus.asp" target="_blank">联系我们</a> &nbsp;&nbsp; <script src="http://s23.cnzz.com/stat.php?id=5817996&web_id=5817996" language="JavaScript"></script> &nbsp;&nbsp; <script language="javascript" type="text/javascript" src="http://js.users.51.la/16815538.js"></script>
<noscript><a href="http://www.51.la/?16815538" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/16815538.asp" style="border:none" /></a></noscript></div><div class="clear"></div>
</div>
</div>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript" src=http://float2006.tq.cn/floatcard?adminid=9306607&sort=0 ></SCRIPT>