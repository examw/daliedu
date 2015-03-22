<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta http-equiv="Refresh"
content="5;url=/main/main" > -->
<link href="../images/User.css" type="text/css" rel="stylesheet" id="mainStyle"/>
<script src="/js/jquery-1.4.3.js" type="text/javascript"></script>
<script>
	var time = 4;
	var timer = null;
	$(function(){
		timer=setInterval(function(){
				document.getElementById("timer").innerHTML=time--;
				if(time==0)
				{
					clearInterval(timer);
					location="${addr}";
					return;
				}
			},1000);
	});
</script>
</head>

<body>

<div id="headWrap">
	<h1 id="logo"><a href="http://www.youeclass.com" title="网校系统 会员注册">网校会员中心</a></h1>
</div>
<div id="mainWrapper">
	<div class="pageTit">
		<h2>密码重置</h2>
		<p class="desc"></p>
 	</div>
  	<div class="W_reg_info clearfix" id="pl_account_reg">
  		<div class="W_reg_form">
  			<div><h1 style="font-size:14px;">${stu.stuUsername} &nbsp;恭喜， 操作成功</h1></div>
				<div style="margin-top:20px;font-size:14px;">
				<p>系统将在 5 秒后跳转到验证界面。<span id="timer" >5</span>
				</p>
				</div>
		<div style="margin-top:20px;font-size:14px;">
			<p>如果超过 5 秒后您仍然看到本消息，请点击链接。<a href="${addr }"><b>猛击这里</b></a></p>
		</div>
  		</div>
  		</div>
  		</div>
   <div class="footer clearfix">
  		<p>Copyright &copy; 2006 - 2013 www.youeclass.com All Rights Reserved</p>
   </div>
</body>
</html>

