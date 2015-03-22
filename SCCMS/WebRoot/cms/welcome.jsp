<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script>
<title>welcome</title>
<style>
.l-div-welcome{margin-top:10px}
.aaa {
    cursor: pointer;
    display: block;
    height: 24px;
    line-height: 24px;
    padding-left: 24px;
    position: relative;
    text-align: left;
    width:50px;
    background: url("../images/controls/btn.gif") repeat-x scroll 0 0 #E0EDFF;
}
.aaa:hover{
	color:red;
}
</style>
</head>

	
<body>
	<div class="l-div-welcome" >欢迎进入系统管理,请谨慎操作！！</div>
	<div class="l-div-welcome" >${admin.admUsername },<span id="labelwelcome"></span></div>
	<div class="l-div-welcome" >您上次登录时间：<s:date name="#session.lastLoginTime" format="yyyy-MM-dd HH:mm:ss"></s:date></div>
	<div class="l-div-welcome" >您的登录次数：${admin.admLoginNumbers }</div>
	<div style="margin-top:30px; padding:10px;border:#ccc solid 1px" >
		<div class="l-div-welcont" ><a class="aaa" onclick="getCount()" >刷新</a></div>
		<div class="l-div-welcome" >网站在线人数：<span id="onlineCount"></span></div>
		<div class="l-div-welcome" >视频在线人数：<span id="courseOnline"></span></div>
	</div>
</body>
<script type="text/javascript">
	 var now = new Date(), hour = now.getHours();
     if (hour > 4 && hour < 6) { $("#labelwelcome").html("凌晨好！") }
     else if (hour < 9) { $("#labelwelcome").html("早上好！") }
     else if (hour < 12) { $("#labelwelcome").html("上午好！") }
     else if (hour < 14) { $("#labelwelcome").html("中午好！") }
     else if (hour < 17) { $("#labelwelcome").html("下午好！") }
     else if (hour < 19) { $("#labelwelcome").html("傍晚好！") }
     else if (hour < 22) { $("#labelwelcome").html("晚上好！") }
     else { $("#labelwelcome").html("夜深了，注意休息！") }
     function getCount(){
    	 $("#onlineCount").html("刷新中...");
		 $("#courseOnline").html("刷新中...");
    	 $.ajax({
    		 type:"POST",
    		 url:"http://localhost:8080/system/onlineCount",
    		 dataType:"json",
    		 success:function(data){
    			 $("#onlineCount").html(data.onlineCount);
    			 $("#courseOnline").html(data.courseOnline);
    		 }
    	 });
     }
     $(function(){
    	getCount();
     });
</script>
</html>
