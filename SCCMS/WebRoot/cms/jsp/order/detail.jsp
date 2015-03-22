<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<script>
	function modify(id)
	{
		parent.addTab("modifyOrder","${pageContext.request.contextPath}/order/load?id=" + id,'修改订单');
	}
	function payOrder(id)
	{
		$.ajax({
			async:true,
    		type:"POST",
			url:"${pageContext.request.contextPath}/order/beforePay",
			data:{"orderId":id},
    		dataType:"json",
    		success:function(data)
    		{
    			if(data)
    			{
    				location='${pageContext.request.contextPath}/order/load?id='+id;
    			}else
    			{
    				alert("订单包含已过期课程不能支付!");
					window.location.reload();
    			}
    		},
    		error:function(){
    			alert("系统异常,请稍后重试!");
    		}
		});
	}
</script>
</head>
<body bgcolor="#FFFFFF"> 	
	<div align="center" style="margin-top:20px;"><strong style="color:#F00">订单详情</strong></div>       
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
 		<tr>
    	<td valign="top"><br><br>
      	<table width="100%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
      	<tr bgcolor="#FFFFFF">
        <td width="70" height="30" ><div align="center">用户名</div></td>
        <td width="56" height="30" >${order.student.stuUsername }</td>
        <td width="64" height="30" ><div align="center">订单号</div></td>
        <td width="116" height="30" >${order.orderNo }</td>
        <td height="30" width="64"><div align="center">真实姓名</div></td>
        <td width="64" height="30" >${order.student.stuName }&nbsp;<a href="${pageContext.request.contextPath}/order/loadStu?stuId=${order.student.stuId }">会员详情</a></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70" height="30"><div align="center">手机号码</div></td>
        <td height="30" colspan="1">${order.student.stuMobile }</td>
        <td height="30"><div align="center">订单状态</div></td>
        <td height="30">${order.status }</td>
        <td height="30" width="64" align="center">订单优惠价</td>
        <td height="30" colspan="1"><fmt:formatNumber value="${order.orderMoney}" pattern="####.00" />
        <s:if test="order.orderStatus==0"><a href="${pageContext.request.contextPath}/cms/jsp/order/modifyPrice.jsp?orderNo=${order.orderNo }&orderMoney=${order.orderMoney }" style="color:#0000FF">修改</a></s:if>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70"><div align="center">生成时间</div></td>
        <td height="30" colspan="1"><fmt:formatDate value="${order.orderAddTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td height="30" ><div align="center">付款时间</div></td>
        <td height="30" align="left"><fmt:formatDate value="${order.orderPayTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td height="30" width="64" align="center">付款金额:</td>
        <td height="30" colspan="1">
        <s:if test="order.orderStatus==1">
        	卡：<fmt:formatNumber value="${order.orderMoney-order.cashMoney }" pattern="###0.00" />&nbsp;元<br>
        	钞：<fmt:formatNumber value="${order.cashMoney }" pattern="###0.00" />&nbsp;元
        </s:if>
        <s:else>0.00&nbsp;元</s:else></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70" height="30"><div align="center">现金券</div></td>
        <td height="30" colspan="1"><font color="#FF0000" style="font-size:20px;"><fmt:formatNumber value="${order.student.stuCash }" pattern="#,##0.00" />元</font>
        <a href="${pageContext.request.contextPath}/order/loadForModifyCash?stuId=${order.student.stuId }&orderId=${order.orderId}"><font color="#0000FF">充值/扣费</font></a></td>
        <td height="30"><div align="center">学习卡</div>
        </td>
        <td height="30"><font color="#FF0000" style="font-size:20px;"><fmt:formatNumber value="${order.student.stuCard }" pattern="###0.00" /> &nbsp; 元</font>
        <a href="${pageContext.request.contextPath}/order/loadForModifyCard?stuId=${order.student.stuId }&orderId=${order.orderId}"><font color="#0000FF">扣费</font></a>
          <!--<a href="ModifyAdd.asp?username==UserName%>"><font color="#FF0000">修改</font></a>-->
        <td width="64" height="30" ><div align="center">支付方式</div></td>
        <td height="30" colspan="1"><a href=""><font color="#FF0000"></font> </a> &nbsp;${order.payment }</td>
      </tr>
      <tr>
      	<td width="70" height="30"><div align="center">备注</div></td>
      	<td height="30" colspan="5"><div align="center">${order.orderNote}</div></td>
      </tr>
      <s:if test="order.orderStatus==1">
      
      <tr bgcolor="#FFFFFF">
      	<td><div align="center"><strong>交易详情</strong></div></td>
        <td height="30"><a href="${pageContext.request.contextPath}/order/tradeDetail?orderId=${order.orderId }&orderNo=${order.orderNo}"><font color="#FF0000">点击进入</font></a></td>
        <td><div align="center"><strong>退课换课</strong></div></td>
        <td height="30"><a href="${pageContext.request.contextPath}/order/cancelOrder2?orderId=${order.orderId }"><font color="#FF0000">点击进入</font></a></td>
      	<s:if test="order.orderInvoice==0">
        <td><div align="center"><strong>申请发票</strong></div></td>
        <td height="30" ><a href="${pageContext.request.contextPath}/cms/jsp/order/applyInvoice.jsp?orderNo=${order.orderNo }&status=${order.status}"><font color="#FF0000">点击进入</font></a></td>
        </s:if>
        <s:else>
        	<td>&nbsp;</td><td>&nbsp;</td>
        </s:else>
              </tr>      
      </s:if>
    </table></td>
  </tr>
</table>
<!--  订单的课程和考试宝典的列表-->
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999"  align="center" style="margin-top:20px;">
</table> 
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
    <td valign="top">
	<table width="100%" border="1" cellspacing="0" cellpadding="0"  align="center">
        <tr>  
            <td height="26"  align="center" colspan="11" ><strong style="color:#F00">条目详细</strong></td>
        </tr>
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
			 <td nowrap> <div align="center"><fmt:formatNumber value="${item.itemOPrice }" pattern="###0.00" /></div></td>
			 <td align="center" nowrap><fmt:formatNumber value="${item.itemRPrice }" pattern="###0.00" /></td>
			 <td align="center" nowrap>${order.status }</td>
			 <td align="center" nowrap><s:if test="order.orderStatus==1||order.orderStatus==2"> <fmt:formatDate value="${order.orderPayTime }" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></s:if><s:else>&nbsp;</s:else></td>
			<td align="center" nowrap><s:if test="order.orderStatus==1||order.orderStatus==2"> <fmt:formatDate value="${item.itemOverTime }" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></s:if><s:else>&nbsp;</s:else>
			</td>
		  </tr>
		  </s:iterator>
  </table>
</td>
  </tr>
</table>
<!-- 寄送信息 -->
<p>
<s:if test="order.orderStatus==1">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
    <td valign="top">
	<table width="100%" border="1" cellspacing="0" cellpadding="0"  align="center" bgcolor="#FFFFFF">
       <tr bgcolor="#FFFFFF">
         <td height="26"  align="center" colspan="11" ><strong style="color:#F00">订单寄送列表</strong></td>
        </tr> 
        <tr> 
            <td width="15%" height="26" class="ButtonListLeft"> <div align="center">寄送内容[或发票抬头]</div></td>
            <td width="7%" height="26" class="ButtonListLeft"> <div align="center">寄送类型</div></td>
            <td width="7%" class="ButtonList"> <div align="center">寄送状态</div></td>
            <td width="10%" class="ButtonList"> <div align="center">快递单号</div></td>
            <td width="10%" height="26" class="ButtonList"> <div align="center">收货人</div></td>
            <td width="10%" height="26" class="ButtonList"> <div align="center">手机</div></td>
            <td width="15%" height="26" class="ButtonList"> <div align="center">地址</div></td>
            <td width="6%" height="26" class="ButtonList"> <div align="center">详情</div></td>
        </tr> 
        <s:if test="sendList.size==0">
        	<tr>
        		<td align="center" height="26" colspan="8" >无需寄送</td>
        	</tr>
        </s:if>
        <s:iterator value="sendList" var="send">
		  <tr > 
			<td height="30" nowrap align="center">${send.sendContent }</td>
			 <td nowrap> <div align="center">${send.type }&nbsp;</div></td>
			 <td align="center" nowrap>${send.status }</td>
			 <td align="center" nowrap>${send.sendExpressNo }&nbsp;</td>
			 <td align="center" nowrap><font style="color:#aa0000; font-weight:bold">${send.sendReceiveName }&nbsp; </font></td>
			 <td align="center" nowrap>${send.sendMobile }&nbsp;</td>
			<td align="center" nowrap>${send.sendFullAddress }&nbsp;</td>
			<td align="center" nowrap><a href="javascript:;" onclick="parent.addTab('sendDetail','${pageContext.request.contextPath}/send/sendDetail?sendId=${send.sendId}','寄送详情');">详情</a></td>
		  </tr>
		</s:iterator> 
  </table>
</td>
  </tr>
</table>
</s:if>
	<div align="center" style="margin-top:20px;">
		<s:if test="order.orderStatus==0">
		<input type="button" value="开通课程" onclick="payOrder(${order.orderId})"/>
		</s:if>
		<input style="margin-left:10px;" type="button" value="关闭" onclick="parent.closeTab(parent.getSelectTabId())"/>	
	</div>
</body>
</html>
