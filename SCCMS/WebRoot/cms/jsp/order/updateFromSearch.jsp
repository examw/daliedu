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
    <script type="text/javascript">
        //var eee;
        $(function ()
        {
        	var status = "${order.orderStatus}";
        	var role ="${order.orderInvoice}";
        	if(status==0){$("#rbtnl_2").attr('checked','checked');}
        	else if(status==1){$("#rbtnl_3").attr('checked','checked');}
        	else if(status==2){$("#rbtnl_4").attr('checked','checked');}
        	else{$("#rbtnl_5").attr('checked','checked');}
        	if(role==1)
        	{
        		$("#rbtnl_1").attr('checked','checked');
        	}else
        		$("#rbtnl_0").attr('checked','checked');
            $("#Button1").click(
            	function(){
            			$.post(
							"${pageContext.request.contextPath}/order/update",
            				{"order.orderId":$("#id").val(),"order.orderInvoice":$("input[name='order.orderInvoice']:checked").val(),"order.orderStatus":$("input[name='order.orderStatus']:checked").val()},
            				function(data)
            				{
            					if(data.ok)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						parent.addTab('detail','${pageContext.request.contextPath}/order/load?search=2&id='+data.id,'修改成功');
                						//parent.selectTab("search");
                						//parent.fresh("search");
                						//a little proplem
                						//用同一个页面的关闭问题1，要么用两个页面，2，用session绑个值来判断
                    					parent.closeTab("modify1");
                					}); 
            					} 
            				},
            				"json"
            			
            			);
            		});
        });  
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
        	<!-- 测试用，到时候删 -->
        	<tr style="">
                <td align="right" class="l-table-edit-td">订单编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >${order.orderId }<input id="id" type="hidden" value="${order.orderId}"></td>
                <td align="left"></td>
            </tr>
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >${order.stuName }</td>
                <td align="left"><span style="color:red" id="nameInfo"></span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">订单金额:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >${order.orderMoney }</td>
                <td align="left"><span style="color:red" id="pwdInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">发票:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_0" type="radio" name="order.orderInvoice" value="0" checked="checked" /><label for="rbtnl_0">不要</label>&nbsp;&nbsp; <input id="rbtnl_1" type="radio" name="order.orderInvoice" value="1" /><label for="rbtnl_1">要</label>
                </td><td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td" valign="top">状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_2" type="radio" name="order.orderStatus" value="0" checked="checked" /></a><label for="rbtnl_2">未支付&nbsp;&nbsp;</label>&nbsp;&nbsp; <input id="rbtnl_3"  class="l-radio" type="radio" name="order.orderStatus" value="1" /><label for="rbtnl_3">已付，未发</label>
                </td><td align="left"></td>
            </tr>  
            <tr>
                <td align="right" class="l-table-edit-td" valign="top"></td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                <input id="rbtnl_4" type="radio" name="order.orderStatus" value="2"  /><label for="rbtnl_4">已付已发</label>&nbsp;&nbsp; <input id="rbtnl_5" type="radio"  class="l-radio"  name="order.orderStatus" value="3" /><label for="rbtnl_5">已过期</label>
                </td><td align="left"></td>
            </tr>   
        </table>
 <br />
<input type="button" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="reset" value="重置" class="l-button l-button-test"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>    
</body>
</html>
