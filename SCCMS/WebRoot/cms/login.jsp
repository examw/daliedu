<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server"> 
    <title></title>
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-dialog.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/dialog.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/common.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/aes-min.js" type="text/javascript"></script>
    <style type="text/css">
        *{ padding:0; margin:0;}
        body{ text-align:center; background:#4974A4;}
        #login{ width:740px; margin:0 auto; font-size:12px;}
        #loginlogo{ width:700px; height:100px; overflow:hidden; background:url('${pageContext.request.contextPath}/cms/images/login/logo.jpg') no-repeat; margin-top:50px;   }
        #loginpanel{ width:729px; position:relative;height:300px;}
        .panel-h{ width:729px; height:20px; background:url('${pageContext.request.contextPath}/cms/images/login/panel-h.gif') no-repeat; position:absolute; top:0px; left:0px; z-index:3;}
        .panel-f{ width:729px; height:13px; background:url('${pageContext.request.contextPath}/cms/images/login/panel-f.gif') no-repeat; position:absolute; bottom:0px; left:0px; z-index:3;}
        .panel-c{ z-index:2;background:url('${pageContext.request.contextPath}/cms/images/login/panel-c.gif') repeat-y;width:729px; height:300px;}
        .panel-c-l{ position:absolute; left:60px; top:40px;}
        .panel-c-r{ position:absolute; right:20px; top:50px; width:222px; line-height:200%; text-align:left;}
        .panel-c-l h3{ color:#556A85; margin-bottom:10px;}
        .panel-c-l td{ padding:7px;} 
        .login-text{ height:24px; left:24px; border:1px solid #e9e9e9; background:#f9f9f9;}
        .login-text-focus{ border:1px solid #E6BF73;}
        .login-btn{width:114px; height:29px; color:#E9FFFF; line-height:29px; background:url('${pageContext.request.contextPath}/cms/images/login/login-btn.gif') no-repeat; border:none; overflow:hidden; cursor:pointer;}
        #txtUsername,#txtPassword{ width:191px;} 
        #logincopyright{ text-align:center; color:White; margin-top:50px;}
    </style>
    <script type="text/javascript">
        $(function ()
        {
        	if($("#txtUsername").val()!="${cookie.sccms_user.value}"){
        		$("#txtPassword").val("");
        	}
            $(".login-text").focus(function ()
            {
                $(this).addClass("login-text-focus");
            }).blur(function ()
            {
                $(this).removeClass("login-text-focus");
            });

            $(document).keydown(function (e)
            {
                if (e.keyCode == 13)
                {
                    dologin();
                }
            });
			
            $("#btnLogin").click(function ()
            {
                dologin();
            });
			changeUsername = function(obj){
				var username = "${cookie.sccms_user.value}";
				if($(obj).val()!=username){
					if($("#txtPassword").val()=="${cookie.sccms_token.value}")
					$("#txtPassword").val("");
				}
			};

            function dologin()
            {
                var username = $("#txtUsername").val();
                var password = $("#txtPassword").val();
                $("#txtUsername").blur();
                if (username == "")
                {
                    alert('账号不能为空!');
                    $("#txtUsername").focus();
                    return;
                }
                if (password == "")
                {
                    alert('密码不能为空!');
                    $("#txtPassword").focus();
                    return;
                }
                var reg = /^[A-Za-z0-9]+$/;
                if(!reg.test(username)||username.length<2||username.length>32){
                	alert('帐号不合法');
                	$("#txtUsername").focus();
                    return;
                }
                var pwd = /^[0-9a-zA-Z_]+$/;
                if(!pwd.test(password)||password.length<6){
                	alert('密码不合法');
                	$("#txtPassword").focus();
                    return;
                }
                $.ajax({
                    type: 'post', cache: false, dataType: 'json',
                    url: '${pageContext.request.contextPath}/system/login',
                    data: {"username":username,"password":password,"rememberMe":$("#rememberMe").attr("checked")},
                    success: function (result)
                    {
                        if (!result)
                        {
                            alert('登陆失败,账号或密码有误!');
                            $("#txtUsername").focus();
                            return;
                        } else
                        {
                            location.href = "${pageContext.request.contextPath}/system/main";
                        }
                    },
                    error: function ()
                    {
                        alert('发送系统错误,请与系统管理员联系!');
                    },
                    beforeSend: function ()
                    {
                        $.ligerDialog.waitting("正在登陆中,请稍后...");
                        $("#btnLogin").attr("disabled", true);
                    },
                    complete: function ()
                    {
                        $.ligerDialog.closeWaitting();
                        $("#btnLogin").attr("disabled", false);
                    }
                });
            }
        });
    </script>
</head>
<body style="padding:10px"> 
    <div id="login">
        <div id="loginlogo"></div>
        <div id="loginpanel">
            <div class="panel-h"></div>
            <div class="panel-c">
                <div class="panel-c-l">
                   
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                         <tr>
                            <td align="left" colspan="2"> 
                             <h3>请使用网校平台管理系统账号登陆</h3>
                            </td>
                            </tr> 
                            <tr>
                            <td align="right">账号：</td><td align="left"><input type="text" name="loginusername" id="txtUsername" class="login-text" value="${cookie.sccms_user.value}" onblur="changeUsername(this);"/></td>
                            </tr>
                            <tr>
                            <td align="right">密码：</td><td align="left"><input type="password" name="loginpassword" id="txtPassword" class="login-text" value="${cookie.sccms_token.value}"/></td>
                            </tr> 
                            <tr>
                            <td align="center" colspan="2">
                            	<label style="margin-right:50px"><input type="checkbox" id="rememberMe" checked="checked"/>记住密码</label>
                                <input type="submit" id="btnLogin" value="登陆" class="login-btn" />
                            </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="panel-c-r">
                <p>请从左侧输入登录账号和密码登录</p>
                <p>如果遇到系统问题，请联系网络管理员。</p>
                <p>如果没有账号，请联系网站管理员。 </p>
                <p>......</p>
                </div>
            </div>
            <div class="panel-f"></div>
        </div>
         <div id="logincopyright">Copyright © 2012 C.H. </div>
    </div>
</body>
</html>
