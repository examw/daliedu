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
			return checkNull($("#name"),$("#nameInfo"));
		}
		function checkAddr()
		{
			return checkNull($("#addr"),$("#addrInfo"));
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
			var phone = $("#phone").val();
			if(!phone||!$.trim(phone))
			{
				$("#phoneInfo").html("电话号码不能为空");
				return false;
			}
			reg=/[0-9]{8,12}/;
			if(/\D/.test(phone)) 
			{
				$("#phoneInfo").html("电话号码不合法");
				return false;
			}
			else if(reg.test(phone))
			{
				$("#phoneInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'/>");
				return true;
			}else
			{
				$("#phoneInfo").html("电话号码不合法");
				return false;
			}
		}
		function checkUrl()
		{
			var url = $("#url").val();
			if(!url||!$.trim(url))
			{
				$("#urlInfo").html("网址不能为空");
				return false;
			}
			if(IsURL(url))
			{
				$("#urlInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'/>");
				return true;
			}
			else
			{
				$("#urlInfo").html("网址不合法");
				return false;
			}
		}
		function IsURL(str_url){
        var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
        + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
        + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
        + "|" // 允许IP和DOMAIN（域名）
        + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
        + "[a-z]{2,6})" // first level domain- .com or .museum
        + "(:[0-9]{1,4})?" // 端口- :80
        + "((/?)|" // a slash isn't required if there is no file name
        + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
        var re=new RegExp(strRegex);
        //re.test()
        if (re.test(str_url)){
            return (true);
        }else{
            return (false);
        }
		}
		function checkOrderId()
		{
			$("#info").hide();
			var orderId = $("#orderId").val();
			if(!orderId||!$.trim(orderId))
			{
				$("#orderIdInfo").html("此项不能为空");
				return false;
			}
			var reg=/[1-9]{1,1}/;
			if(reg.test(orderId)&&orderId.length==1)
			{
				$("#orderIdInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'/>");
				return true;
			}
			$("#orderIdInfo").html("请输入1-9的数字");
			return false;
		}
		function checkAll()
		{
			return checkName()&&checkPhone()&&checkAddr()&&checkUrl()&&checkOrderId();
		}
        $(function ()
        {
        	//由于用的是同一个页面，判断有值的话,更改表单提交的action
        	var name="${company.epcName}";
        	if(name!=""){$("#form1").attr("action","${pageContext.request.contextPath}/send/updateCompany"); }
            $("#Button1").click(
            	function(){
            		if(checkAll())
            		{
            			$.post(
            				$("#form1").attr("action"),
            				{"company.epcId":$("#id").val(),"company.epcName":$("#name").val(),"company.epcPhone":$("#phone").val(),"company.epcAddr":$("#addr").val(),"company.epcUrl":$("#url").val(),"company.epcOrderId":$("#orderId").val()},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						//parent.selectTab("companyList");
                						parent.fresh("epcList");
                    					if(name=="")parent.closeTab("addEpc");
                    					else parent.closeTab("modifyEpc");
                    					
                					}); 
            					}else
            					{
            						$.ligerDialog.success( '操作失败!', function ()
                					{
                						parent.selectTab("epcList");
                						parent.fresh("epcList");
                    					if(name=="")parent.closeTab("addEpc");
                    					else parent.closeTab("modifyEpc");
                    					
                					}); 
            					}
            				},
            				"json"
            			
            			);
            		}
            		
            });
           	$("#name").blur(checkName);
           	$("#addr").blur(checkAddr);
           	$("#phone").blur(checkPhone);
           	$("#url").blur(checkUrl);
           	$("#orderId").blur(checkOrderId);
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

    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/send/addCompany">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!-- 测试用，到时候删 -->
        	<tr style="display:none">
                <td align="right" class="l-table-edit-td">编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="company.epcId" type="text" id="id" value="${company.epcId }"/></td>
                <td align="left"></td>
            </tr>
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">公司名称:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="company.epcName" type="text" id="name" value="${company.epcName}" /></td>
                <td align="left"><span style="color:red" id="nameInfo"></span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">地址:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="company.epcAddr" type="text" id="addr" value="${company.epcAddr}" /></td>
                <td align="left"><span style="color:red" id="addrInfo"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">电话:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" type="text" id="phone" value="${company.epcPhone}" name="company.epcPhone"/></td>
                <td align="left"><span style="color:red" id="phoneInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">网址:</td>
             	<td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="company.epcUrl" type="text" id="url" value="${company.epcUrl}" /></td>
                <td align="left"><span style="color:red" id="urlInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">排序:</td>
             	<td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="company.epcOrderId" type="text" id="orderId" value="${company.epcOrderId}" /></td>
                <td align="left"><span id="info">请输入1-9的数字</span><span style="color:red" id="orderIdInfo"></span></td>
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
