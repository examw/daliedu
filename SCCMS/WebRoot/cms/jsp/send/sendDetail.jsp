<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body bgcolor="#FFFFFF"> 	
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
 		<tr>
    	<td valign="top"><br><br>
      	<table width="80%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
      	<tr><td colspan=6 align="center">订单详情</td></tr>
      	<tr bgcolor="#FFFFFF">
        <td width="70" height="30" ><div align="center">用户名</div></td>
        <td width="56" height="30" >${order.student.stuUsername }</td>
        <td width="64" height="30" ><div align="center">订单号</div></td>
        <td width="116" height="30" >${order.orderNo }</td>
        <td height="30" width="64"><div align="center">真实姓名</div></td>
        <td width="64" height="30" >${order.student.stuName }</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70" height="30"><div align="center">手机号码</div></td>
        <td height="30" colspan="1">${order.student.stuMobile }</td>
        <td height="30"><div align="center">订单状态</div></td>
        <td height="30">${order.status }</td>
        <td height="30" width="64" align="center">订单优惠价</td>
        <td height="30" colspan="1"><fmt:formatNumber value="${order.orderMoney}" pattern="###0.00" />
        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70"><div align="center">生成时间</div></td>
        <td height="30" colspan="1"><fmt:formatDate value="${order.orderAddTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td height="30" ><div align="center">付款时间</div></td>
        <td height="30" align="left"><fmt:formatDate value="${order.orderPayTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td height="30" width="64" align="center">汇款金额:</td>
        <td height="30" colspan="1"><fmt:formatNumber value="${order.cashMoney }" pattern="###0.00" /></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70"><div align="center">需送详情</div></td>
        <td colspan="5">${order.orderSendDetail}</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--  订单的课程和考试宝典的列表-->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 		<tr>
    	<td valign="top"><br><br>
      	<table width="80%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
      	<tr><td colspan=6 align="center">寄送详情</td></tr>
      	<tr bgcolor="#FFFFFF">
        <td width="70" height="30" ><div align="center">订单号</div></td>
        <td width="56" height="30" >${order.orderNo }</td>
        <td width="64" height="30" ><div align="center"><s:if test="send.sendType==0">寄送内容</s:if><s:else>发票抬头</s:else></div></td>
        <td width="116" height="30" >${send.sendContent }</td>
        <td height="30" width="64"><div align="center">寄送类型</div></td>
        <td width="64" height="30" >${send.type }</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70" height="30"><div align="center">收货人</div></td>
        <td height="30" colspan="1">${send.sendReceiveName }</td>
        <td height="30" ><div align="center">收货地址</div></td>
        <td height="30"colspan="3">
        	<s:if test="send.sendFullAddress!=null">${send.sendFullAddress }</s:if>
        	<s:else><a href="${pageContext.request.contextPath}/send/sendDetail?sendId=${send.sendId }&action=addAddr">添加</a></s:else>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
      	 <td height="30" width="64" align="center">手机号码</td>
        <td height="30" colspan="1">${send.sendMobile}
        </td>
        <td width="70"><div align="center">寄送时间</div></td>
        <td height="30" colspan="1"><fmt:formatDate value="${send.sendTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td height="30" ><div align="center">确认时间</div></td>
        <td height="30" align="left"><fmt:formatDate value="${send.sendConfirmTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70" height="30"><div align="center">负责人</div></td>
        <td height="30" colspan="1">${send.sendPerson }</td>
        <td height="30"><div align="center">快递公司</div></td>
        <td height="30">${send.epcName }</td>
		<td height="30" width="64" align="center">快递单号:</td>
        <td height="30" colspan="1">${send.sendExpressNo }</td>
      </tr>
       <tr bgcolor="#FFFFFF">
        <td height="30" width="70" align="center">邮费金额:</td>
        <td height="30" colspan="1"><fmt:formatNumber value="${send.sendCost}" pattern="###0.00" /></td>
        <td width="70" height="30"><div align="center">寄送状态</div></td>
       	<td height="30" colspan="3">${send.status }
       	<s:if test="send.sendStatus!=2&&send.sendReceiveName!=null"><a style="margin-left:20px" href="${pageContext.request.contextPath}/send/loadSend?sendId=${send.sendId }">修改</a></s:if>
       	</td>
       </tr>
    </table></td>
  </tr>
</table>
	<div align="center" style="margin-top:20px;">
		<s:if test="order.orderStatus==0">
		<input type="button" value="开通课程" onclick="location='${pageContext.request.contextPath}/order/load?id=${order.orderId }'"/>
		</s:if>
		<input style="margin-left:10px;" type="button" value="关闭" onclick="parent.closeTab('sendDetail');"/>	
	</div>
</body>
</html>
