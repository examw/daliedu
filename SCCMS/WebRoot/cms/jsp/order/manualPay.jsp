<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
.address{display:none}
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
	$(function(){
		$("#rbtnl_6").attr('checked',true);
		$("#radio1").attr('checked',true);
		var tabid = parent.getSelectTabId();
		if(tabid=="modifyOrder")
		{
			$("#tr_back").hide();
			$("#btn_back").hide();
		}
		$("#isNeedSend").val(Number(new Boolean("${isBookSendExist}")));//1为不要寄送
		$("input[name='trade.tradeType']").change(
        		function(){
        			if($("input[name='trade.tradeType']:checked").val()==4)
        			{
        				//parent.parent.addTab("addSend","${pageContext.request.contextPath}/order/wantInvoice?orderId="+"${order.orderId}","发票申请");
        				$(".trade").hide();
        			}else
        			{
        				$(".trade").show();
        			}
        		}
        	);
        $("input[name='address']").change(
        	function()
        	{
        		if($("input[name='address']:checked").val()==1)
        			{
        				//parent.parent.addTab("addSend","${pageContext.request.contextPath}/order/wantInvoice?orderId="+"${order.orderId}","发票申请");
        				$(".address").show();
        			}else
        			{
        				$(".address").hide();
        			}
        	}
        	
        );
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
		function checkTradeTime()
		{
			return checkNull($("#tradeTime"),$("#tradeTimeInfo"));
		}
		function checkTradeMoney()
		{
			var reg =/^[0-9]+[.]?[0-9]{0,2}$/;
			if(!reg.test($("#tradeMoney").val()))
			{
				$("#tradeMoneyInfo").html("只能是数字并且最多保留2位");
				return false;
			}else
			{
				$("#tradeMoney").val(parseFloat($("#tradeMoney").val()));
				$("#tradeMoneyInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
				return true;
			}
			
		}
		function checkTradeNote()
		{
			return checkNull($("#tradeNote"),$("#tradeNoteInfo"));
		}		
		function checkAll()
		{
			//选中银行汇款
			var flag = true;
			if($("#rbtnl_6").attr('checked'))
			{
				flag = checkTradeTime()&checkTradeMoney()&checkTradeNote();
			}
        	if($("input[name='order.orderInvoice']:checked").val()==1)
        	{
        		 return checkName()&checkPhone()&checkAddr()&flag;
        	}
        	return flag;
		}
        $(function ()
        {
           	$("#receiveName").blur(checkName);
           	$("#fullAddress").blur(checkAddr);
           	$("#mobile").blur(checkPhone);
           	$("#tradeTime").blur(checkTradeTime);
           	$("#tradeMoney").blur(checkTradeMoney);
           	$("#tradeNote").blur(checkTradeNote);
        });  
</script>
</head>
<body topmargin="2" leftmargin="2">
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
  <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr id="tr_back">
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
											style="font-size:14px; color:#F00">开通订单</strong>
										</td>
										<!-- 全手动开通，需要寄送的情况，要添加寄送，选择 -->
									</tr>
									<tr>
										<td height="36" align="right"><strong>订单信息：</strong>
										<input type="hidden" name="order.orderId" value="${order.orderId }"/>
										</td>
										<td>&nbsp;<b style="color:red;">订单号：${order.orderNo }</b>
										&nbsp;<b style="color:red;">优惠价：${order.cashMoney }</b>
										</td>
									</tr>
									<tr>
										<td width="35%" height="36" align="right"><strong>用户信息：</strong>
										</td>
										<td><font class="red">用户ID:${order.student.stuId }</font>
											&nbsp;&nbsp; <font class="red">用户名：${order.student.stuUsername }</font>
											&nbsp;&nbsp; <font class="red">现金账户余额：${order.student.stuCash }元
										</font></td>
									</tr>
									<tr>
										<td width="35%" height="36" align="right"><strong>支付选择：</strong>
										</td>
										<td>
										 <input id="rbtnl_6" type="radio" name="trade.tradeType" value="2" checked="checked"/><label for="rbtnl_2">其他方式&nbsp;&nbsp;</label>
                						<s:if test="order.student.stuCash>=order.orderMoney">
                    						<input id="rbtnl_7" type="radio" name="trade.tradeType" value="4"/><label for="rbtnl_3">余额支付&nbsp;&nbsp;</label>
               							 </s:if>
                						<s:else>
               								 <input id="rbtnl_7" type="radio" name="trade.tradeType" value="4" disabled="disabled"/><label for="rbtnl_3">余额支付&nbsp;&nbsp;</label>
                						</s:else>
										</td>
									</tr>
									<tr class="trade">
										<td height="36" align="right"><strong>汇款金额：</strong>
										</td>
										<td><input id="tradeMoney" type="text" name="trade.tradeMoney"
											class="l-text" value="">元
										&nbsp;<span id="tradeMoneyInfo" style="color:red;margin-left:4px">*</span>
										</td>
									</tr>
									<tr class="trade">
										<td height="36" align="right"><strong>时间：</strong>
										</td>
										<td><input id="tradeTime" type="text"
											name="trade.tradeTime" style="width:130px"><span id="tradeTimeInfo" style="position:absolute;margin-top:-20px;margin-left:160px;color:red">*</span>
											</td>
									</tr>
									<tr class="trade">
										<td height="36" align="right"><strong>汇款方式：</strong>
										</td>
										<td><select name="order.orderPayment" style="width:130px">
												<option value="1" selected="selected">支付宝支付</option>
												<option value="2">网银在线支付</option>
												<option value="5">建设银行汇款</option>
												<option value="4">农业银行汇款</option>
												<option value="7">中国银行汇款</option>
												<option value="8">邮政个人帐户</option>
												<option value="9">邮政公司帐户</option>
												<option value="6">工商银行汇款</option>
												<option value="12">其他方式</option>
										</select>
										</td>
									</tr>
									<tr class="trade">
                						<td align="right" class="l-table-edit-td">支付备注：</td>
                						<td align="left" class="l-table-edit-td" colspan="1" width="500px"> 
                							<textarea name="trade.tradeNote" cols="100" rows="2" class="l-textarea" id="tradeNote" style="width:300px" ></textarea>
                						<span style="color:red" id="tradeNoteInfo">*</span>
                						</td>
            						</tr>
									<input type="hidden" name="isNeedSend" id="isNeedSend"/>
										<!-- 需要寄送 -->
									<s:if test="order.orderIsNeedSeed==1&&!isBookSendExist">
										<tr>
											<td height="36" align="right"><strong>需要寄送教材</strong>
											</td>
											<td><input type="radio" id="radio1" value="0" name="address" checked="checked"><label
												for="radio3">由学员自己填写</label> <input type="radio" name="address"id="radio4"
												value="1"><label for="radio2">管理员帮填</label></td>
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
										</s:if>
									<!--  <tr>
    <td height="36" align="right"><strong>交易类型：</strong></td>
    <td><select name="BuyType" id="BuyType" style="width:130px">
   <option value="2" >购买课程</option>
</select></td>
  </tr>  -->
									<tr>
										<td height="36" colspan="2" align="center"><input
											name="button" type="submit" value=" 确 定 " class="btn" onclick="return checkAll()==1;">
											<input
											name="button2" type="reset" value=" 重新输入 " class="btn">
											<input id="btn_back" type="button" value="返回"  onclick="history.back()">
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
