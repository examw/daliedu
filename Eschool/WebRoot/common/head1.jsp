<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<link rel="stylesheet" type="text/css" href="/common/images/common.css">
<script  type="text/javascript">
   //登录
 	function ShowLogin(){
		$("#wxlogbox").load("/common/login.jsp");
		var loginbox = art.dialog({ id: "loginbox", content: $("#wxlogbox")[0], lock: true, padding: 10, opacity: 0.5,top:'20%', fixed: true, title: "登录网校" });
		return false;
    }
   
    //注册
   function showRegbox(){
		$("#wxregistbox").load("/common/regist.jsp");
		var wxregistbox = art.dialog({ id: "wxregistbox", content: $("#wxregistbox")[0], lock: true, padding: 5,top:'20%', width:'800px',opacity: 0.5, fixed: true, title: "注册网校" });
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
    <div class="logo"><a href="/"><img src="/common/images/logo1.png"  alt="优异网校"/></a></div>
    <div class="nav1">
      <ul>
        <li style="background:none;"><a href="/main/main?examId=1011" target="_blank">一级建造师</a></li>
        <li><a href="/main/exam1015.html" target="_blank">造价工程师</a></li>
        <li><a href="/main/exam1013.html" target="_blank">MBA</a></li>
        <li><a href="/main/exam1033.html" target="_blank">安全工程师</a></li>
        <li><a href="/main/exam1054.html" target="_blank">考研英语二</a></li>
      </ul>
    </div>
    <s:if test="#session.student!=null">
    	<div class="lgjg"><a href="/member/center" ><strong><s:property value="#session.student.stuUsername"/></strong></a>,您好! &nbsp;  <a href="/member/center" >个人中心</a> <a href="javascript:;" onclick="loginOut();">退出</a></div>
    </s:if>
    <s:else> 
    	<div class="login"  id="logintop"> <a id="registbox" onclick="showRegbox();" title="注册网校会员" href="javascript:;"><img src="/common/images/zhuce.gif"/></a> 　<a id="loginbox" onclick="ShowLogin();" title="登录网校" href="javascript:;"><img src="/common/images/denglu.gif"/></a> </div>
   </s:else>
    <div class="clear"></div>
  	</div>
