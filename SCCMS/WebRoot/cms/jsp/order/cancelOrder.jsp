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
    <script src="${pageContext.request.contextPath}/cms/js/ligerRadio.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTab.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
    <script type="text/javascript">
        //var eee;
        var invoice = "${order.orderInvoice}";
        var status = "${order.orderStatus}";
        $(function ()
        {
        	//初始化表单
        	$("form").ligerForm();
        	var cash = "${cash}";
        	var card ="${card}";
        	if(cash==0){$("#trCash").hide();$("#trCard").show();}
        	else if(card==0){$("#trCard").hide();$("#trCash").show();}
        	else{$("#trCash").show();$("#trCard").show();}
        	//
        	if(invoice==0) $("#invoice").val("不要发票");
        	else $("#invoice").val("要发票");
        	//
        	if(status==1)
        	{
        		$("#cash").attr("disabled",false);
        		$("#acash").attr("onclick","");
        	}
        	$("#cash").blur(checkCash);
        	$("#card").blur(checkCard);
            $("#Button1").click(
            	function(){
            			//判断有没有寄回
            			if(!checkSendBack())
            			{
            				return false;
            			}
            			if(checkCard()&&checkCash())
            			{
            				$.post(
							"${pageContext.request.contextPath}/order/cancelOrder",
            				{"orderId":"${order.orderId}","cash":$("#cash").val(),"card":$("#card").val()},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						parent.parent.selectTab("orderList");
                						parent.parent.fresh("orderList");
                						parent.parent.closeTab("cancel");
                					}); 
            					} 
            				},
            				"json"
            			
            				);
            			}
            		});
        });  
        function checkSendBack()
        {
        	if(status==1) 	//未寄送的状态
        	{
        		return true;
        	}
        	var flag = false;
        	$.ajax({
        		async:false,
        		url:"${pageContext.request.contextPath}/order/checkSendBack",
        		type:"post",
        		data:{"orderId":"${order.orderId}"},
        		success:function(data)
        				{
        					if(data)
        				{
        					$("#cash").attr("disabled",false);
        					flag = true;
        				}else
        				{
        					$.ligerDialog.alert("寄送物品需要寄回了才能返现！");
        				}
        				},
        		dataType:'json'
        		
        	});
        	return flag;
        }
        function checkCard()
        {
        	var reg=/^\d+[.]?\d{0,2}$/g;
			if(!reg.test($.trim($("#card").val())))
			{
				$("#cardInfo").html("必须为数字且最多保留2位小数");
				return false;
			}else if($("#card").val()>"${card}")
			{
				$("#cardInfo").html("想亏本么？");
				return false;
			}
			$("#cardInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
        	return true;
        }
        function checkCash()
        {
        	var reg=/^\d+[.]?\d{0,2}$/g;
			if(!reg.test($.trim($("#cash").val())))
			{
				$("#cashInfo").html("必须为数字且最多保留2位小数");
				return false;
			}else if($("#cash").val()>"${cash}")
			{
				$("#cashInfo").html("想亏本么？");
				return false;
			}
			$("#cashInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
        	return true;
        }
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:8px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>

</head>

<body style="padding:10px">

    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/user/addAdmin">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<tr style="">
                <td align="right" class="l-table-edit-td">订单编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input id="id" type="text" disabled="disabled" value="${order.orderId}"></td>
                <td align="left"></td>
            </tr>
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">用户姓名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input id="name" type="text" disabled="disabled" value="${order.stuName}"></td>
                <td align="left"><span style="color:red" id="nameInfo"></span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">订单金额:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input id="money" type="text" disabled="disabled" value="${order.orderMoney }"></td>
                <td align="left"><span style="color:red" id="pwdInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">发票:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input id="invoice" type="text" disabled="disabled" value="">
                </td><td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td" valign="top">状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input id="status" type="text" disabled="disabled" value="${statusForShow}">
                </td><td align="left"></td>
            </tr>  
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">支付方式</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input id="payment" type="text" disabled="disabled" value="${paymentForShow}">
                </td><td align="left"></td>
            </tr>
            <tr id="trCard" style="display:none;">
                <td align="right" class="l-table-edit-td" valign="top">学习卡支付金额</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input id="card" type="text"  value="${card }">
                </td><td align="left"><span id="cardInfo" style="color:red">输入返给学员学习卡账户的金额</span></td>
            </tr>
            <tr id="trCash" style="display:none;">
                <td align="right" class="l-table-edit-td" valign="top">现金支付金额</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input id="cash" type="text" value="${order.cashMoney }" disabled="disabled">
                </td><td align="left"><span id="cashInfo" style="color:red"><a id="acash" style="text-decoration: underline;cursor:pointer;" onclick="checkSendBack();">输入返给学员现金账户的金额</a></span></td>
            </tr>   
        </table>
 <br />
<input type="button" value="退单" id="Button1" class="l-button l-button-submit" /> 
<input type="button" value="取消" class="l-button l-button-test"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>    
</body>
</html>
