<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>报名中心  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.pageclass{cursor:pointer}
	.kccon .kcb1 {
    background: none repeat scroll 0 0 #FF6633;
    color: #FFFFFF;
    float: left;
    font-weight: bold;
    text-align: center;
    padding:5px;
    margin-top:10px;
    margin-bottom:10px;
    width: 78px;
	}
	.kccon .kcb2 {
    color: #CCCCCC;
    font-size:14px;
    float: left;
	}
	.kccon .kcb2 a{text-decoration:none; padding:3px; margin:3px;}
</style>
<script language="javascript" src="../js/jquery-1.4.3.js"></script>
<script language="javascript">
	function CourseSelect(myid,type){
	//套餐cookie
	var MyPackageIDCookie = getCookie('package');
	//班级cookie
	var MyGradeIDCookie = getCookie('grade');
		if(type==0)
		{
			if(MyPackageIDCookie==''){
				setCookie('package',myid,15);
			}else{
				setCookie('package',MyPackageIDCookie+','+myid,15);
			}	
		}else
		{
			if(MyGradeIDCookie==''){
				setCookie('grade',myid,15);
			}else{
				setCookie('grade',MyGradeIDCookie+','+myid,15);
			}
		}
	}

	function setCookie(cookieName,cookieValue,DayValue) {
		var expire = "";
		var day_value=1;
		if (DayValue != null) {
			day_value=DayValue;
		}
		expire = new Date((new Date()).getTime() + day_value * 86400000);
		expire = "; expires=" + expire.toGMTString();
		document.cookie = cookieName + "=" + escape(cookieValue) +";path=/"+ expire;
	}

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
		
	
   $(function(){
	   $("#course_center").addClass("hhover");
	});
</script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="#">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">报名中心</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li ><a href="javascript:;">课程中心</a></li>
</ul>
</span>
</h1>
<div class="kctext"><img src="/main/images/kctext.jpg" width="718px"/></div>
  <div class="kccon">
    <ul><s:iterator value="list" var="exam" status="col">
      	<li style="margin-top:20px"><div class="kcb1"><a href="" target="_blank">${exam.examName}</a></div>
    	<div style="clear:both"></div>
        <div class="kcb2">
     	<s:iterator value="#exam.children" var="c" status="status">
     			<a href="/main/exam${c.examId}.html" >${c.examName}</a>　|	
     	</s:iterator>
  		</div>
  		</li></s:iterator></ul>
  </div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
