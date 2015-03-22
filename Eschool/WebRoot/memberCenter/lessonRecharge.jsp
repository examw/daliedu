<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>账户充值   我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<link type="text/css" rel="stylesheet" href="../images/recharge.css"></link>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript">
	$(function(){$("#recharge_").addClass("hhover")});
    function recharge() {
        var name = $("#txtCardNum").val();
        var pass = $("#txtCardPass").val();
        if (!name||!$.trim(name))
        {
        	error("lblMsg","请输入学习卡号!");
        	return false;
        }
        if (/^[0-9A-Za-z]+[-][0-9]+$/.test(name) == false)
        {
        	error("lblMsg","请输入正确的学习卡号!");
        	return false;
        }
        if (!pass||!$.trim(pass))
        {
        	error("lblMsg","请输入学习卡密码!");
        	return false;
        }
       	error("lblMsg","正在充值中...");
        $.ajax({
        	aysnc:true,
        	type:"POST",
        	url:"../member/lessonRecharge",
        	data:{"cardNo":name,"cardPwd":pass,"money":0},
        	dataType:"json",
        	success:function(data)
        	{
        		if(data>0)
        		{
        			//充值成功
        			alert("恭喜,你开通了补课课程");
        			window.location="../member/center?time="+new Date();
        			return;
        		}
        		if(data==0)
        		{
					error("lblMsg","卡号或密码输入有误");return;        		
        		}
        		if(data==-1)
        		{
        			error("lblMsg","该学习卡有效期已过");return;  
        		}
        		if(data<=-100)
        		{
        			error("lblMsg","充值金额大于余额,余额为："+Math.abs(Number(data+100)));return;  
        		}
        		if(data==-3)
        		{
        			error("lblMsg","该卡已被使用");return;  
        		}
        	},
        	error:function()
        	{
        		alert("系统错误");
        	}
        });
    }
    function error(id,msg) {
       	$("#"+id).html(msg);
        disappear(id,3);
        return false;
    }
    function disappear(id,second) {
        second = second ? second : 10;
        setTimeout("$('#"+id+"').html('')", 1000 * second);
    }
</script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList" style="width:568px">
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/recharge.jsp">账户充值

</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">学习卡充值</a></p>
<div class="List" style="width:568px">
<h1 class="ListTop" style="width:568px">
<span>
<ul>
	<li id="xz">补课卡充值</li>
</ul>
</span>
</h1>
  <div class="ListContent TopBorder" id='listContent' style="width:540px">
  <div class="ctt_nqq center">
                      <span class="ctt_cz">
                		<dl>
                    <dt>请输入补课卡卡号</dt>
                    <dd class="cz_dda">请输入补课卡密码</dd>
                </dl>
                <dl>
                    <dt><input name="ctl00$cp1$txtCardNum" type="text" id="txtCardNum" class="cz_input" style="width:246px;padding-left:5px;" /></dt>
                                
                    <dd class="cz_dda"><input name="ctl00$cp1$txtCardPass" type="password" id="txtCardPass" class="cz_input" style="width:120px;padding-left:5px;" /></dd>
               </dl>
                	<span><label id="lblMsg"></label>
                	<input type="image" name="ctl00$cp1$ibnRecharge" id="ibnRecharge" align="absmiddle" src="../images/pic_012.gif" onclick="recharge();" style="height:25px;width:98px;" /></span>
                	</span>
                	<!--  -->
                	
                    </div>
                </div>
  </div>
</div>
<div class="RightList" style="width:120px">
	<span class="tishi center" style=
            "margin-top:10px;"><strong>温馨提示：</strong><br>
            1、补课卡用于补充学习；<br>
            4、补课所补课程,只能学习其总数的三分之一</span>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
