<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
 
 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
			$("#msg").html("请输入充值金额");
			return false;
		}
		if(/^[0-9]+[.]?[0-9]{0,2}$/.test(money))
		{
			if(Number(money)==0)
			{
				$("#msg").html("不要只输入0");
				return false;
			}
			//加一些限制逻辑
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
 
<table width="100%" height="421" align="center">
  <tr>
    <td height="211" valign="top">
    <table width='70%' border='0' cellpadding='0' cellspacing='0' align="center">
    <tr><td width="45%">
	<form id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/order/modifyPrice">
	<table width="100%" height="200" border='0' cellpadding='2' cellspacing='1' class='x_table'>
  <tr>
    <td height="36" colspan="2" align="center" bgcolor="#F4F4F4"><strong style="font-size:14px">修改订单金额</strong></td>
  </tr>
  <tr>
    <td height="36" align="right"><strong>订单号：</strong></td>
    <td>&nbsp;<b style="color:red;"><%=request.getParameter("orderNo") %></b>&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td width="35%" height="36" align="right"><strong>订单金额：</strong></td>
    <td > <font class="red"><%=request.getParameter("orderMoney") %></font> 元 </td>
  </tr>
  <tr>
    <td height="36" align="right"><strong>修改金额：</strong></td>
    <td><input id="money" type="text" name="realMoney"   style="border:1px solid #dcdcdc;" onblur="checkMoney()" >
    	<span id="msg" style="color:red"></span>
     </td>
  </tr>
  <tr>
    <td height="36" colspan="2" align="center"><input name="button" type="submit" value=" 确 定 " class="btn" onclick="return checkMoney();"> 
	     <input type="hidden" name="orderNo" value="<%=request.getParameter("orderNo")%>" />
		 <input name="button2" type="reset" value=" 重新输入 " class="btn">
	       </td>
    </tr>
</table></form></td>
</tr></table>
   </td>
  </tr>
</table>
<!-- 列表出订单的提交注册码的-->
 
</body>
</html> 

