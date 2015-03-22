<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery-1.4.3.js" type="text/javascript"></script>
<link href="../images/User.css" type="text/css" rel="stylesheet" id="mainStyle"/>
<script src="/js/checkRegister.js" type="text/javascript"></script>

<script src="../js/jquery.quickflip.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$(".quickflip-wrapper").quickFlip();
		//focus input得到焦点，提示输入内容要求
		$("#username").focus(
			function(){
				$("#usernameInfo").html("<p class='warn'> 4-20位(数字字母下划线)</p>");
				});
		$("#pwd").focus(
			function(){
				$("#pwdInfo").html("<p class='warn'> 6-20位(数字字母下划线)</p>");
				});
		$("#pwd2").focus(
			function(){
				$("#pwd2Info").html("<p class='warn'> 请再输入一次上面的密码</p>");
				});
		$("#name").focus(
			function(){
				$("#nameInfo").html("<p class='warn'> 请输入您的真实姓名</p>");
				});
		$("#mobile").focus(
			function(){
				$("#mobileInfo").html("<p class='warn'> 请再输入您的联系电话</p>");
				});
		/*
		*$("#email").focus(
			function(){
				$("#emailInfo").html("<p class='warn'> 请再输入您的邮箱地址</p>");
				});
		*/
		
		$("#deal").change(function(){
			if($("#deal").attr('checked')){$("#dealInfo").html("");}
		});
		//提交
		$("#register").click(function(){
			if(checkAll()){$("#form").submit();};
		});
		//////////////////////////////登录////////////////////
		$("#username1").focus(
			function(){
				$("#usernameInfo1").html("<p class='warn'>请输入用户名</p>");
				});
		$("#password1").focus(
			function(){
				$("#pwdInfo1").html("<p class='warn'>请输入密码</p>");
				});
		$("#login").click(function(){
			if(!$("#username1").val()||!$.trim($("#username1").val()))
			{
				$("#usernameInfo1").html("<p class='error'>请输入用户名</p>");
				return;
			}
			if(!$("#password1").val()||!$.trim($("#password1").val()))
			{
				$("#pwdInfo1").html("<p class='error'>请输入密码</p>");
				return;
			}
			$("#usernameInfo1").html("");
			$("#pwdInfo1").html("");
			$.post(
				"/user/login",
				{"username":$("#username1").val(),"password":$("#password1").val()},
				function(data){
					if(data)
					{
						if(!"${lastURI}") location="${lastURI}"; //被拦截的登录地址，不为空返回上一个页面
						location='../main/main';
					}else
					{
						$("#pwdInfo1").html("<p class='error'>用户名或密码错误</p>")
					}
				},'json'
				
			
			);		
		});
	});
	function checkAll()
	{
		return checkUsername($("#username"),$("#usernameInfo"),"/user/checkUsername")&checkPassword($("#pwd"),$("#pwdInfo"))&checkRepeatPwd($("#pwd"),$("#pwd2"),$("#pwd2Info"))&checkName($("#name"),$("#nameInfo"))&checkPhone($("#mobile"),$("#mobileInfo"))&checkDeal($("#deal"),$(dealInfo));//&checkEmail($("#email"),$("#emailInfo"),'/user/checkEmail');
	}
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
</script>
<style type="text/css">
</style>
<title>Insert title here</title>
</head>
<body>
<div id="headWrap">
	<h1 id="logo"><a href="http://www.youeclass.com" title="学员登录 网校系统">网校会员中心</a></h1>
</div>

<div id="mainWrapper" style="height:430px;">
	<div class="quickflip-wrapper">
	<div class="myclass">
	<div class="pageTit">
		<h2>立即注册网校</h2>
		<p class="desc">为方便我们能更好的为您提供服务，请您详细填写下列信息、您的信息我们不会透露给任何人。</p>
 	</div>
  	<div class="W_reg_info clearfix" id="pl_account_reg">
  		<form action="/user/register" method="post" id="form">
  		<div class="W_reg_form">
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>用 户 名：</div>
                <div class="inp">
                    <input id="username" name="stu.stuUsername" type="text" class="W_input" value="" onblur='checkUsername($("#username"),$("#usernameInfo"),"/user/checkUsername");'/>
                </div>
                <div class="tips" id="usernameInfo"></div>
            </div>
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>登录密码：</div>
                <div class="inp">
                  <input action-data="" id="pwd" name="stu.stuPassword" type="password" class="W_input" value="" onblur='checkPassword($("#pwd"),$("#pwdInfo"));'/>
              </div>
                <div class="tips" id="pwdInfo"></div>
            </div>
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>确认密码：</div>
                <div class="inp">
                    <input action-data="" name="rpasswd" id="pwd2" type="password" class="W_input" value="" onblur='checkRepeatPwd($("#pwd"),$("#pwd2"),$("#pwd2Info"));'/>
                </div>
                <div node-type="nickname_tip" class="tips" id="pwd2Info"></div>
            </div>
  <!--            <div class="info_list clearfix">
                <div class="tit">邮箱地址：</div>
                <div class="inp">
                    <input id="email" action-data="" name="stu.stuEmail" type="text" class="W_input" value="" onblur='checkEmail($("#email"),$("#emailInfo"),'/user/checkEmail');'/>
                </div>
                <div node-type="nickname_tip" class="tips" id="emailInfo"></div>
            </div> -->
            <div class="info_list clearfix">
                <div class="tit">真实姓名：</div>
                <div class="inp">
                    <input id="name" action-data="" name="stu.stuName" type="text" class="W_input" value="" onblur='checkName($("#name"),$("#nameInfo"));'/>
                </div>
                <div node-type="nickname_tip" class="tips" id="nameInfo"></div>
            </div>
            <div class="info_list clearfix">
                <div class="tit">联系电话：</div>
                <div class="inp">
                    <input action-data="" name="stu.stuMobile" id="mobile" type="text" class="W_input" value="" onblur='checkPhone($("#mobile"),$("#mobileInfo"));'/>
                </div>
                <div node-type="nickname_tip" class="tips" id="mobileInfo"></div>
                </div>
            <div class="info_submit clearfix">
                <div class="inp">
                    <a action-type="btn_submit" class="W_btn_big" href="javascript:void(0);" id="register"><span>立即注册</span></a>
                    <p><input type="checkbox" checked="checked" name="deal" id="deal">&nbsp;&nbsp;我已阅读并同意<a href="#" target="_blank">网校服务协议</a><br><a id="dealInfo" style="color:red;"></a></p>
                </div>
            </div>
        </div>
        </form>
       <div class="W_reg_sidebar">
                <p class="p1 line">已有帐号</p>
                <div class="quickFlipCta"><p class="p2" align="center"><input id="loginbtn" value="快速登录" type="submit" ></p></div>
       </div>
   </div>
</div>
	<div class="myclass">
	<div class="pageTit">
		<h2>登录您的网校学习中心</h2>
 	</div>
  	<div class="W_reg_info clearfix" id="pl_account_reg">
  		<div class="W_reg_form">
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>用 户 名：</div>
                <div class="inp">
                    <input id="username1" name="username" type="text" class="W_input" value="" onblur="checkNull($('#username1'),$('#usernameInfo1'));"/>
                </div>
                <div class="tips" id="usernameInfo1"></div>
            </div>
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>登录密码：</div>
                <div class="inp">
                  <input action-data="" name="password1" id="password1" type="password" class="W_input" value="" onblur="checkNull($('#password1'),$('#pwdInfo1'));"/>
              </div>
              <div node-type="password_tip" class="tips" id="pwdInfo1"></div>
            </div>
            <div class="">
                <div class="inp" style="margin-left:100px">
                	<a style="margin-left:160px" href='./findpwd.jsp'>忘记密码？</a>
              </div>
              <div node-type="password_tip" class="tips" id="pwdInfo"></div>
            </div>
            <div class="info_submit clearfix">
                <div class="inp">
                    <a action-type="btn_submit" class="W_btn_big" href="javascript:void(0); "id="login"><span>登录</span></a>
                </div>
            </div>
        </div>
       <div class="W_reg_sidebar">
                <p class="p1 line">还没有学习帐号？</p>
                <div class="quickFlipCta"><p class="p2" align="center"><input id="loginbtn" value="立即注册" type="submit" ></p></div>
       </div>
       <div class="Blank">
       		<p>您也可以通过以下方式登录</p>
       		<p><a href="javascript:void(0)"><img src="../images/login_connect_1.png" border="0" width="120" height="24" /></a><a href="javascript:void(0)"><img src="../images/login_connect_2.png" border="0" width="120" height="24" /></a></p>
       </div>
   </div>
</div>
</div>
</div>
<div style="margin-top:50px"></div>
<div class="footer clearfix">
  	<p>Copyright &copy; 2006 - 2013 www.youeclass.com All Rights Reserved</p>
</div>
</body>
</html>
