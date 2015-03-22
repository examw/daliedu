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
        var money = $("#txtMoney").val();
        if (!name||!$.trim(name))
        {
        	error("lblMsg","请输入学习卡号!");
        	return false;
        }
        if (/^[0-9A-Za-z]+[-]?[0-9]*$/.test(name) == false)
        {
        	error("lblMsg","请输入正确的学习卡号!");
        	return false;
        }
        if (!pass||!$.trim(pass))
        {
        	error("lblMsg","请输入学习卡密码!");
        	return false;
        }
        if(!money||!$.trim(money)||!/^[0-9]{1,5}$/.test(money))
        {
        	error("lblMsg","请认真输入金额");
        	return false;
        }
        if(Number(money)<0)
        {
        		
        		return false;
        }
       	error("lblMsg","正在充值中...");
        $.ajax({
        	aysnc:true,
        	type:"POST",
        	url:"../member/recharge",
        	data:{"cardNo":name,"cardPwd":pass,"money":Number(money)},
        	dataType:"json",
        	success:function(data)
        	{
        		if(data>0)
        		{
        			//充值成功
        			alert("充值成功,您刚刚充值了"+data+"元到了您的账户");
        			window.location.reload();
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
        			error("lblMsg","该学习卡属于赠送类型,一人一次,您已经使用过这种类型");return;  
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
    function find()
    {
    	var name = $("#txtSelCardNum").val();
        var pass = $("#txtSelCardPass").val();
        if (!name||!$.trim(name))
        {
        	error("lblCardMoney","请输入学习卡号!");
        	return false;
        }
        if (/^[0-9A-Za-z]+[-]?[0-9]*$/.test(name) == false)
        {
        	error("lblCardMoney","请输入正确的学习卡号!");
        	return false;
        }
        if (!pass||!$.trim(pass))
        {
        	error("lblCardMoney","请输入学习卡密码!");
        	return false;
        }
       	error("lblCardMoney","正在查询中...");
        $.ajax({
        	aysnc:true,
        	type:"POST",
        	url:"../member/findCardBalance",
        	data:{"cardNo":name,"password":pass},
        	dataType:"json",
        	success:function(data)
        	{
        		if(data)
        		{
        			//查询成功
        			$("#lblCardMoney").html("面值："+Number(data.cardValue).toFixed(2)+";余额："+Number(data.cardBalance).toFixed(2));
        			return;
        		}else
        		{
        			$("#lblCardMoney").html("卡号或密码错误");
        		}
        	},
        	error:function()
        	{
        		alert("系统错误");
        	}
        });
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
	<li id="xz">学习卡充值</li>
	<li><a href="../memberCenter/cashRecharge.jsp">现金券充值</a></li>
	<li><a href="../member/tradeList">充值记录</a></li>
</ul>
</span>
</h1>
  <div class="ListContent TopBorder" id='listContent' style="width:540px">
  <div class="ctt_nqq center">
                        <span class="ctt_tishi">当前学习卡账户余额：<em><span id=
                        "ctl00_cp1_lblRemainMoney"><fmt:formatNumber value="${student.stuCard}" pattern="#,##0.00" /></span> 元&nbsp;</em><br>
                        当前现金账户余额：<em><span id=
                        "ctl00_cp1_lblExamMoney"><fmt:formatNumber value="${student.stuCash}" pattern="#,##0.00" /></span> 元&nbsp;</em>
                        请按下列提示进行充值。<br><br>
                        <span style="color: red;font-size:12px;padding-top:15px]">注：赠送类型的学习卡是一次性充值完毕的，与输入金额无关。</span>
                        </span>
                      <span class="ctt_cz">
                		<dl>
                    <dt>请输入学习卡卡号</dt>
                    <dd class="cz_dda">请输入学习卡密码</dd>
                    <dd class="cz_ddb">请输入充值金额</dd> 
                </dl>
                <dl>
                    <dt><input name="ctl00$cp1$txtCardNum" type="text" id="txtCardNum" class="cz_input" style="width:246px;padding-left:5px;" /></dt>
                                
                    <dd class="cz_dda"><input name="ctl00$cp1$txtCardPass" type="password" id="txtCardPass" class="cz_input" style="width:120px;padding-left:5px;" /></dd>
                    <dd class="cz_ddb"><input name="ctl00$cp1$txtMoney" type="text" id="txtMoney" class="cz_input" style="width:80px;padding-left:5px;" /></dd>
               </dl>
                	<span><label id="lblMsg"></label>
                	<input type="image" name="ctl00$cp1$ibnRecharge" id="ibnRecharge" align="absmiddle" src="../images/pic_012.gif" onclick="recharge();" style="height:25px;width:98px;" /></span>
                	</span>
                	<!--  -->
                	<h2>学习卡余额查询</h2>
                <span class="cz_sp">
                    <dl>
                    <dt>请输入学习卡卡号</dt>
                    <dd class="cz_dda">请输入学习卡密码</dd>
                               
                </dl>
                <dl>
                    <dt><input name="ctl00$cp1$txtSelCardNum" type="text" id="txtSelCardNum" class="cz_input" style="width:246px;padding-left:5px;" /></dt>
                                
                    <dd class="cz_dda"><input name="ctl00$cp1$txtSelCardPass" type="password" id="txtSelCardPass" class="cz_input" style="width:138px;padding-left:5px;" /></dd>
                    <dd class="cz_ddb" style="padding-top:2px;padding-left:10px;"><input type="image" name="ctl00$cp1$ibnSeeMoney" id="ctl00_cp1_ibnSeeMoney" src="../images/pic_013.gif" onclick="find()" /></a></dd>
                </dl>
                    <span id="lblCardMoney" style="clear:both;display:block;color:Red;margin-left:100px;padding-top:5px;"></span>
                    <span id=""></span>
                </span>
                	
                    </div>
                </div>
  </div>
</div>
<div class="RightList" style="width:120px">
	<span class="tishi center" style=
            "margin-top:10px;"><strong>温馨提示：</strong><br>
            1、多张学习卡可以连续充值；<br>
            2、充值的金额可以支付本次购买后，请点下一步完成支付；<br>
            3、请在正规网点购买学习卡，以 免受骗；<br>
            4、赠送类型的学习卡限制一人只能使用一次，并且一次性充值完毕，与输入金额无关。</span>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
