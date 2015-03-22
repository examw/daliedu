<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!-- 添加会员的支付方式进行支付订单-->
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容窗口</title>
<style type="text/css"> 
<!--
.SearchBtnStyle {
	border: 1px solid #000000;
}
.menu {
	position:absolute;
	background: menu;
	border-top: 1px solid buttonhighlight;
	border-left: 1px solid buttonhighlight;
	border-bottom: 2px solid buttonshadow;
	border-right: 2px solid buttonshadow;
	padding: 2px;
	font: menu;
	cursor:default;
	font-size:9pt;
	width:90pt;
	visibility: hidden;
	z-index: 2;
	overflow: visible;
}
.menushow {
	position:absolute;
	visibility:visible;
	background:#EFEFEF;
	border-top: 1px solid #000000;
	border-left: 1px solid #000000;
	border-bottom: 1px solid #000000;
	border-right: 1px solid #000000;
	padding:0px;
	font: 9pt "menu";
	cursor:default;
	width:50pt;	
}
-->
</style>
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$('input:radio').click(function () {
				this.blur();
				this.focus();
		});
		$("input[name='mode']").change(
			function(){
			if($("#radio2").attr("checked"))
			{
				$("#showMoney").hide();
				$("#cash").attr("disabled",true);
				$("#card").attr("disabled",true);
			}else
			{
				$("#cash").attr("disabled",false);
				$("#card").attr("disabled",false);
				$("#showMoney").show();
			}});
	});
	function checkCard()
        {
        	var reg=/^\d+[.]?\d{0,2}$/g;
			if(!reg.test($.trim($("#card").val())))
			{
				$("#cardInfo").html("金额必须为数字且最多保留2位小数");
				return false;
			}else if(Number($("#card").val())>Number("${order.orderMoney-order.cashMoney }"))
			{
				$("#cardInfo").html("学习卡金额不能超过曾付金额？");
				return false;
			}
			$("#card").val(Number($("#card").val()).toFixed(2));
        	return true;
        }
        function checkCash()
        {
        	var reg=/^\d+[.]?\d{0,2}$/g;
			if(!reg.test($.trim($("#cash").val())))
			{
				$("#cashInfo").html("必须为数字且最多保留2位小数");
				return false;
			}else if(Number($("#cash").val())>Number("${order.cashMoney}"))
			{
				$("#cashInfo").html("现金金额不能超过曾付金额!");
				return false;
			}
			$("#cash").val(Number($("#cash").val()).toFixed(2));
        	return true;
        }
        function checkContent()
        {
        	if(!$.trim($("#content").val()))
        	{
        		$("#contentInfo").html("不能为空!");
        		return false;
        	}
        	return true;
        }
        function checkAll()
        {
        	if("${isAllowReturn}"=="1")
        	{
        		alert("发票已经寄送且尚未寄回,暂时不能退单");
        		return 0;
        	}
        	return checkCard()&checkCash()&checkContent();
        }
</script>
</head>
<body topmargin="2" leftmargin="2" bgcolor="#FFFFFF">
 
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
  <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr>
		  <td width=35 align="center" alt="后退" onClick="history.back();" style="cursor:pointer">后退</td>
		  <td>&nbsp; </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
 
 
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF"></tr>
 <tr>
    <td valign="top">
      <table width="80%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
      <tr bgcolor="#FFFFFF">
        <td height="30" colspan="6" align="center"><strong>订单的详情</strong></td>
        </tr>
      
      <tr bgcolor="#FFFFFF">
        <td width="120" height="30"><div align="center">用户名</div></td>
        <td height="30">${order.student.stuUsername }&nbsp;</td>
        <td height="30"><div align="center">订单号</div></td>
        <td height="30">${order.orderNo }</td>
        <td height="30"><div align="center">真实姓名</div></td>
        <td height="30">${order.student.stuName }&nbsp;&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="120" height="30"><div align="center">手机号码</div></td>
        <td height="30">${order.student.stuMobile }</td>
        <td height="30"><div align="center">订单原价</div></td>
        <td height="30">${order.orderMoney }</td>
        <td height="30"><div align="center">订单优惠价</div></td>
        <td height="30">${order.orderMoney }</td>
      </tr>
       <tr bgcolor="#FFFFFF">
        <td width="120" height="30"><div align="center">支付详情</div></td>
        <td colspan="5">学习卡支付：${order.orderMoney-order.cashMoney }元;&nbsp;现金支付：${order.cashMoney }元</td>
        </tr>
     </table></td>
  </tr>
</table>
<!--  订单的课程列表 -->
<table width="80%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999"  align="center" style="margin-top:20px;">
  <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr bgcolor="#FFFFFF">
        <td height="30" colspan="6" align="center"><strong>订单课程列表</strong></td>
        </tr>
      </table>
	  </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
    <td valign="top">
	<table width="80%" border="1" cellspacing="0" cellpadding="0"  align="center" bgcolor="#CDE2FC">
        <tr> 
            <td width="25%" height="26" class="ButtonListLeft"> <div align="center">课程名称</div></td>
            <td width="8%" height="26" class="ButtonListLeft"> <div align="center">课程原价</div></td>
            <td width="7%" class="ButtonList"> <div align="center">优惠价</div></td>
            <td width="10%" height="26" class="ButtonList"> <div align="center">订单状态</div></td>
            <td width="15%" height="26" class="ButtonList"> <div align="center">开通时间</div></td>
            <td width="15%" height="26" class="ButtonList"> <div align="center">到期时间</div></td>   
        </tr> 
        <s:iterator value="itemList" var="item">
		  <tr > 
			<td height="30" nowrap align="center">${item.itemName }</td>
			 <td nowrap> <div align="center">${item.itemOPrice }</div></td>
			 <td align="center" nowrap>${item.itemRPrice }</td>
			 <td align="center" nowrap><font style="color:#aa0000; font-weight:bold">${order.status } </font></td>
			 <td align="center" nowrap><fmt:formatDate value="${order.orderPayTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td align="center" nowrap><fmt:formatDate value="${item.itemOverTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;</td>
		  </tr>
		</s:iterator> 
  </table>
</td>
  </tr>
  
</table>
<!-- 寄送信息 -->
<table width="80%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999"  align="center" style="margin-top:20px;">
  <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr bgcolor="#FFFFFF">
        <td height="30" colspan="6" align="center"><strong>订单寄送列表</strong></td>
        </tr>
      </table>
	  </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
    <td valign="top">
	<table width="80%" border="1" cellspacing="0" cellpadding="0"  align="center" bgcolor="#CDE2FC">
        <tr> 
            <td width="25%" height="26" class="ButtonListLeft"> <div align="center">寄送内容</div></td>
            <td width="8%" height="26" class="ButtonListLeft"> <div align="center">寄送类型</div></td>
            <td width="7%" class="ButtonList"> <div align="center">寄送状态</div></td>
            <td width="10%" height="26" class="ButtonList"> <div align="center">收货人</div></td>
            <td width="15%" height="26" class="ButtonList"> <div align="center">手机</div></td>
            <td width="15%" height="26" class="ButtonList"> <div align="center">地址</div></td>   
        </tr> 
        <s:if test="sendList.size==0">
        	<tr>
        		<td align="center" height="26" colspan="6" >暂无</td>
        	</tr>
        </s:if>
        <s:iterator value="sendList" var="send">
		  <tr > 
			<td height="30" nowrap align="center">${send.sendContent }</td>
			 <td nowrap> <div align="center">${send.type }&nbsp;</div></td>
			 <td align="center" nowrap>${send.status }</td>
			 <td align="center" nowrap><font style="color:#aa0000; font-weight:bold">${send.sendReceiveName }&nbsp; </font></td>
			 <td align="center" nowrap>${send.sendMobile }&nbsp;</td>
			<td align="center" nowrap>${send.sendFullAddress }&nbsp;</td>
		  </tr>
		</s:iterator> 
  </table>
</td>
  </tr>
</table>
 
<!-- 写明退课和换课的原因  负责人-->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
    <td valign="top"><br><br>
		<table width="80%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
          <tr bgcolor="#FFFFFF"> 
             <td  align="center" alt="订单详情"><strong><font color="#FF0000">退课和换课的原因以及负责人 </font></strong></td>
          </tr>    
	  </table>
	</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:-30px;">
 <tr>
    <td valign="top"><br><br>
    	 <form action="${pageContext.request.contextPath}/order/cancelOrder" method="post">
		<table width="80%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
        <input name="orderId" type="hidden" value="${order.orderId }"/>
         <tr bgcolor="#FFFFFF">
          <td width="10%" height="30" colspan="1">支付详情</td>
          <td colspan="5" align="left">
          		学习卡支付：${order.orderMoney-order.cashMoney }元;&nbsp;现金支付：${order.cashMoney }元
          </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td width="10%" height="50" colspan="1">退费</td>
          <td colspan="5">
          <!-- <input type="radio" name="mode" checked="checked" id="radio1" value=0/><label for="radio1">返至账户</label>-->
          <div>
          		<div style="margin-left:10px;display:inline;" id="showMoney">输入金额[默认全额]：</div>
          		<div style="margin-left:10px;">
          			  退至学习卡：&nbsp;&nbsp;<input type="text" id="card" name="card" value="${order.orderMoney-order.cashMoney }" onblur="checkCard()">
          			  <span style="margin-left:10px;color:red" id="cardInfo"></span>
          		</div>
          		<div style="margin-left:10px;">
          			退至现金账户：<input  type="text" id="cash" name="cash" value="${order.cashMoney }" onblur="checkCash()">
          			<span style="margin-left:10px;color:red" id="cashInfo"></span>
          		</div>
          </div>
        
          <!--  <input type="radio" name="mode" id="radio2" value=1/><label for="radio2">不经过学生账户,直接返现</label>-->
          </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td width="10%" height="50" colspan="1">原因</td>
          <td colspan="5"><textarea id="content" name="content" cols="10" rows="2" style="width:600px;" onblur="checkContent()"></textarea>
          <span style="margin-left:10px;color:red" id="contentInfo"></span>
          </td>
        </tr>
       <tr bgcolor="#FFFFFF">
        <td height="30" colspan="6" align="center">
        <input type="submit" value="提交" onclick="return checkAll()==1"> <input type="button" value="返回" onclick="history.back()"></td>
      </tr>
	  </table>
	   </form>
	</td>
  </tr>  
</table>
 
 
</body>
</html> 

