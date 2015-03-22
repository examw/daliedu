<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学员登录 网校系统</title>
<link href="../images/User.css" type="text/css" rel="stylesheet" id="mainStyle"/>
<script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#username").focus(
			function(){
				$("#usernameInfo").html("<p class='warn'>请输入用户名</p>");
				});
		$("#password").focus(
			function(){
				$("#pwdInfo").html("<p class='warn'>请输入密码</p>");
				});
		$("#login").click( function(){
			formSubmit();
		});
		//绑定键盘事件
		$('input').keydown(function(event){
         	if(event.keyCode==13||event.keyCode==108)
         	{
         		formSubmit();
         	}
        });
	});
	function checkNull(input,span)
	{
		if(input.val().length==0)
		{
			span.html("<p class='error'>不能为空</p>");
		}else
		{
			span.html("");
		}
	}
	function formSubmit()
	{
		if(!$("#username").val()||!$.trim($("#username").val()))
			{
				$("#usernameInfo").html("<p class='error'>请输入用户名</p>");
				return;
			}
			if(!$("#password").val()||!$.trim($("#password").val()))
			{
				$("#pwdInfo").html("<p class='error'>请输入密码</p>");
				return;
			}
			$("#usernameInfo").html("");
			$("#pwdInfo").html("");
			$.ajax({
				async:true,
				type:"post",
				url:"../user/login",
				data:{"username":$("#username").val(),"password":$("#password").val()},
				dataType:'json',
				success:function(data){
					if(data)
					{
						if("${lastUrlForUser}") location="${lastUrlForUser}"; //被拦截的登录地址，不为空返回上一个页面
						else location='/member/center';
					}else
					{
						$("#pwdInfo").html("<p class='error'>用户名或密码错误</p>");
					}
				},
				error:function(){alert("系统错误");}
			});		
	}
</script>
</head>
<body>
<script type="text/javascript">
if("${student.stuUsername}")
		{
			location = '/member/center';
}
</script>
<div id="headWrap">
	<h1 id="logo"><a href="http://www.youeclass.com" title="学员登录 网校系统">网校会员中心</a></h1>
</div>
<div id="mainWrapper" style="height:430px;">
	<div class="pageTit">
		<h2>登录您的网校学习中心</h2>
 	</div>
  	<div class="W_reg_info clearfix" id="pl_account_reg">
  		<div class="W_reg_form">
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>用 户 名：</div>
                <div class="inp">
                    <input id="username" name="username" type="text" class="W_input" value="${cookie.eschool_user.value}" onblur="checkNull($('#username'),$('#usernameInfo'));"/>
                </div>
                <div class="tips" id="usernameInfo"></div>
            </div>
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>登录密码：</div>
                <div class="inp">
                  <input name="password" id="password" type="password" class="W_input" value="" onblur="checkNull($('#password'),$('#pwdInfo'));"/>
              </div>
              <div node-type="password_tip" class="tips" id="pwdInfo"></div>
            </div>
            <div class="">
                <div class="inp" style="margin-left:100px">
                	<a style="margin-left:160px" href='../user/findpwd.jsp'>忘记密码？</a>
              </div>
              <div node-type="password_tip" class="tips" id="pwdInfo1"></div>
            </div>
            <div class="info_submit clearfix">
                <div class="inp">
                    <a class="W_btn_big" href="javascript:void(0); "id="login" ><span>登录</span></a>
                </div>
            </div>
        </div>
       <div class="W_reg_sidebar">
                <p class="p1 line">还没有学习帐号？</p>
                <p class="p2" align="center"><input id="loginbtn" value="立即注册" type="button" onclick="location='../user/register.jsp'"></p>
       </div>
<!--        <div class="Blank">
       		<p>您也可以通过以下方式登录</p>
       		<p><a href="javascript:void(0)"><img src="../images/login_connect_1.png" border="0" width="120" height="24" /></a><a href="javascript:void(0)"><img src="../images/login_connect_2.png" border="0" width="120" height="24" /></a></p>
       </div> -->
   </div>
</div>
   <div class="footer clearfix">
  		<p>Copyright &copy; 2006 - 2013 www.youeclass.com All Rights Reserved</p>
   </div>
</body>
</html>
