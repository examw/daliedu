<%@ page language="java" contentType="text/html; charset= utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
   	<script type="text/javascript">
    	 var username;
    	 var email;
        $(function ()
        {	
            username = $("#txtName").ligerTextBox({ disabled: true });
         	username.setDisabled();
        }); 
         $(function ()
        {
            email = $("#txtEmail").ligerTextBox({ disabled: true });
         	email.setDisabled();
        }); 
	
			var phone=false;
			$(function(){
				$("#txtPhone").blur(function(){
					var txt=$("#txtPhone").val();
					if(txt==""){
						phone=true;
						return ;
					}
					var reg=/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/;
					if(!reg.test(txt)){
						$("#phoneValidMsg").html("<img src='${pageContext.request.contextPath}/cms/images/icon/delete.gif'/>");
						phone=false;
						return;
					}else{
						$("#phoneValidMsg").html("<img src='${pageContext.request.contextPath}/cms/images/icon/right.gif'/>");
						phone=true;
						return;
					}
				});
			});
			
			var mobile=false;
			$(function(){
			$("#txtMobile").blur(function(){
					var txt=$("#txtMobile").val();
					if(txt==""){
						mobile=true;
						return ;
					}
					var reg=/^(\+86|0086)?\s?\d{11}$/;
					if(!reg.test(txt)){
						$("#mobileValidMsg").html("<img src='${pageContext.request.contextPath}/cms/images/icon/delete.gif'/>");
						mobile=false;
						return;
					}else{
						$("#mobileValidMsg").html("<img src='${pageContext.request.contextPath}/cms/images/icon/right.gif'/>");
						mobile=true;
						return;
					}
				});
				
			});
			
			$(function(){
				$("#form1").submit(function(){
					$("#txtPhone").blur();
					$("#txtMobile").blur();
					if(!(phone&&mobile)){
						return false;
					}
					window.returnValue="1";
    				window.close();
    				alert("111");
					return true;
				});
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

    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/user/studentModify">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<tr>
        		<td><input value="${stu.stuId}" name="stu.stuId"  type="hidden"></td>
        	</tr>
            <tr>
                <td align="right" class="l-table-edit-td">用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input  value="${stu.stuUsername}"  name="stu.stuUsername" type="text" id="txtName" ltype="text" validate="{required:true,minlength:3,maxlength:10,disabled:true}" /></td>
                <td align="left"></td>
            </tr>
     		 <tr>
                <td align="right" class="l-table-edit-td">Email:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input name="stu.stuEmail" value="${stu.stuEmail}" type="text" id="txtEmail" ltype="text" validate="{required:true,email:true,disabled:true}" /></td>
                <td align="left"></td>
            </tr>
           <s:if test="stu.stuStatus==0">
           	<tr>
                <td align="right" class="l-table-edit-td" valign="top">状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_0" type="radio" name="rbtnl" value="0" checked="checked" /><label for="rbtnl_0">正常</label> <input id="rbtnl_1" type="radio" name="rbtnl" value="1" /><label for="rbtnl_1">冻结</label>
                </td><td align="left"></td>
            </tr>   
           </s:if>
           <s:else>
           		<tr>
                	<td align="right" class="l-table-edit-td" valign="top">状态:</td>
                	<td align="left" class="l-table-edit-td" style="width:160px">
                    	<input id="rbtnl_0" type="radio" name="rbtnl" value="0" /><label for="rbtnl_0">正常</label> <input id="rbtnl_1" type="radio" name="rbtnl" value="1" checked="checked"  /><label for="rbtnl_1">冻结</label>
                	</td><td align="left"></td>
           		</tr> 
           </s:else>
             <tr>
                <td align="right" class="l-table-edit-td">电话:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input name="stu.stuPhone" value="${stu.stuPhone}" type="text" id="txtPhone" ltype="text"  /></td>
                <td align="left" id="phoneValidMsg"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">手机:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input name="stu.stuMobile" value="${stu.stuMobile}" type="text" id="txtMobile" ltype="text"  /></td>
                <td align="left" id="mobileValidMsg"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">地址:</td>
                <td align="left" class="l-table-edit-td" colspan="2"> 
                <textarea cols="100" rows="2" class="l-textarea" id="address" style="width:400px" validate="{required:true}" ></textarea>
                </td> <td align="left"></td>
            </tr>
        </table>
 <br />
	<input type="submit" value="提交" id="Button1" class="l-button l-button-submit"  /> <span id="s1" style="color:red"></span>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>

    
</body>
</html></html>
