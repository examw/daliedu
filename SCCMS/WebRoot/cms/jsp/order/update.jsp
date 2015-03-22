<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTab.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script type="text/javascript">
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
        //var eee;
        var role =Number("${order.orderInvoice}");
        var tradeType="";
        $(function ()
        {
        	//$("#form1").ligerForm();
        	$("#tradeTime").ligerDateEditor({showTime:true});
        	var status = "${order.orderStatus}";
        	/*
        	if(status==0){$("#rbtnl_2").attr('checked','checked');}
        	else if(status==1){$("#rbtnl_3").attr('checked','checked');}
        	else if(status==2){$("#rbtnl_4").attr('checked','checked');}
        	else{$("#rbtnl_5").attr('checked','checked');}
        	*/
        	if(role==1)
        	{
        		$("#rbtnl_1").attr('checked',true);
        		//alert($("#rbtnl_1").attr('checked'));
        	}else
        		$("#rbtnl_0").attr('checked','checked');
        		
        	//现金卷大于等于订单金额才能余额支付
        	//要不要发票的不同显示
        	$("input[name='order.orderInvoice']").change(
        		function(){
        			if(role==1)
        			{
        				return;
        			} 
        			if($("input[name='order.orderInvoice']:checked").val()==1)
        			{
        				//parent.parent.addTab("addSend","${pageContext.request.contextPath}/order/wantInvoice?orderId="+"${order.orderId}","发票申请");
        				$(".invoice").show();
        			}else
        			{
        				$(".invoice").hide();
        			}
        		}
        	);
        	//是不是银行汇款的显示
        	$("#rbtnl_6").click(
        		function(){
        			if($("#rbtnl_6").attr('checked'))
        			{
        				if($("#rbtnl_7").attr('checked'))
        				{
        					$("#rbtnl_7").attr('checked',false);
        				}
        				$(".trade").show();
        				tradeType=2;
        				return;
        			}
        			$(".trade").hide();
        			tradeType="";
        		}
        	); 
        	$("#rbtnl_7").click(
        		function(){
        			if($("#rbtnl_7").attr('checked'))
        			{
        				if($("#rbtnl_6").attr('checked'))
        				{
        					$("#rbtnl_6").attr('checked',false);
        				}
        				$(".trade").hide();
        				tradeType=4;
        				return;
        			}
        			$(".trade").hide();
        			tradeType="";
        		}
        	); 
            $("#Button1").click(
            	function(){
            			//alert($("#tradeMoney").val());return;
            			if(checkAll())
            			{
            				$.post(
							"${pageContext.request.contextPath}/order/update",
            				{"order.orderId":$("#id").val(),"order.orderMoney":parseFloat($("#money").val()),"order.orderInvoice":$("input[name='order.orderInvoice']:checked").val(),"order.orderPayment":$("#payment").val(),//"order.orderStatus":$("input[name='order.orderStatus']:checked").val(),
            				"send.orderId":$("#id").val(),"send.sendReceiveName":$("#receiveName").val(),"send.sendFullAddress":$("#fullAddress").val(),"send.sendMobile":$("#mobile").val(),"send.sendContent":$("#content").val()
            				,"trade.orderId":$("#id").val(),"trade.tradeType":tradeType,"trade.tradeTime":$("#tradeTime").val(),"trade.tradeMoney":$("#tradeMoney").val(),"trade.tradeNote":$("#tradeNote").val()
            				},
            				function(data)
            				{
            					if(data.ok)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						parent.parent.selectTab("orderList");
                						parent.parent.fresh("orderList");
                						//a little proplem
                						//用同一个页面的关闭问题1，要么用两个页面，2，用session绑个值来判断
                    					parent.parent.closeTab("modifyOrder");
                					}); 
            					} 
            				},
            				"json"
            			);
            			}
            		});
        });  
        function checkMoney()
        {
        	//alert($("#money").val());
        	if($("#money").attr("disabled"))
        	{
        		return true;
        	}
        	var reg=/^\d+[.]?\d{0,2}$/g;
        	if(!reg.test($("#money").val()))
        	{
        		$("#moneyInfo").html("输入大于0数字最多保留2位小数");
        		return false;
        	}else if($("#money").val()<("${order.orderMoney}")*0.9||$("#money").val()>("${order.orderMoney}"))
        	{
        		$("#moneyInfo").html("价格不能高于优惠价或低于其90%");
        		return false;
        	}
        	return true;
        }
        function checkName()
		{
			return checkNull($("#receiveName"),$("#nameInfo"));
		}
		function checkAddr()
		{
			return checkNull($("#fullAddress"),$("#addrInfo"));
		}
		function checkContent()
		{
			return checkNull($("#content"),$("#contentInfo"));
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
			//本身要发票
			if(role==1)
        	{
        		return checkMoney()&flag;
        	} 
        	if($("input[name='order.orderInvoice']:checked").val()==1)
        	{
        		 return checkName()&checkPhone()&checkAddr()&checkContent()&checkMoney()&flag;
        	}
        	return checkMoney()&flag;
		}
        $(function ()
        {
           	$("#receiveName").blur(checkName);
           	$("#fullAddress").blur(checkAddr);
           	$("#mobile").blur(checkPhone);
           	$("#content").blur(checkContent);
           	$("#tradeTime").blur(checkTradeTime);
           	$("#tradeMoney").blur(checkTradeMoney);
           	$("#tradeNote").blur(checkTradeNote);
        });  
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:8px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
        .invoice {display:none;}
        .trade{display:none;}
    </style>

</head>

<body style="padding:10px">

    <form name="form1" method="post"  id="form1" action="">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!-- 测试用，到时候删 -->
        	<tr style="">
                <td align="right" class="l-table-edit-td">订单编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" class="l-text" disabled="disabled" value="${order.orderId}"><input id="id" type="hidden" value="${order.orderId}"></td>
                <td align="left"></td>
            </tr>
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" class="l-text" disabled="disabled" value="${order.stuName }"></td>
                <td align="left"><span style="color:red" id="Info"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">现金劵:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" class="l-text" disabled="disabled" value="${order.student.stuCash }"></td>
                <td align="left"><span style="color:red" id="Info"></span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">订单金额:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input id="money" type="text" class="l-text" disabled="disabled" value="${order.orderMoney }" onblur="checkMoney();"></td>
                <td align="left"><span id="moneyInfo" style="color:red"><a id="modifyMoney" href="javascript:;" onclick="$('#money').attr('disabled',false);">修改</a></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">发票:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_0" type="radio" name="order.orderInvoice" value="0"  /><label for="rbtnl_0">不要</label>&nbsp;&nbsp; <input id="rbtnl_1" type="radio" name="order.orderInvoice" value="1" /><label for="rbtnl_1">要</label>
                </td><td align="left"></td>
            </tr>
            <!-- !!!!!!!!!!!!!!要发票，需要填写寄送地址等等!!!!!!!!!!!!!!!!!!! -->
            <tr class="invoice">
                <td align="right" class="l-table-edit-td">收件人:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="send.sendReceiveName" type="text" id="receiveName" value="" /></td>
                <td align="left"><span style="color:red" id="nameInfo">*</span></td>
            </tr>
           <tr class="invoice">
                <td align="right" class="l-table-edit-td">地址:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="send.sendFullAddress" type="text" id="fullAddress" value="" /></td>
                <td align="left"><span style="color:red" id="addrInfo">*</span></td>
            </tr>
             <tr class="invoice">
                <td align="right" class="l-table-edit-td">电话:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" type="text" id="mobile" value="" name="send.sendMobile"/></td>
                <td align="left"><span style="color:red" id="phoneInfo">*</span></td>
            </tr>
            <tr class="invoice">
                <td align="right" class="l-table-edit-td">邮编:</td>
             	<td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="send.sendPostalCode" type="text" id="postalCode" value="" /></td>
                <td align="left"><span style="color:red" id="codeInfo"></span></td>
            </tr>
             <tr class="invoice">
                <td align="right" class="l-table-edit-td">发票抬头:</td>
                <td align="left" class="l-table-edit-td" colspan="2"> 
                <textarea name="sendContent" cols="100" rows="4" class="l-textarea" id="content" style="width:400px" ></textarea>
                </td> <td align="left"><span style="color:red" id="contentInfo"></span></td>
            </tr>
            <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            <!-- 
             <tr>
                <td align="right" class="l-table-edit-td" valign="top">状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_2" type="radio" name="order.orderStatus" value="0" checked="checked" /><label for="rbtnl_2">未支付&nbsp;&nbsp;</label>&nbsp;&nbsp; <input id="rbtnl_3"  class="l-radio" type="radio" name="order.orderStatus" value="1" /><label for="rbtnl_3">已付，未发</label>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top"></td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                <input id="rbtnl_4" type="radio" name="order.orderStatus" value="2"  /><label for="rbtnl_4">已付已发</label>&nbsp;&nbsp; <input id="rbtnl_5" type="radio"  class="l-radio"  name="order.orderStatus" value="3" /><label for="rbtnl_5">已过期</label>
                </td><td align="left"></td>
            </tr> -->
            <s:if test="order.orderStatus==0">
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">支付方式:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                <input id="rbtnl_6" type="checkbox" name="trade.tradeType" value="2"/><label for="rbtnl_2">其他方式&nbsp;&nbsp;</label>
                <s:if test="order.student.stuCash>=order.orderMoney">
                    <input id="rbtnl_7" type="checkbox" name="trade.tradeType" value="4"/><label for="rbtnl_3">余额支付&nbsp;&nbsp;</label>
                </s:if>
                <s:else>
                <input id="rbtnl_7" type="checkbox" name="trade.tradeType" value="4" disabled="disabled"/><label for="rbtnl_3">余额支付&nbsp;&nbsp;</label>
                </s:else>
                </td><td align="left"></td>
            </tr>
            <tr>
            <tr class="trade">
                <td align="right" class="l-table-edit-td">支付时间:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" type="text" id="tradeTime" value="" name="trade.tradeTime"/></td>
                <td align="left"><span style="color:red" id="tradeTimeInfo">*</span></td>
            </tr>
            <tr class="trade">
                <td align="right" class="l-table-edit-td">支付方式:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
               		<select name="order.orderPayment" class="l-select" id="payment" ltype="select">
               			<option value="1" selected="selected">支付宝支付</option>
               			<option value="2">网银支付</option>
						<option value="4">农业银行汇款</option>
						<option value="5">建设银行汇款</option>
						<option value="6">工商银行汇款</option>
						<option value="7">中国银行汇款</option>
						<option value="8">邮政储蓄银行汇款</option>
					</select>
                <td align="left"><span style="color:red" id="tradeTimeInfo">*</span></td>
            </tr>
            <tr class="trade">
                <td align="right" class="l-table-edit-td">支付金额:</td>
             	<td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="trade.tradeMoney" type="text" id="tradeMoney" value="" /></td>
                <td align="left"><span style="color:red" id="tradeMoneyInfo">*</span></td>
            </tr>
             <tr class="trade">
                <td align="right" class="l-table-edit-td">支付备注:</td>
                <td align="left" class="l-table-edit-td" colspan="2"> 
                <textarea name="trade.tradeNote" cols="100" rows="4" class="l-textarea" id="tradeNote" style="width:400px" ></textarea>
                </td> <td align="left"><span style="color:red" id="tradeNoteInfo">*</span></td>
            </tr>
            </s:if>
            <!-- 银行汇款的怎么玩？--

              <tr>
                <td align="right" class="l-table-edit-td" valign="top">备注:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                <textarea name="order.orderNote" cols="100" rows="4" class="l-textarea" id="description" style="width:400px" validate="{required:true}" ></textarea>
                </td><td align="left"></td>
            </tr>
            -->
        </table>
 <br />
<input type="button" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="reset" value="重置" class="l-button l-button-test"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>    
</body>
</html>
