<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>优异网校会员中心</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<link type="text/css" rel="stylesheet" href="../css/Pager.css" />
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript" src="../js/jquery.pager.js"></script>
<script type="text/javascript">
	
	$(function(){
			//发送ajax请求,加载new.jsp信息
			$("#lessionList").html("正在加载中......");
			$("#lessionList").load("/member/lessionList?stuId="+'<s:property value="#session.student.stuId"/>'+"&random="+Math.random());
	}); 
	var MyPackageIDCookie,MyGradeIDCookie;
	$(function(){
		MyPackageIDCookie = getCookie('package');
		MyGradeIDCookie = getCookie('grade');
		var  myPackage= MyPackageIDCookie.split(",");
		var myGrade=MyGradeIDCookie.split(",");
		var length;
		if(MyPackageIDCookie==""&&MyGradeIDCookie!=""){
			length =myGrade.length;
		}else if(MyPackageIDCookie!=""&&MyGradeIDCookie==""){
			length =myPackage.length;
		}else{
			length =myPackage.length+myGrade.length;
		}
		if(MyPackageIDCookie==""&&MyGradeIDCookie==""){
			$("#cartList").html("<em><a href=\"../member/courseCenter\" target=\"_blank\">立即选课>></a></em>您可以继续选课");
		}else{
			$("#cartList").html("<em><a href=\"../cart/cartList\">立即支付>></a></em>购物车有&nbsp;(&nbsp;<font color=\"#FF0000\">"+length+"</font>&nbsp;)&nbsp;门课程未支付");
		} 
	});
	$(function(){
		$.ajax({
			async:true,
			type:'POST',
			url:'../member/checkIsSendNoAddr',
			dataType:'json',
			success:function(data)
			{
				if(data)
				{
					var r=confirm("您有订单有赠送教材的,尚未填写送货地址,立即填写");
  					if (r==true)
    				{
						location="../member/loadAddrForSend?sid="+data.sendId;
    				}
    			}
			}
		});
	});
function getCookie(name) {
	var cookieValue = "";
	var search = name + "=";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1) end = document.cookie.length;
			cookieValue = unescape(document.cookie.substring(offset, end));
		};
	}
	return unescape(cookieValue);
}
</script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<ul>
<li id="memberleft">
<dl>
<dt><a href="#"><img src="../upload/userface/no_face.gif"  onerror="this.src='../upload/userface/no_face.gif'" width="125" height="125" /></a></dt>
<dd class="dd01">
<h2>欢迎您<s:property value="#session.student.stuUsername"/>优异网校祝您学习愉快！</h2>
<span class="pcdt_xx">我的学号：<em><s:property value="#session.student.stuId"/></em></span>
<span class="pcdt_xx">我的学分：<em><s:property value="#session.student.stuScore"/></em></span>
<span class="pcdt_xxa" id="cartList" >
</span>
</dd>
</dl>
<!-- <span class="pcdt_xxb">
<span>系统消息：<a href="#"><b>0</b></a></span>
<span>学习提醒：<a href="#"><b>1</b></a></span>
<span>答疑回复：<a href="#"><b>1</b></a></span>
</span> -->
</li>
<li id="memberright">
<div class="diva_right_a center">
<span>
<em><a href="../memberCenter/recharge.jsp">充值</a></em>
学习卡账户余额 <var style="font-weight:bold">￥<fmt:formatNumber value="${student.stuCard}" pattern="#,##0.00" /></var>
</span>
<span>
现金账户余额 <var style="font-weight:bold">￥<fmt:formatNumber value="${student.stuCash}" pattern="#,##0.00" /></var>
</span>
</div>
</li>
</ul>
<div style="clear:both"></div>
<div class="banner"><img src="../images/0.jpg" width="718" height="91" /></div>
<div class="lessionList" id="lessionList">

</div>
<div style="clear:both"></div>
<div class="NewsList">
<span class="NewsTop">
<ul>
<li id="layer2">网校动态</li>
</ul>
</span>
<ul class="NewsUl" id="newsUl">
<li><dl><dt><b>&middot;</b> <a href="news.jsp">2013年辽宁注册建筑师人员名单（第83批）</a></dt><dd>8分钟前</dd></dl></li>
</ul>
<div id="pager" ></div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
<script type="text/javascript">	
	function ajaxNews(page)
	{
		$.ajax({
			async:true,
			url:"/member/newsList",
			data:{"page":page},
			dataType:"json",
			success:function(map){
				$("#newsUl").html("");
				 PageClick = function(pageclickednumber) {
			           ajaxNews(pageclickednumber);
			    };
				$("#pager").pager({ pagenumber: 1, pagecount: Math.ceil(map.total/10), buttonClickCallback: PageClick });
				var data = map.newsList;
				for(var i=0;i<data.length;i++)
				{
					$("#newsUl").append("<li><dl><dt><b>&middot;</b> <a href='/member/news?id="+data[i].id+"'>"+data[i].title+"</a></dt><dd>"+data[i].addtime+"</dd></dl></li>");
				}
			}
		});
	}
	$(function(){
		ajaxNews(1);
	});
</script>
</html>
