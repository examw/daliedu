<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回密码   网校系统</title>
<link href="../images/User.css" type="text/css" rel="stylesheet" id="mainStyle"/>
<script src="/js/jquery-1.4.3.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#email").focus(
			function(){
				$("#emailInfo").html("<p class='warn'>请输入邮箱</p>");
				});
		$("#findPwd").click(function(){
			if((checkEmail())!=1)
			{
				return;

			}else{
			$("#loadingGif").html("正在验证并发送邮件&nbsp;<img src='../images/loading_blue.gif' align='top'>&nbsp;");
			$.post(
				"/user/findPwd",
				{"email":$("#email").val()},
				function(data){
					if(data.ok)
					{
						$("#regForm").html("");
						var $div = $('<div class="tips" id="usernameInfo"><p class="warn">我们已经给您发了邮件，<a href="'+data.addr+'">立即查看</a></p></div>');
						$("#regForm").append($div);
					}else
					{
						$("#loadingGif").html("&nbsp;");
						$("#emailInfo").html("<p class='error'>没有该邮件地址信息</p>");
					}
				},'json'
			);	
			}	
		});
		
	});
	function checkEmail()
	{
		if (!$("#email").val() || !$.trim($("#email").val())) {
			$("#emailInfo").html("<p class='error'>Email不能为空</p>");
			return false;
		} else {
			var reg = /[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+/;
			if (!reg.test($("#email").val())) {
				$("#emailInfo").html("<p class='error'>Email不合法</p>");
				return false;
			}
			$("#emailInfo").html("<p class='succ'>&nbsp;</p>");
			return true;
			};
	}
</script>
</head>

<body>
<div id="headWrap">
	<h1 id="logo"><a href="http://wx.daliedu.com" title="学员登录 网校系统">网校会员中心</a></h1>
</div>
<div id="mainWrapper" style="height:430px;">
	<div class="pageTit">
		<h2>找回密码</h2>
 	</div>
  	<div class="W_reg_info clearfix" id="pl_account_reg">
  		<div class="W_reg_form" id="regForm">
            <div class="info_list clearfix">
                <div class="tit"><i>*</i>邮件地址：</div>
                <div class="inp">
                  <input action-data="" name="email" id="email" type="text" class="W_input" value="" onblur='checkEmail();'/>
              </div>
              <div node-type="password_tip" class="tips" id="emailInfo"></div>
            </div>
            <div class="">
                 	<span style="margin-left:100px" id="loadingGif">&nbsp;</span>
             <div node-type="password_tip" class="tips" id="pwdInfo1"></div>
            </div>
            <div class="info_submit clearfix" style="margin-top:10px">
                <div class="inp">
                    <a action-type="btn_submit" class="W_btn_big"  href="javascript:void(0); " id="findPwd"><span>下一步</span></a>

                </div>
            </div>
        </div>
       <div class="W_reg_sidebar">
                <p class="p1 line">还没有学习帐号？</p>
                <p class="p2" align="center"><input id="loginbtn" value="立即注册" type="button" onclick="location='../user/register.jsp'"></p>
                  <p class="p1 line">已有学习帐号？</p>
                <p class="p2" align="center"><input id="loginbtn" value="快速登录" type="button" onclick="location='../user/login.jsp'"></p>
       </div>
      <!--  <div class="Blank">
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
