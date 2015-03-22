<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>密码重置 - 网校学习中心</title>
<link href="../images/User.css" type="text/css" rel="stylesheet" id="mainStyle"/>
<script src="/js/jquery-1.4.3.js" type="text/javascript"></script>
<script src="/js/checkRegister.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		//focus input得到焦点，提示输入内容要求
		$("#pwd").focus(
			function(){
				$("#pwdInfo").html("<p class='warn'> 6-20位(数字字母下划线)</p>");
				});
		$("#pwd2").focus(
			function(){
				$("#pwd2Info").html("<p class='warn'> 请再输入一次上面的密码</p>");
				});
		//提交
		
		$("#resetPwd").click(function(){
			if(checkAll()){$("#form").submit();};
		});
	});
	function checkAll()
	{
		return checkPassword($("#pwd"),$("#pwdInfo"))&checkRepeatPwd($("#pwd"),$("#pwd2"),$("#pwd2Info"));
	}
</script>
</head>
<body>
<div id="headWrap">
	<h1 id="logo"><a href="http://www.youeclass.com" title="网校系统 会员注册">&quot;网校会员中心</a></h1>
</div>
<div id="mainWrapper">
	<div class="pageTit">
		<h2>密码重置</h2>
		<p class="desc"></p>
 	</div>
  	<div class="W_reg_info clearfix" id="pl_account_reg">
  		<form action="/user/resetAction" method="post" id="form">
  		<div class="W_reg_form">
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>用 户 名：</div>
                <div class="inp">
                    <input id="username" type="text" class="W_input" value="${username }" disabled="disabled" onblur='checkUsername($("#username"),$("#usernameInfo"),"/user/checkUsername");'/>
                    <input name="username" type="hidden" value="${username}"/>
                </div>
                <div class="tips" id="usernameInfo"></div>
            </div>
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>登录密码：</div>
                <div class="inp">
                  <input action-data="" id="pwd" name="password" type="password" class="W_input" value="" onblur='checkPassword($("#pwd"),$("#pwdInfo"));'/>
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
            <div class="info_submit clearfix">
                <div class="inp">
                    <a action-type="btn_submit" class="W_btn_big" href="javascript:void(0);" id="resetPwd"><span>重置密码</span></a>
                </div>
            </div>
        </div>
        </form>
   </div>
</div>
   <div class="footer clearfix">
  		<p>Copyright &copy; 2006 - 2013 www.youeclass.com All Rights Reserved</p>
   </div>
</body>
</html>
