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
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script type="text/javascript">
        //var eee;
        function checkUsername()
        {
        	var flag=false;
        	var name=$("#username").val();
        	var o_name="${admin.admUsername}";
        	var $nameInfo=$("#nameInfo");
        	if(!name||!$.trim(name))
        	{
        		$nameInfo.html("用户名不合法");
				return false;
        	}
			var reg=/[0-9a-z\u4E00-\u9FA5]+/;
			if(reg.test(name))
			{
				//符合命名规则，ajax验证
				if(name==o_name)
				{
					$nameInfo.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
					flag=true;
				}else{
				$.ajax({
					async:false,
					url:"${pageContext.request.contextPath}/user/checkAdmin",
					data:{"admUsername":$("#username").val()},
					success:function(data)
					{
						if(data)
						{
							$nameInfo.html("该用户名已经被注册");
						}else
						{
							$nameInfo.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
							flag=true;
						}
					},
					dataType:"json"
					});}
					return flag;
			}
			else
			{
				$nameInfo.html("用户名不合法");
				return false;
			}
        }
        function checkPassword()
		{
			var pwd=$("#pwd").attr("value");
			var $pwdInfo=$("#pwdInfo");
			var reg=/[a-zA-z0-9]+/;
			if(pwd.length<6||pwd.length>20||!reg.test(pwd))
			{
				$pwdInfo.html("密码不合法");
				return false;
			}else
			{
				$pwdInfo.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
				return true;
		}
		}
		function checkRepeatPwd()
		{
			var pwd = $("#pwd").attr("value");
			var $pwd1Info=$("#pwd2Info");
			var pwd1 = $("#pwd2").attr("value");
			if(pwd1&&(!pwd1.indexOf(pwd)&&pwd.length==pwd1.length))
			{
				$pwd1Info.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
				return true;
			}else
			{		
				$pwd1Info.html("输入有误,请重新输入");
				 $("#pwd2").attr("value","");
				return false;
			}
		}
		function checkName()
		{
			return checkNull($("#name"),$("#info"));
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
		function checkAll()
		{
			return checkUsername()&&checkName()&&checkPassword()&&checkRepeatPwd();
		}
        $(function ()
        {
        	var status = "${admin.admStatus}";
        	var role ="${admin.admRole}";
        	if(status==0)
        	{
        		$("#rbtnl_1").attr('checked','checked');
        	}else
        		$("#rbtnl_0").attr('checked','checked');
        	if(role==1)
        	{
        		$("#rbtnl_3").attr('checked','checked');
        	}else
        		$("#rbtnl_2").attr('checked','checked');
            $("#Button1").click(
            	function(){
            		if(checkAll())
            		{
            			$.post(
            				"${pageContext.request.contextPath}/user/updateAdmin",
            				{"admin.admId":$("#id").val(),
            				"admin.admUsername":$("#username").val(),
            				"admin.admPassword":$("#pwd").val(),
            				"admin.admName":$("#name").val(),
            				"admin.admStatus":$("input[name='admin.admStatus']:checked").val(),
            				roleId:$("#roleId").val()},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						parent.parent.fresh("admList");
                						parent.parent.closeTab("modifyAdmin");
                						parent.$("iframe[name='searchAdmin']")[0].contentWindow.f_reload();
                						parent.closeTab("modifyAdmin1");
                					}); 
            					}else
            					{
            						$.ligerDialog.alert("操作失败,该记录可能不存在",function(){
            							parent.parent.fresh("admList");
            							parent.parent.closeTabAndFresh("modifyAdmin");
            						});
            					};
            				},
            				"json"
            			
            			);
            		};
            		
            });
           	$("#username").blur(checkUsername);
           	$("#pwd").blur(checkPassword);
           	$("#pwd2").blur(checkRepeatPwd);
           	$("#name").blur(checkName);
        });  
        
        $(function(){
				$("#class").ligerComboBox({
                width: 130,
                slide: false,
                selectBoxWidth: 130,
                selectBoxHeight: 150, 
                valueField: 'roleId', 
                textField: 'roleName',
                valueFieldID: 'roleId',
                initValue:'${admin.role.roleId }',
        		url:"${pageContext.request.contextPath}/system/role"
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

    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/user/addAdmin">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<tr style="display:none">
                <td align="right" class="l-table-edit-td">编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="admin.admId" type="text" id="id" value="${admin.admId }"ltype="text" validate="{required:true,minlength:3,maxlength:10,notnull:true}" nullText="不能为空!"/></td>
                <td align="left"></td>
            </tr>
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="admin.admUsername" type="text" id="username" value="${admin.admUsername}" ltype="text" validate="{required:true,minlength:3,maxlength:10,notnull:true}" nullText="不能为空!"/></td>
                <td align="left"><span style="color:red" id="nameInfo"></span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">密码:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="admin.admPassword" type="password" id="pwd" value="${admin.admPassword}" ltype="text" validate="{required:true,minlength:3,maxlength:10,notnull:true}" nullText="不能为空!"/></td>
                <td align="left"><span style="color:red" id="pwdInfo"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">重复密码:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" type="password" id="pwd2" ltype="text" validate="{required:true,minlength:3,maxlength:10,notnull:true}" nullText="不能为空!"/></td>
                <td align="left"><span style="color:red" id="pwd2Info"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">姓名:</td>
             	<td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="admin.admName" type="text" id="name" value="${admin.admName}" ltype="text" validate="{required:true,minlength:3,maxlength:10,notnull:true}" nullText="不能为空!"/></td>
                <td align="left"><span style="color:red" id="info"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">管理组:</td>
                <td align="left" class="l-table-edit-td" >
                <input type="text" id="class" name="grade"  validate="{required:true}"/>
                </td> 
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td" valign="top">状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_0" type="radio" name="admin.admStatus" value="1" checked="checked" /><label for="rbtnl_0">启用</label>&nbsp;&nbsp; <input id="rbtnl_1" type="radio" name="admin.admStatus" value="0" /><label for="rbtnl_1">禁用</label>
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
