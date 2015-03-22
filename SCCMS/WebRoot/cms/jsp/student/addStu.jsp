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
     <script src="${pageContext.request.contextPath}/cms/js/jquery.blockUI.js" type="text/javascript"></script> 
    <script type="text/javascript">
        //var eee;
        var ckusername,ckemail,ckname,ckqq,ckphone,ckpwd;
        ckusername=ckemail=ckname=ckqq=ckphone=ckpwd=false;
        function checkUsername()
        {
        	var name=$("#username").val();
        	var $nameInfo=$("#nameInfo");
        	var flag=false;
        	if(!name||!$.trim(name))
        	{
        		$nameInfo.html("用户名不合法");
        		ckusername = false;
				return false;
        	}
			var reg=/[0-9a-z\u4E00-\u9FA5]+/;
			if(reg.test(name))
			{
				//符合命名规则，ajax验证
				$.ajax({
					async:true,
					url:"${pageContext.request.contextPath}/user/checkUsername",
					data:{"username":$("#username").val()},
					success:function(data)
					{
						if(data)
						{
							$nameInfo.html("该用户名已经被注册");
							ckusername = false;
						}else
						{
							$nameInfo.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
							flag = true;
							ckusername = true;
						}
					},
					dataType:"json"
					});
					return flag;
			}
			else
			{
				$nameInfo.html("用户名不合法");
				ckusername = false;
				return false;
			}
        }
      //检查email
        function checkEmail() {
        	//input,span为jquery对象�
        	var input = $("#email");
        	var span = $("#emailInfo");
        	var flag = false;
        	if (!input.val() || !$.trim(input.val())) {
        		span.html("<p class='error'>Email不能为空</p>");
        		ckemail = false;
        		return false;
        	} else {
        		var reg = /[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+/;
        		if (!reg.test(input.val())) {
        			span.html("<p class='error'>Email不合法</p>");
        			ckemail = false;
        			return false;
        		} else {
        			$.ajax({
        				async : true,
        				url : "${pageContext.request.contextPath}/user/checkEmail",
        				type : "post",
        				data : "email=" + input.val(),
        				success : function(data) {
        					if (data=='true') {
        						span.html("<p class='error'>该Email已经被注册</p>");
        						ckemail = false;
        						flag = false;
        					} else {
        						span.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
        						ckemail = true;
        						flag = true;
        					}
        				}
        			});
        			return flag;
        		}

        	}
        }
        //检查QQ
        function checkQICQ(){
         	var qq=$("#qq").val();
         	var $qqInfo = $("#qqInfo");
         	var reg=/^\d{5,10}$/; 
         	if(qq!=""&&!reg.test(qq)){
         		$qqInfo.html("<p class='error'>请输入正确格式的QQ号码</p>");
         		ckqq = false;
         		return false;
         	}else if(qq==""){
         		$qqInfo.html("");
         		ckqq = true;
         		return true;
         	}else{
         		$qqInfo.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
         		ckqq = true;
         		return true;
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
				ckpwd = false;
				return false;
			}else
			{
				$pwdInfo.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
				ckpwd = true;
				return true;
		}
		}
		/*function checkRepeatPwd()
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
		}*/
		function checkName()
		{
			ckname =  checkNull($("#name"),$("#info"));
			return ckname;
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
				ckphone = false;
				return false;
			}
			reg=/^1[3,4,5,6,8]{1}[0-9]{9}$/;
			if(/\D/.test(phone)) 
			{
				$("#phoneInfo").html("电话号码不合法");
				ckphone = false;
				return false;
			}
			else if(reg.test(phone))
			{
				$.ajax({
    				async : false,
    				url : "${pageContext.request.contextPath}/user/checkMobile",
    				type : "post",
    				data : "phone=" + phone,
    				success : function(data) {
    					if (data=='true') {
    						$("#phoneInfo").html("<p class='error'>该手机已经被注册</p>");
    						ckphone = false;
    						flag = false;
    					} else {
    						$("#phoneInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
    						ckphone = true;
    						flag = true;
    					}
    				}
    			});
			}else
			{
				$("#phoneInfo").html("电话号码不合法");
				ckphone = false;
				return false;
			}
		}
		function checkAll()
		{
			if(!ckusername){checkUsername();}
			if(!ckname&&ckusername){checkName();}
			if(!ckpwd&&ckusername&&ckname){checkPassword();}
			if(!ckphone&&ckusername&&ckname&&ckpwd){checkPhone();}
			if(!ckemail&&ckusername&&ckname&&ckpwd&&ckphone){checkEmail();}
			if(!ckqq&&ckusername&&ckname&&ckpwd&&ckphone&&ckemail){return checkQICQ();}
			if(ckqq&&ckusername&&ckname&&ckpwd&&ckphone&&ckemail){return true;}
			return false;
			//return checkUsername()&&checkName()&&checkPassword()&&checkPhone()&&checkEmail()&&checkQICQ();
		}
        $(function ()
        {
            $("#Button1").click(
            	function(){
            		if(checkAll())
            		{
            			$.blockUI({ message: "<h1>提交中...</h1>"});
            			$.post(
            				"${pageContext.request.contextPath}/user/addStudent",
            				{"stu.stuUsername":$("#username").val(),"stu.stuPassword":$("#pwd").val(),"stu.stuName":$("#name").val(),"stu.stuEmail":$("#email").val(),"stu.stuStatus":$("input[name='stu.stuStatus']:checked").val(),
            					"stu.stuSex":$("input[name='stu.stuSex']:checked").val(),"stu.stuMobile":$("#phone").val(),"stu.QICQ":$("#qq").val()},
            				function(data){
            					$.unblockUI();
            					if(!data.IsError)
            					{
            						$.ligerDialog.alert("操作成功",function(){
            								//parent.parent.fresh("teacherList");
            								parent.parent.isUpdated = true;
            								parent.parent.closeTab("addStudent");
            								//parent.parent.selectTab("teacherList");
            						});
            					}else
            					{
            						$.ligerDialog.alert("操作失败",function(){});
            					}
            				},
            				"json"
            			);
            		}
            		});
           	$("#username").blur(checkUsername);
           	$("#pwd").blur(checkPassword);
           	$("#email").blur(checkEmail);
           	$("#name").blur(checkName);
           	$("#phone").blur(checkPhone);
           	$("#qq").blur(checkQICQ);
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

  <!--   <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/user/addTeacher"> -->
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!--  -------------------------  -->
        		 <tr>
                <td align="right" class="l-table-edit-td">用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="stu.stuUsername" type="text" id="username" value="" /></td>
                <td align="left"><span style="color:red" id="nameInfo"></span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">密码:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="stu.stuPassword" type="text" id="pwd" value="123456"/></td>
                <td align="left"><span style="color:red" id="pwdInfo"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">邮箱:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" type="text" id="email" name="stu.stuEmail" value="" /></td>
                <td align="left"><span style="color:red" id="emailInfo"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td" valign="top">状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_0" type="radio" name="stu.stuStatus" value="1" checked="checked" /><label for="rbtnl_0">启用</label>&nbsp;&nbsp; <input id="rbtnl_1" type="radio" name="teacher.tchStatus" value="0" /><label for="rbtnl_1">禁用</label>
                </td><td align="left"></td>
            </tr>   
            <tr>
                <td align="right" class="l-table-edit-td">姓名:</td>
             <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="stu.stuName" type="text" id="name" value="" /></td>
                <td align="left"><span style="color:red" id="info"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">性别:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_2" type="radio" name="stu.stuSex" value="男" checked="checked" /><label for="rbtnl_2">男</label>&nbsp;&nbsp; &nbsp;&nbsp;<input id="rbtnl_3" type="radio" name="stu.stuSex" value="女" /><label for="rbtnl_4">女</label>
                </td><td align="left"></td>
            </tr>    
             <tr>
                <td align="right" class="l-table-edit-td">手机:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input class="l-text" name="stu.stuMobile" type="text" id="phone" value=""/></td>
                <td align="left"><span style="color:red" id="phoneInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">QQ:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input class="l-text" name="stu.QICQ" type="text" id="qq" value=""/></td>
                <td align="left"><span style="color:red" id="qqInfo"></span></td>
            </tr>
        </table>
 <br />
<input type="button" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="button" value="取消" class="l-button l-button-test" onclick="parent.closeTab('addStudent')"/>
    <!-- </form> -->
    <div style="display:none">
    <!--  数据统计代码 --></div>    
</body>
</html>
