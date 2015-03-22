<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>答疑室登录</title>
<!-- <link href="../css/index.css" rel="stylesheet" type="text/css" /> -->
<style type="text/css">
#login {
    background: url("../images/login_bg.gif") repeat-x scroll center bottom transparent;
    height: 300px;
    margin: 0 auto;
    width: 500px;
}
.login_con {
    font-size: 13px;
    line-height: 40px;
    margin-bottom: 60px;
    margin-left: 50px;
    margin-top: 50px;
}
body {
    background: url("../images/bodybg.jpg") repeat-x scroll left top #F9F9F9;
    color: #000000;
    font: 12px "宋体",Lucida Grande,Verdana,Lucida,Arial,Helvetica,sans-serif;
    margin: 0;
    text-align: left;
}
div, li, td, th {
    font-size: 12px;
    line-height: 20px;
}
.myinput01 {
    border: 1px solid #78B2DA;
    height: 18px;
    line-height: 18px;
    width: 120px;
}
.yzm {
    background-color: #FFEDDF;
    border: 1px solid #78B2DA;
    color: #ACA899;
    height: 22px;
    text-align: center;
    width: 66px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript">
	function tchLogin()
	{
		var username = $("#username").val();
		var password = $("#password").val();
		if((!username||!$.trim(username))&&(!password||!$.trim(password)))
		{
			$("#info").html("用户名或密码不能为空");
			return;
		}
		$("#info").html("");
		$.ajax({
			async:true,
			type:"post",
			dataType:"json",
			url:"../question/teacherLogin",
			data:{"tchUsername":username,"password":password},
			success:function(data){
				if(data.ok){
					if(!data.lastUrlForTch)
					{
						window.location="../question/questionList";
					}else
						window.location=data.lastUrlForTch;
				}else
				{
					$("#info").html("用户名或密码错误");
				}
			},
			error:function(){ alert("系统错误");}
			
		});
	}
</script>
</head>
<body>
<div id="login">
	<div><img src="../images/login_t.gif" width="500" height="46" /></div>
	<div class="login_con">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="46%" height="45">用户名：
          <input type="text" name="username" id="username" class="myinput01"></td>
        <td colspan="2">密码：
          <input name="password" type="password" id="password" class="myinput01"></td>
        </tr>
      <tr>
        <td height="45">验证码：
          <input name="rnd" type="text" id="rnd" class="myinput01" /></td>
        <td width="20%"><div class="yzm">3127</div></td>
        <td width="34%"><label>
          <input type="image" name="imageField" src="../images/btn_ok01.gif" onclick="tchLogin();"/>
        </label></td>
      </tr>
      <tr>
      	<td colspan="2" style="color:red" id="info"></td>
      </tr>
      
    </table>
	</div>
</div>
</body>
</html>