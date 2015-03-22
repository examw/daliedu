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
    <script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script>
    <script type="text/javascript">
        //var eee;
        function checkUsername()
        {
        	var name=$("#username").val();
        	var $nameInfo=$("#nameInfo");
        	var o_name="${teacher.tchUsername}";
        	var flag=false;
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
					return true;
				}else{
				$.ajax({
					async:false,
					url:"${pageContext.request.contextPath}/user/checkUser",
					data:{"tchUsername":$("#username").val()},
					success:function(data)
					{
						if(data)
						{
							$nameInfo.html("该用户名已经被注册");
						}else
						{
							$nameInfo.html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
							flag = true;
						}
					},
					dataType:"json"
					});
					return flag;
				}
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
		function checkSelect()
		{
			if(!$("#test3").val()) return true;
			return checkNull($("#test3"),$("#examInfo"));
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
		function checkDesc()
		{
			//checkNull($("#description"),$("#dInfo"));
			if(!$("#description").val()||!$.trim($("#description").val()))
			{
				//alert($("#description").val());
				$("#dInfo").html("此项不能为空");
				return false;
			}else
			{
				$("#dInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
				return true;
			}
		}
		function checkAll()
		{
			return checkUsername()&&checkName()&&checkPassword()&&checkRepeatPwd()&&checkPhone()&&checkDesc()&&checkSelect();
		}
        $(function ()
        {
        	var status = "${teacher.tchStatus}";
        	var sex ="${teacher.tchSex}";
        	var lessons="${teacher.tchLessons}";
        	if(status=="0")
        	{
        		$("#rbtnl_1").attr('checked','checked');
        	}else
        		$("#rbtnl_0").attr('checked','checked');
        	if(sex=="F")
        	{
        		$("#rbtnl_3").attr('checked','checked');
        	}else
        		$("#rbtnl_2").attr('checked','checked');
        	//由于用的是同一个页面，判断有值的话,更改表单提交的action
        	if(status!=""){$("#form1").attr("action","${pageContext.request.contextPath}/user/updateTeacher");}
			//加载下拉tree
			if(lessons=="")
			{
        		$("#exam").ligerComboBox({ 
        	 		width : 180, 
            		selectBoxWidth: 200,
             		selectBoxHeight: 200, 
             		valueField: 'text',
             		treeLeafOnly: true,
              		valueFieldID: 'test3',
              		tree:{url:"${pageContext.request.contextPath}/exam/examTree"}
            	});
            } else
            {
            	$("#exam").attr("value",lessons);
            	$("#exam").attr("disabled",true);
            	$("#exam").addClass("l-text");
            	$("#modifyLesson").show();
            	$("#modifyLesson").click(function(){
            		$(this).hide();
            		$("#exam").ligerComboBox({ 
        	 		width : 180, 
            		selectBoxWidth: 200,
             		selectBoxHeight: 200, 
             		valueField: 'text',
             		treeLeafOnly: true,
              		valueFieldID: 'test3',
              		tree:{url:"${pageContext.request.contextPath}/exam/examTree"}
            	});
            	});
            }
            //$("form").ligerForm();
            $("#test3").attr("name","teacher.tchLessons");
            $("#Button1").click(
            	function(){
            		//alert($("#exam").val());
            		//alert(checkAll());
            		if(checkAll())
            		{
            			$.post(
            				$("#form1").attr("action"),
            				{"teacher.tchId":$("#id").val(),"teacher.tchUsername":$("#username").val(),"teacher.tchPassword":$("#pwd").val(),"teacher.tchName":$("#name").val(),"teacher.tchStatus":$("input[name='teacher.tchStatus']:checked").val(),"teacher.tchSex":$("input[name='teacher.tchSex']:checked").val(),"teacher.tchPhone":$("#phone").val(),"teacher.tchLessons":$("#exam").val(),"teacher.tchDescription":$("#description").val()},
            				function(data){
            					if(data)
            					{
            						$.ligerDialog.alert("操作成功",function(){
            								//parent.parent.fresh("teacherList");
            								parent.parent.closeTab("modifyTeacher");
            								//parent.parent.selectTab("teacherList");
            						});
            					}else
            					{
            						$.ligerDialog.alert("操作失败,该记录可能不存在",function(){
            								parent.parent.closeTab("modifyTeacher");
            								//parent.parent.fresh("teacherList");
            								//parent.parent.closeTabAndFresh("modifyTeacher");
            								//parent.parent.selectTab("teacherList");
            						});
            					}
            				},
            				"json"
            			);
            		}
            		});
           	$("#username").blur(checkUsername);
           	$("#pwd").blur(checkPassword);
           	$("#pwd2").blur(checkRepeatPwd);
           	$("#name").blur(checkName);
           	$("#phone").blur(checkPhone);
           	$("#description").blur(checkDesc);
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

    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/user/addTeacher">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        <tr>
        <td>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
       		 <tr style="display:none">
                <td align="right" class="l-table-edit-td">编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="teacher.tchId" type="text" id="id" value="${teacher.tchId }"/></td>
                <td align="left"></td>
            </tr>
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="teacher.tchUsername" type="text" id="username" value="${teacher.tchUsername}" /></td>
                <td align="left"><span style="color:red" id="nameInfo"></span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">密码:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="teacher.tchPassword" type="text" id="pwd" value="${teacher.tchPassword}" /></td>
                <td align="left"><span style="color:red" id="pwdInfo"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">重复密码:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" type="text" id="pwd2" value="${teacher.tchPassword}" /></td>
                <td align="left"><span style="color:red" id="pwd2Info"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td" valign="top">状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_0" type="radio" name="teacher.tchStatus" value="1" checked="checked" /><label for="rbtnl_0">启用</label>&nbsp;&nbsp; <input id="rbtnl_1" type="radio" name="teacher.tchStatus" value="0" /><label for="rbtnl_1">禁用</label>
                </td><td align="left"></td>
            </tr>   
            <tr>
                <td align="right" class="l-table-edit-td">姓名:</td>
             <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="teacher.tchName" type="text" id="name" value="${teacher.tchName}" /></td>
                <td align="left"><span style="color:red" id="info"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">性别:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_2" type="radio" name="teacher.tchSex" value="M" checked="checked" /><label for="rbtnl_2">男</label>&nbsp;&nbsp; &nbsp;&nbsp;<input id="rbtnl_3" type="radio" name="teacher.tchSex" value="F" /><label for="rbtnl_4">女</label>
                </td><td align="left"></td>
            </tr>    
             <tr>
                <td align="right" class="l-table-edit-td">电话:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input class="l-text" name="teacher.tchPhone" type="text" id="phone" value="${teacher.tchPhone}" /></td>
                <td align="left"><span style="color:red" id="phoneInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">所教课程:</td>
                <td align="left" class="l-table-edit-td" style="width:180px">
					<input type="text" id="exam"/>
                </td><td align="left"><a id="modifyLesson" class="l-button" style="display:none;width:60px; float:left; margin-left:10px;">修改课程</a><span style="color:red" id="examInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">简介:</td>
                <td align="left" class="l-table-edit-td" colspan="2"> 
                <textarea name="teacher.tchDescription" cols="100" rows="4" class="l-textarea" id="description" style="width:300px" validate="{required:true}" >${teacher.tchDescription}</textarea>
                </td> <td align="left"><span style="color:red" id="dInfo"></span></td>
            </tr>
            </table>
            </td>
            <td ><img src="${teacher.tchImgUrl}" alt="暂无图像">
            	<input type="button" value="修改图像" onclick="location='${pageContext.request.contextPath}/cms/jsp/teacher/modifyTchFace.jsp?id=${teacher.tchId}&imgUrl=${teacher.tchImgUrl }'">
            </td>
            </tr>
        </table>
 <br />
<input type="button" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="button" value="测试" class="l-button l-button-test"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>    
</body>
</html>
