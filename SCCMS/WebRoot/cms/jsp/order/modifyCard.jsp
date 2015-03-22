<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>内容窗口</title>
<style type="text/css"> 
<!--
.x_table   {border-top:solid 1px #ccc;border-left:solid 1px #ccc; margin-top:20px;margin-left:30px;}
.x_table .xtr{ font-weight:bold;background:url(bg_list01_th.gif) repeat-x bottom;height:26px;line-height:26px; text-align:center;}
.x_table .xtr02{font-weight:bold;background:url(bg_list01_th.gif) repeat-x bottom; text-align:left;font-size:14px;line-height:30px;}
.x_table td{border-bottom:solid 1px #ccc; border-right:solid 1px #ccc; padding:0 5px; font-size:12px; line-height:22px;}
.x_table .tdbg{background:#fff;}
.x_table .tdbgmouseover{background:#f4f4f4;}
 
.red{ color:#F00; font:bold}
-->
</style>
<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function checkMoney()
	{
		var money = $("#money").val();
		if(!money||!$.trim(money))
		{
			$("#msg").html("请输入扣除金额");
			return false;
		}
		if(/^[0-9]+[.]?[0-9]{0,2}$/.test(money))
		{
			if(Number(money)==0)
			{
				$("#msg").html("不要只输入0");
				return false;
			}
			if(Number(money)>Number("${stu.stuCard}"))
			{
				$("#msg").html("没那多钱扣");
				return flase;
			}
			$("#msg").html("");
			return true;
		}else
		{
			return false;
		}
		
	}
</script>
</head>
<body topmargin="2" leftmargin="2">
 
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
 
<!-- 添加会员的现金券-->
<!--  
<table width="100%" height="58" >
  <tr>
    <td height="148" colspan="3" align="left" valign="top">
 
	<table width='97%' border='0' cellpadding='2' cellspacing='1' class='x_table'style="margin-left:5px;" >  
	   <tr class='xtr' >  
	     <td width="13%" bgcolor="#f4f4f4">订单号</td> 
         <td width="19%" bgcolor="#f4f4f4">支付金额</td>    
         <td width="16%" bgcolor="#f4f4f4">支付类型</td>    
	    <td width="19%" bgcolor="#f4f4f4">交易类型</td>    
	    <td width="17%" bgcolor="#f4f4f4">交易时间</td>
        <td width="17%" bgcolor="#f4f4f4">详情</td>
	   </tr>
        	 
      <tr align="middle">
           <td align="center">C20130321130107</td>
           
			<td align="center" ><strong style="color:red;">￥ - 1420</strong>元</td>
			<td align="center" >余额支付
</td>	
			<td align="center">
<font color=red>购买网校课程</font>
			</td>
			<td align="center">2013-3-21 13:29:51</td>
            <td align="center">用户：287816398，课程订单号：C20130321130107</td>
			</tr>
		 
      <tr align="middle">
           <td align="center">C20130321130107</td>
           
			<td align="center" ><strong style="color:red;">￥ + 1420</strong>元</td>
			<td align="center" >网银在线支付
</td>	
			<td align="center">
<font color=red>充值</font>
			</td>
			<td align="center">2013-3-21 13:29:51</td>
            <td align="center">&nbsp;</td>
			</tr>
	 
     </table>
     </td>
  </tr>
 
</TR>
 
</table> -->
 
 
 <table width="100%" height="421" align="center">
  <tr>
    <td height="211" valign="top">
    <table width='70%' border='0' cellpadding='0' cellspacing='0' align="center" border="0.1px solid #CDE2FC">
    <tr><td width="45%">
	<form id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/order/modifyCard">
	<table width="100%" height="200" border='0' cellpadding='2' cellspacing='1' class='x_table'>
   <tr>
    <td height="36" colspan="2" align="center" bgcolor="#F4F4F4"><strong style="font-size:14px; color:#F00">学习卡扣费&nbsp;&nbsp;注：充值输入正数,扣费输入负数</strong ></td>
   </tr>
  <tr>
    <td height="36" align="right"><strong>会员信息：</strong></td>
    <td>&nbsp;<b style="color:red;">${stu.stuUsername }</b>&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td width="35%" height="36" align="right"><strong>帐户余额：</strong></td>
    <td >学习卡 <font class="red"><fmt:formatNumber value="${stu.stuCard}" pattern="####.00" /></font> 元
    </td>
  </tr>
  <tr>
    <td height="36" align="right"><strong style="font-size:14px">扣除</strong><strong>学习卡金额：</strong></td>
    <td><input id="money" type="text" name="money"   style="border:1px solid #0000BB;" onblur="checkMoney()">元 
    	<span id="msg" style="color:red">请输入输入正整数</span>
    </td>
  </tr>
  <tr>
  	<td height="36" align="right"><strong>备注：</strong></td>
  	<td><textarea id="content" type="text" name="content"   style="width:300px;border:1px solid #0000BB;"></textarea></td>
  </tr>
  <tr>
    <td height="36" colspan="2" align="center"><input name="button" type="submit" value=" 确 定 " class="btn" onclick="return checkMoney();"> 
	     <input type="hidden" name="stuId" value="${stu.stuId }" />
	     <input type="hidden" name="orderId" value="${orderId}" />
		 <input name="button2" type="reset" value=" 重新输入 " class="btn">
		 <input type="button" value="返回" onClick="history.back();" >
	       </td>
    </tr>
</table></form></td>
</tr></table>
  </table>
  
 
 
  
  
<!-- 添加会员的支付方式进行支付订单-->
</body>
</html> 

