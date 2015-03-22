<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>网校</title>
	<META name="ROBOTS" content="All" />
	<META name="Description" content="中华考试网校" />
	<META name="keywords" content="中华考试网校" />
	<link rel="stylesheet" type="text/css" href="/main/css/index.css">
	<link rel="stylesheet" type="text/css" href="/common/images/common.css">
	<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="artDialog/jquery.artDialog.js?skin=default" type="text/javascript"></script>
    <script src="js/login.js" type="text/javascript"></script> 
	<script language="javascript">
		var currentindex=1;//flash图片参数
		$(function(){
			//发送ajax请求,加载new.jsp信息
			//$("#top").load("/common/head1.jsp?date="+Math.random());
			//$("#foot").load("/common/foot1.html");
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
	<div class="harder">
    <div class="logo"><a href="/"><img src="/common/images/logo1.png"  alt="优异网校"/></a></div>
    <div class="nav1">
      <ul>
        <li style="background:none;"><a href="/main/main?examId=1011" target="_blank">一级建造师</a></li>
        <li><a href="/main/exam1015.html" target="_blank">造价工程师</a></li>
        <li><a href="/main/exam1013.html" target="_blank">MBA</a></li>
        <li><a href="/main/exam1033.html" target="_blank">安全工程师</a></li>
        <li><a href="/main/exam1054.html" target="_blank">考研英语二</a></li>
      </ul>
    </div>
    <div id="loginbox">
    	<div class="login"  id="logintop"> <a id="registbox" onclick="showRegbox();" title="注册网校会员" href="javascript:;"><img src="/common/images/zhuce.gif"/></a> 　<a id="loginbox" onclick="ShowLogin();" title="登录网校" href="javascript:;"><img src="/common/images/denglu.gif"/></a> </div>
    </div>
    <div class="clear"></div>
  	</div>
</div>
<div class="main"><h2 style="color: red">住建部电教中心送教上门合作单位      《建造师》杂志战略合作伙伴</h2></div>
<div class="loginStr" id="wxlogbox" style="height:249px;display:none;"></div>
<div class="logingc" id="wxregistbox" style="display:none;"></div>
<div class=main>
  <div class="main_box">
    <div class="wrp">
      <div class="banner" id="slide">
        <ul id="picList">
          <li class="slide_li first">
            <div class="imgBg_1"></div>
            <img class="slide_img" src="/images/1010-360.jpg" /> </li>
          <li class="slide_li">
            <div class="imgBg_2"></div>
            <img class="slide_img" src="/images/1010-3602.jpg" /></li>
          <li class="slide_li">
            <div class="imgBg_3"></div>
            <img class="slide_img" src="/images/1010-3603.jpg" /> </li>
          <li class="slide_li">
            <div class="imgBg_4"></div>
            <img class="slide_img" src="/images/1010-3604.jpg" /> </li>
          <li class="slide_li">
            <div class="imgBg_5"></div>
            <img class="slide_img" src="/images/1010-3605.jpg" /> </li>
        </ul>
        <div id="slideThumb"></div>
      </div>
    </div>
  <script type="text/javascript" src="/js/image.js"></script>
  <div class="css"></div>
  <div class="root"> 
  	<a href="/main/main?examId=1011" target="_blank"><img class="index_img" src="/main/images/navlo06.png" /></a>
  	<a href="/main/main?examId=1015" target="_blank"><img class="index_img" src="/main/images/navlo02.png" /></a> 
  	<a href="/main/main?examId=1033" target="_blank" class="rootright"><img  class="index_img" src="/main/images/navlo03.png" /></a>  
  <div style="clear:both;"></div>
  	<a href="/main/main?examId=1047" target="_blank"><img class="index_img" src="/main/images/navlo04.png" /></a>
  	<a href="/main/main?examId=1012" target="_blank"><img class="index_img" src="/main/images/navlo05.png" /></a>
  	<a href="/main/main?examId=1002" target="_blank" class="rootright"><img class="index_img" src="/main/images/navlo01.png" /></a> 
  <div style="clear:both;"></div>
  </div>
</div>
</div>
<div class="main" id="main">
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