<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerRadio.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTab.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script type="text/javascript">
        //var eee;
        var s;
        $(function ()
        {
        	//初始化combox，快递公司下拉列表
        	s = $("#epc").ligerComboBox({
        			width:160,
        			url:"${pageContext.request.contextPath}/send/companyList?isSelectData=1",
        			valueFieldID: 'test3',
        			textField:'epcName',
        			valueField:'epcId'
        	});
        	//初始化状态
        	var status = "${send.sendStatus}";
        	if(status=='0'||!status){$("#rbtnl_0").attr("checked",'checked');}
        	else if(status=='1'){
        		//$("#rbtnl_0").attr("disabled",'disabled');
        		$("#rbtnl_1").attr("checked",'checked');
        		$(".sending").show();
        		$(".sending input").attr("disabled",true);
        		$(".sent").hide();
        	}
        	else{$("#rbtnl_2").attr('checked','checked');$(".sending").show();$(".sent").show();}
        	//根据状态选择控制填写的内容
        	$("input[name=send.sendStatus]").change(function(){
        		
        		if($("#rbtnl_1").attr("checked"))
        		{
        			$(".sent").hide();
        			$(".sending").show();
        			
        		}else if($("#rbtnl_2").attr("checked"))
        		{
        			$(".sending").show();
        			$(".sent").show();
        		}else{
        			$(".sending").hide();
        			$(".sent").hide();
        		}
        	});
        	//格式化表单
        	$("form").ligerForm();
        	//提交操作
            $("#Button1").click(
            	function(){
            		//如果提交时还是选的未送，直接关闭窗口
            		if(!"${send.sendReceiveName}")
            		{
            			alert("没有送货地址，不能送！");
            			return ;
            		}
            		if((status=='0'&&$("#rbtnl_0").attr("checked"))||(status=='1'&&$("#rbtnl_1").attr("checked")))
            		{
            			parent.closeTab("modifySend");
            			return;
            		}else{
            		   //验证填写的表单
            		   if(checkAll())
            		   {
            			$.post(
							"${pageContext.request.contextPath}/send/updateSend",
            				{"send.sendId":$("#id").val(),"send.sendStatus":$("input[name='send.sendStatus']:checked").val(),"send.epcId":$("#test3").val(),"send.sendPerson":$("#person").val(),"send.sendTime":$("#sendDate").val(),"send.sendConfirmTime":$("#confirmDate").val(),"send.epcName":$("#epc").val(),"send.sendContent":$("input[name='send.sendContent']:checked").val(),"send.sendExpressNo":$("#expressNo").val()},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						//parent.parent.selectTab("sendList");
                						//parent.parent.fresh("sendList");
                						parent.addTab("sendDetail","${pageContext.request.contextPath}/send/sendDetail?sendId=" + $("#id").val(),'寄送详情');
                    					parent.parent.closeTab("modifySend");
                					}); 
            					}
            				},
            				"json"
            			
            			);}
            			}
            		});
            	$(function(){
            		$("#cancel").click(function(){
            			parent.selectTab("sendList");
            			parent.closeTab("modifySend");
            		});
            		$("#person").blur(checkPerson);
            		$("#epc").change(checkEpc);
            		$("#sendDate").change(checkSendDate);
            		$("#confirmDate").change(checkConfirmDate);
            		$("#cost").blur(checkCost);
            		$("#expressNo").blur(checkExpressNo);
            	});
            	
        }); 
        function checkNull(dom,span)
		{
			if(!dom.val()||!$.trim(dom.val()))
			{
				span.html("此项不能为空");
				return false;
			}else
			{
				span.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
				return true;
			}
		} 
		function checkExpressNo()
		{
			return checkNull($("#expressNo"),$("#expressNoInfo"));
		}
        function checkPerson()
        {
        	return checkNull($("#person"),$("#personInfo"));
        }
        //寄送时间不能比寄送单添加时间(也就是支付时间)更早
        function checkSendDate()
        {
        	var sendAddTime = "${send.sendAddTime}";
        	if(!$("#sendDate").val()||!$.trim($("#sendDate").val()))
        	{
        		$("#sendDateInfo").html("请选择日期");
        		return false;
        	}else if(Date.parse($("#sendDate").val())<Date.parse(sendAddTime.replace(/[-]/g,'/').substring(0,19)))
        	{
        		$("#sendDateInfo").html("请认真选择");
        		return false;
        	}
        	$("#sendDateInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
        	return true;
        }
        function checkEpc()
        {
        	return checkNull($("#epc"),$("#epcInfo"));
        }
        //确认时间不能比寄送时间早
        function checkConfirmDate()
        {
        	if($("#rbtnl_1").attr("checked")) return true;
        	if(!$("#confirmDate").val()||!$.trim($("#confirmDate").val()))
        	{
        		$("#confirmDateInfo").html("请选择日期");
        		return false;
        	}else if(Date.parse($("#confirmDate").val())<Date.parse($("#sendDate").val()))
        	{
        		$("#confirmDateInfo").html("请认真选择");
        		return false;
        	}
        	$("#confirmDateInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
        	return true;
        }
        function checkCost()
        {
        	//alert($("#cost"));
        	if(!$("#cost").val()||!$.trim($("#cost").val()))
			{
				$("#costInfo").html("数量不能为空");
				return false;
			}
			reg=/^\d+[.]?\d{0,2}$/g;
			if(!reg.test($.trim($("#cost").val())))
			{
				$("#costInfo").html("必须为数字且最多保留2位小数");
				return false;
			}
			$("#costInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
        	return true;
        }
        function checkAll()
        {
        	if(status=='1')
        	{
        		return checkConfirmDate();
        	}
        	return checkPerson()&checkSendDate()&checkEpc()&checkConfirmDate()&checkCost()&checkExpressNo();
        }
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .sending{display:none;}
         .sent{display:none;}
        .l-table-edit-td{ padding:8px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
        
    </style>

</head>

<body style="padding:10px">

    <form name="form1" method="post"  id="form1" action="">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" align="center">
        	<!-- 测试用，到时候删 -->
        	<tr style="">
                <td align="right" class="l-table-edit-td">寄送编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" value="${send.sendId }" disabled="disabled" id="id"/></td>
                <td align="left"></td>
            </tr>
            <tr style="">
                <td align="right" class="l-table-edit-td">订单编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" value="${send.order.orderId }" disabled="disabled"/></td>
                <td align="left"></td>
            </tr>
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">寄送详细:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><textarea rows="3" cols="26" disabled="disabled">${send.sendContent }</textarea></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">收货人:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" value="${send.sendReceiveName }" disabled="disabled"/></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">送货地址:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" value="${send.sendFullAddress }" disabled="disabled"/></td>
                <td align="left"></td>
            </tr>
            <tr>
            <td align="right" class="l-table-edit-td" valign="top">寄送状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_0" type="radio" ltype="radio" name="send.sendStatus" value="0" /><label for="rbtnl_0">未送</label>&nbsp;&nbsp; 
                    <input id="rbtnl_1" type="radio" name="send.sendStatus" value="1" /><label for="rbtnl_1">正送</label>&nbsp;&nbsp;
                    <input id="rbtnl_2" type="radio" name="send.sendStatus" value="2" /><label for="rbtnl_2">已送</label>
                </td><td align="left"></td>
            </tr>
           	<tr class="sending">
                <td align="right" class="l-table-edit-td">寄送人:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" id="person" name="send.sendPerson" value="${send.sendPerson }"/></td>
                <td align="left"><span style="color:red" id="personInfo"></span></td>
            </tr>
            <tr class="sending">
                <td align="right" class="l-table-edit-td">花费:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input type="text" id="cost" name="send.sendCost" value="${send.sendCost }"/></td>
                <td align="left"><span style="color:red" id="costInfo"></span></td>
            </tr>
            <tr class="sending">
                <td align="right" class="l-table-edit-td">快递公司:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
                <s:if test="send.sendStatus!=0">
                	<input type="text" id="epc" value="${send.epcName}"/>
                </s:if>
                <s:else>
                <input type="text" id="epc" value="${send.epcName}"/>
                </s:else>
                </td>
                <td align="left"><span style="color:red" id="epcInfo"></span></td>
            </tr>
            <tr class="sending">
                <td align="right" class="l-table-edit-td">快递单号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
                <input type="text" id="expressNo" name="send.sendExpressNo" value="${send.sendExpressNo }"/>
                </td>
                <td align="left"><span style="color:red" id="expressNoInfo"></span></td>
            </tr>
            <tr class="sending">
                <td align="right" class="l-table-edit-td">寄送时间:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
               <s:if test="send.sendStatus!=0">
                	<input type="text" id="sendDate" value="${send.sendTime}"/>
                </s:if>
                <s:else>
                <input id="sendDate" name="date" type="text" disabled="disabled" ltype="date" value="<fmt:formatDate value="${send.sendTime}" type="date" />">
                </s:else>
                </td>
                <td align="left"><span style="color:red" id="sendDateInfo"></span></td>
            </tr>
           <!--  <tr class="sending">
                <td align="right" class="l-table-edit-td">寄送内容:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
                	<input id="rbtnl_3" type="radio" name="send.sendContent" value="发票" checked="checked" /><label for="rbtnl_3">发票</label>
                	<input id="rbtnl_4" type="radio" name="send.sendContent" value="教材" /><label for="rbtnl_4">教材</label>
                </td>
                <td align="left"><span style="color:red" id="sendDateInfo"></span></td>
            </tr> -->
            <tr class="sent">
                <td align="right" class="l-table-edit-td">确认时间:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input id="confirmDate" type="text" ltype="date"></td>
                <td align="left"><span style="color:red" id="confirmDateInfo"></span></td>
            </tr>
            <tr>
            	<td colspan="3">
            		<input type="button" value="提交" id="Button1" class="l-button l-button-submit" /> 
					<input type="button" value="取消" id="cancel" class="l-button l-button-test"/>
            	</td>
            </tr>
        </table>
 <br />

    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>    
</body>
</html>
