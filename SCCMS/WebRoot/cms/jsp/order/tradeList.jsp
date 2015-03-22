<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body topmargin="2" leftmargin="2">
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
  <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr>
		  <td width=35 align="center" alt="后退" onClick="top.GetEkMainObject().history.back();" onMouseMove="BtnMouseOver(this);" onMouseOut="BtnMouseOver(this);" class="BtnMouseOut">后退</td>
		  <td>&nbsp; </td>
        </tr>
      </table>
	  </td>
  </tr>
</table>
<div align="center" style="margin-top:20px;">此订单交易详情</div>       
<table width="80%"  align="center" >
  <tr>
    <td height="148" colspan="3" align="left" valign="top"> 
	<table width='97%' border='0' cellpadding='2' cellspacing='1' class='x_table'style="margin-left:5px;" >  
	   <tr class='xtr' >  
	     <td width="13%" bgcolor="#f4f4f4">订单号</td> 
         <td width="19%" bgcolor="#f4f4f4">支付金额</td>    
         <td width="16%" bgcolor="#f4f4f4">支付类型</td>    
	    <td width="19%" bgcolor="#f4f4f4">交易类型</td>    
	    <td width="17%" bgcolor="#f4f4f4">交易时间</td>
	    <td width="16%" bgcolor="#f4f4f4">备注</td>
	   </tr>
	   <s:if test="tradeList.size!=0">
	   <s:iterator value="tradeList" var="trade">
	   <tr class='xtr' style="font-weight: normal;">
	   		<td width="13%" bgcolor="#f4f4f4">${orderNo }</td> 
         	<td width="19%" bgcolor="#f4f4f4"><font color="red">${trade.tradeMoney }</font></td>    
         	<td width="16%" bgcolor="#f4f4f4">${trade.tradePattern }</td>    
	    	<td width="19%" bgcolor="#f4f4f4"><font color="red">${trade.type }</font></td>    
	    	<td width="17%" bgcolor="#f4f4f4"><fmt:formatDate value="${trade.tradeTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	    	<td width="16" bgcolor="#f4f4f4">${trade.tradeNote }</td>
	    </tr>
	   </s:iterator>
	   </s:if>
	   <s:else>
	   		<tr><td height=23 bgcolor="#FFFFFF" colspan=6>当前还没有支付记录。</td></tr> 
	   </s:else>
     </table>
     </td>
  </tr> 
  <tr><td align="center"><input type="button" value="返回" onclick="history.back()"></td></tr>
</table>

 
</body>
</html> 
