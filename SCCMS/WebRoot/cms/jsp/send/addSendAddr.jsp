<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容窗口</title>
<link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.x_table {
	border-top: solid 1px #ccc;
	border-left: solid 1px #ccc;
	margin-top: 20px;
	margin-left: 30px;
}

.x_table .xtr {
	font-weight: bold;
	background: url(bg_list01_th.gif) repeat-x bottom;
	height: 26px;
	line-height: 26px;
	text-align: center;
}

.x_table .xtr02 {
	font-weight: bold;
	background: url(bg_list01_th.gif) repeat-x bottom;
	text-align: left;
	font-size: 14px;
	line-height: 30px;
}

.x_table td {
	border-bottom: solid 1px #ccc;
	border-right: solid 1px #ccc;
	padding: 0 5px;
	font-size: 12px;
	line-height: 22px;
}

.x_table .tdbg {
	background: #fff;
}

.x_table .tdbgmouseover {
	background: #f4f4f4;
}

.red {
	color: #F00;
	font: bold
}
.l-text-wrapper{position: relative;width:160px}
</style>
<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$("#tradeTime").ligerDateEditor({
			showTime : true
		});
	});
	$(function(){
			if ($.browser.msie) {
				$('input:checkbox').click(function () {
				this.blur();
				this.focus();
				});
				$('input:radio').click(function () {
				this.blur();
				this.focus();
				});
			}; 
		});
      function checkName()
		{
			return checkNull($("#receiveName"),$("#nameInfo"));
		}
		function checkAddr()
		{
			return checkNull($("#fullAddress"),$("#addrInfo"));
		}
		function checkNull(dom,span)
		{
			if(!dom.attr("value")||!$.trim(dom.attr("value")))
			{
				span.html("此项不能为空");
				return false;
			}else
			{
				span.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
				return true;
			}
		}
		function checkPhone()
		{
			var phone = $("#mobile").val();
			var reg1 =/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;//���(0��ͷ)
			var reg2 =/^1[358]\d{9}$/;//�ֻ�(13,15,18)
			if(!reg1.test(phone)&&!reg2.test(phone))
			{
				$("#phoneInfo").html("电话号码不合法");
				return false;
			}else
			{
				$("#phoneInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
				return true;
			}
		}
		function checkPostalCode()
		{
			var code = $("#postalCode").val();
			if(!code||!$.trim(code))
			{
				$("#codeInfo").html("");
				return true;
			}
			 var reg= /^[1-9][0-9]{5}$/;
			 if(reg.test($.trim(code)))
			 {
			 	$("#codeInfo").html("");
			 	return true;
			 }else
			 {
			 	$("#codeInfo").html("格式不合法");
			 	return false;
			 }
		}
		function checkAll()
		{
        	return checkName()&checkPhone()&checkAddr()&checkPostalCode();
		}
        $(function ()
        {
           	$("#receiveName").blur(checkName);
           	$("#fullAddress").blur(checkAddr);
           	$("#mobile").blur(checkPhone);
           	$("#postalCode").blur(checkPostalCode);
        });  
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
	<table width="80%" height="421" align="center">
		<tr>
			<td height="211" valign="top">
				<table width='70%' border='0' cellpadding='0' cellspacing='0'
					align="center">
					<tr>
						<td width="45%">
							<form id="form1" name="form1" method="post"
								action="${pageContext.request.contextPath}/order/manualPay">
								<table width="100%" height="200" border='0' cellpadding='2'
									cellspacing='1' class='x_table'>
									<tr>
										<td height="36" colspan="2" align="center" bgcolor="#F4F4F4"><strong
											style="font-size:14px; color:#F00">添加送货地址</strong>
										</td>
										<!-- 全手动开通，需要寄送的情况，要添加寄送，选择 -->
									</tr>
									<tr>
										<td height="36" width=100 align="right"><strong>订单信息：</strong>
										</td>
										<td>&nbsp;<b style="color:red;">订单号：${order.orderNo }</b>
										&nbsp;<b style="color:red;">用户名：${order.student.stuUsername }</b>
										</td>
									</tr>
									<tr>
										<td height="36" width=100 align="right"><strong>寄送信息：</strong>
										<input type="hidden" name="send.sendId" value="${send.sendId }"/>
										</td>
										<td>&nbsp;<b style="color:green;">${send.sendContent }</b>
										</td>
									</tr>
										<tr class="address">
											<td align="right" class="l-table-edit-td" height="36">收件人：</td>
											<td align="left" class="l-table-edit-td" style="width:160px"><input
												class="l-text" name="send.sendReceiveName" type="text"
												id="receiveName" value="" /> <span
												style="color:red;margin-left:10px" id="nameInfo">*</span>
											</td>
										</tr>
										<tr class="address">
											<td align="right" class="l-table-edit-td" height="36">地址：</td>
											<td align="left" class="l-table-edit-td" style="width:160px"><input
												class="l-text" name="send.sendFullAddress" type="text"
												id="fullAddress" value="" />
											<span style="color:red" id="addrInfo">*</span>
											</td>
										</tr>
										<tr class="address">
											<td align="right" class="l-table-edit-td" height="36">电话：</td>
											<td align="left" class="l-table-edit-td" style="width:160px"><input
												class="l-text" type="text" id="mobile" value=""
												name="send.sendMobile" /> <span style="color:red"
												id="phoneInfo">*</span>
											</td>
										</tr>
										<tr class="address">
											<td align="right" class="l-table-edit-td" height="36">邮编：</td>
											<td align="left" class="l-table-edit-td" style="width:160px"><input
												class="l-text" name="send.sendPostalCode" type="text"
												id="postalCode" value="" /> <span style="color:red"
												id="codeInfo"></span>
											</td>
										</tr>
									<tr>
										<td height="36" colspan="2" align="center"><input
											name="button" type="submit" value=" 确 定 " class="btn" onclick="return checkAll()==1;">
											<input
											name="button2" type="reset" value=" 重新输入 " class="btn">
											<input type="button" value="返回"  onclick="history.back()">
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table></td>
		</tr>

	</table>




	<!-- 列表出会员的修改订单的价格-->

</body>
</html>
