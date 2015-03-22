<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>
</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerRadio.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script type="text/javascript">
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
		function checkAll()
		{
			return checkName()&&checkPhone()&&checkAddr()&&checkContent();
		}
        $(function ()
        {
        	var id = parent.$("iframe[name='modifyOrder']")[0].contentWindow.getOrderId();
           	$("#receiveName").blur(checkName);
           	$("#fullAddress").blur(checkAddr);
           	$("#mobile").blur(checkPhone);
           	$("#content").blur(checkContent);
        });  
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>

</head>

<body style="padding:10px">

    <form name="form1" method="post"  id="form1" action="">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!-- 测试用，到时候删 -->
        	<tr style="">
                <td align="right" class="l-table-edit-td">订单编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="send.orderId" type="text" id="id" value="${orderId} " disabled="disabled"/></td>
                <td align="left"></td>
            </tr>
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">收件人:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="send.sendReceiveName" type="text" id="receiveName" value="" /></td>
                <td align="left"><span style="color:red" id="nameInfo">*</span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">地址:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="send.sendFullAddress" type="text" id="fullAddress" value="" /></td>
                <td align="left"><span style="color:red" id="addrInfo">*</span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">电话:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" type="text" id="mobile" value="" name="send.sendMobile"/></td>
                <td align="left"><span style="color:red" id="phoneInfo">*</span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">邮编:</td>
             	<td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="send.sendPostalCode" type="text" id="postalCode" value="" /></td>
                <td align="left"><span style="color:red" id="codeInfo"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">发票抬头:</td>
                <td align="left" class="l-table-edit-td" colspan="2"> 
                <textarea name="sendContent" cols="100" rows="4" class="l-textarea" id="content" style="width:400px" validate="{required:true}" ></textarea>
                </td> <td align="left"><span style="color:red" id="contentInfo"></span></td>
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
