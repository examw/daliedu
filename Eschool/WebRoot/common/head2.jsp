<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<link rel="stylesheet" type="text/css" href="/common/images/common.css">
<script src="/artDialog/jquery.artDialog.js?skin=default" type="text/javascript"></script>
 <script  type="text/javascript">
   //登录
 	function ShowLogin(){
		$("#wxlogbox").load("/common/login.jsp")
			var loginbox = art.dialog({ id: "loginbox", content: $("#wxlogbox")[0], lock: true, padding: 10, opacity: 0.5, fixed: true, title: "登录网校" });
			return false;
    }
   
    //注册
   function showRegbox(){
	$("#wxregistbox").load("/common/regist.jsp")
		var wxregistbox = art.dialog({ id: "wxregistbox", content: $("#wxregistbox")[0], lock: true, padding: 5, opacity: 0.5, fixed: true, title: "注册网校" });
		return false;
   }
   //退出
   function loginOut()
    {
    	$.ajax({
    		async:true,
    		type:"POST",
    		dataType:'json',
    		url:"/user/loginOut",
    		success:function(data)
    		{
    			if(data)
    			{
					location.reload();
    			}else
    			{
    				notice("登出失败",2,100);
    			}
    		},
    		error:function()
    		{
    			notice("系统异常",2,100);
    		}
    		
    	});
    }
   
 </script>
 <div class="harder">
   <div class="logo"><a href="/"><img src="/common/images/logo1.png" alt="优异网校"/></a></div>
    <s:if test="#session.student==null">
     <div class="login"  id="logintop"> <a id="registbox" onclick="showRegbox()" title="注册网校会员" href="javascript:;"><img src="images/zhuce.gif"/></a> 　<a id="loginbox" onclick="ShowLogin()" title="登录网校" href="javascript:;"><img src="images/denglu.gif"/></a> </div>
    </s:if>
    <s:else> 
   <div class="lgjg"><a href="#"><strong><s:property value="#session.student.stuUsername"/></strong></a>,您好! &nbsp;  <a href="/member/center" >个人中心</a> <a href="javascript:;" onclick="loginOut();">退出</a></div>
   </s:else>
    <div class="clear"></div>
  	</div>
