<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>优异网校,全国十佳职业培训网校，官方指定2013年一级建造师等建筑工程考试及管理类联考网上学习平台</title>
	<META name="ROBOTS" content="All" />
	<META name="Description" content="优异网校,全国十佳职业培训网校，官方指定2013年一级建造师等建筑工程考试及管理类联考网上学习平台" />
	<META name="keywords" content="优异网校,一级建造师网校,2013年一级建造师网络课堂,大立网校" />
	<link rel="stylesheet" type="text/css" href="/main/css/index.css">
	<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="artDialog/jquery.artDialog.js?skin=default" type="text/javascript"></script> 
	<script language="javascript">
		var currentindex=1;//flash图片参数
		$(function(){
			//发送ajax请求,加载new.jsp信息
			$("#top").load("/common/head1.jsp?date="+Math.random());
			$("#foot").load("/common/foot1.html");
			$("#main").load("/main/exam.html?time="+Math.random());
			
		});
		function onOver(id){
		    document.getElementById(id).style.display = "none";
		} 
		function onMous(id){
		    document.getElementById(id).style.display = "block";
		}
</script>

<script type="text/javascript" src="http://www.rmexam.com/qqonline/jquery.js"></script>
<script src="http://www.rmexam.com/templets/default/js/jquery2.js" type=text/javascript></script>
<style type="text/css">
.float0831 {
	POSITION: fixed; TOP: 180px; RIGHT: 1px; _position: absolute
}
.float0831 A {
	COLOR: #00a0e9
}
.float0831 A:hover {
	COLOR: #ff8100; TEXT-DECORATION: none
}
.float0831 .floatL {
	POSITION: relative; WIDTH: 28px; FLOAT: left
}
.float0831 .floatL A {
	TEXT-INDENT: -9999px; DISPLAY: block; FONT-SIZE: 0px
}
.float0831 .floatR {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_bg[1].gif")
}
.float0831 .tp {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_bg[1].gif")
}
.float0831 .cn {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_bg[1].gif")
}
.float0831 .floatR {
	PADDING-BOTTOM: 15px; WIDTH: 130px; BACKGROUND-REPEAT: no-repeat; BACKGROUND-POSITION: -131px bottom; FLOAT: left; OVERFLOW: hidden
}
.float0831 .tp {
	BACKGROUND-REPEAT: no-repeat; BACKGROUND-POSITION: 0% 0%; HEIGHT: 10px
}
.float0831 .cn {
	BACKGROUND-REPEAT: repeat-y; BACKGROUND-POSITION: -262px 0px
}
.float0831 .cn H3 {
	TEXT-INDENT: -9999px; HEIGHT: 36px; FONT-SIZE: 0px
}
.float0831 .cn UL {
	PADDING-BOTTOM: 0px; PADDING-LEFT: 14px; PADDING-RIGHT: 14px; PADDING-TOP: 0px
}
.float0831 .cn UL LI {
	BORDER-BOTTOM: #e6e5e4 1px solid; LINE-HEIGHT: 36px; WORD-WRAP: break-word; HEIGHT: 36px; OVERFLOW: hidden; WORD-BREAK: normal
}
.float0831 .titZx {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .titDh {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .titDc {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .icoZx {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .icoTc {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .icoFf {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .icoTl {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .btnOpen {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .btnOpen_n {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .btnCtn {
	BACKGROUND: url("http://www.rmexam.com/qqonline/float_s[1].gif") no-repeat
}
.float0831 .titZx {
	BACKGROUND-POSITION: 5px -10px
}
.float0831 .titDh {
	BACKGROUND-POSITION: 5px -66px
}
.float0831 .titDc {
	BACKGROUND-POSITION: 5px -124px
}
.float0831 .icoZx {
	BACKGROUND-POSITION: 2px -154px
}
.float0831 .icoTc {
	BACKGROUND-POSITION: 0px -323px
}
.float0831 .icoFf {
	BACKGROUND-POSITION: 2px -213px
}
.float0831 .icoTl {
	PADDING-LEFT: 20px; DISPLAY: block; FONT-FAMILY: "微软雅黑"; BACKGROUND-POSITION: 2px -266px; FLOAT: left
}
.float0831 .btnOpen {
	BACKGROUND-POSITION: -30px -396px
}
.float0831 .btnOpen_n {
	BACKGROUND-POSITION: 0px -530px
}
.float0831 .btnCtn {
	BACKGROUND-POSITION: 0px -396px
}
.float0831 .icoZx {
	PADDING-LEFT: 28px; DISPLAY: block; FLOAT: left
}
.float0831 .icoTc {
	PADDING-LEFT: 28px; DISPLAY: block; FLOAT: left
}
.float0831 .icoFf {
	PADDING-LEFT: 28px; DISPLAY: block; FLOAT: left
}
.float0831 .btnOpen {
	POSITION: relative; WIDTH: 28px; HEIGHT: 118px; TOP: 80px; LEFT: 2px
}
.float0831 .btnOpen_n {
	POSITION: relative; WIDTH: 28px; HEIGHT: 118px; TOP: 80px; LEFT: 2px
}
.float0831 .btnCtn {
	POSITION: relative; WIDTH: 28px; HEIGHT: 118px; TOP: 80px; LEFT: 2px
}
.float0831 .btnOpen {
	TOP: 118px; LEFT: 1px
}
.float0831 .btnOpen_n {
	TOP: 118px; LEFT: 1px
}
.float0831 .btnCtn {
	TOP: 118px; LEFT: 2px
}
.float0831 UL LI H3.titDc A {
	WIDTH: 80px; DISPLAY: block; HEIGHT: 36px
}
.float0831 UL LI.qqtop {
	BORDER-BOTTOM: #ace5f9 1px solid
}
.float0831 UL LI.bot {
	BORDER-BOTTOM-STYLE: none
}
.float0831 UL.webZx {
	PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; WIDTH: 164px; PADDING-RIGHT: 0px; BACKGROUND: url("http://www.rmexam.com/qqonline/webZx_bg[1].jpg") no-repeat; HEIGHT: 

65px; PADDING-TOP: 0px
}
.float0831 UL LI.webZx-in {
	BORDER-BOTTOM-STYLE: none; PADDING-LEFT: 5px; HEIGHT: 50px; PADDING-TOP: 8px
}

</style>
</head>
<body>
<div class="top" id="top">
</div>
<div class="main" style="height:25px"><h2 style="color: white;font-size:20pt;font-family:黑体"><span style="float:left">住建部电教中心送教上门合作单位 </span>     
<span style="float:right">《建造师》杂志战略合作伙伴</span></h2></div>
<div class="loginStr" id="wxlogbox" style="height:249px;display:none;"></div>
<div class="logingc" id="wxregistbox" style="height:530px;display:none;"></div>
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
  <div id="cu3er_swf"></div>
  <div class="root"> 
  	<a href="/main/exam1011.html" target="_blank"><img src="/main/images/navlo06.png" /></a>
  	<a href="/main/exam1015.html" target="_blank"><img src="/main/images/navlo02.png" /></a> 
  	<a href="/main/exam1033.html" target="_blank" class="rootright"><img src="/main/images/navlo03.png" /></a>  
  <div style="clear:both;"></div>
  	<a href="/main/exam1047.html" target="_blank"><img src="/main/images/navlo04.png" /></a>
  	<a href="/main/exam1012.html" target="_blank"><img src="/main/images/navlo05.png" /></a>
  	<a href="/main/exam1002.html" target="_blank" class="rootright"><img src="/main/images/navlo01.png" /></a> 
  <div style="clear:both;"></div>
  </div>
</div>
</div>
<div class="main" id="main">
</div>
<div id="foot"></div>

<script language="JavaScript">

 setTimeout("xianshi()",5000); 
 setTimeout("yincang()",15000); 
 function xianshi(){
   document.getElementById('ShowAD1').style.display="block";
   document.getElementById('ShowAD').style.display="block";
   
 }
 
 function yincang(){
   document.getElementById('ShowAD1').style.display="none";
   document.getElementById('ShowAD1x').style.display="block";
   
   document.getElementById('ShowAD').style.display="none";
   document.getElementById('ShowADx').style.display="block";
 }
 
function MM_showHideLayers() 
{
var i,p,v,obj,args=MM_showHideLayers.arguments;
for (i=0; i<(args.length-2); i+=3) 
if ((obj=document.getElementById(args[i]))!=null)
      { v=args[i+2];
         if (obj.style) 
        { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
         obj.visibility=v;
       }
}

</script>

		
<div  style="float: right;margin-right: 180px"><script src="http://s19.cnzz.com/stat.php? id=5456201&web_id=5456201" language="JavaScript"></script> 

&nbsp;&nbsp;<script language="javascript" type="text/javascript"  src="http://js.users.51.la/15961317.js"></script><noscript><a href="http://www.51.la/?15961317"  

target="_blank"><img  alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;"  src="http://img.users.51.la/15961317.asp" style="border:none"  

/></a></noscript></div></body>
</html>
