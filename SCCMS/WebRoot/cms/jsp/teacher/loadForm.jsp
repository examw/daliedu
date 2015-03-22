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
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
 
    <script type="text/javascript">
        var eee;
        $(function ()
        {
        	//根据性别选择默认值
        	var sex ="${teacher.tchSex}";
        	if(sex=='M')
        	{
        		$("#rbtnl_2").attr('checked','checked');
        	}else{$("#rbtnl_4").attr('checked','checked');}
        	//根据状态选择默认值
        	var status =${teacher.tchStatus};
        	if(status==1)
        	{
        		$("#rbtnl_0").attr('checked','checked');
        	}else
        		$("#rbtnl_1").attr('checked','checked');
        	
        	//添加验证方法
            $.validator.addMethod(
                    "notnull",
                    function (value, element, regexp)
                    {
                        if (!value) return true;
                        return !$(element).hasClass("l-text-field-null");
                    },
                    "不能为空"
            );
			
			
            $.metadata.setType("attr", "validate");
            var v = $("form").validate({
                //调试状态，不会提交数据的
                debug: true,
                errorPlacement: function (lable, element)
                {

                    if (element.hasClass("l-textarea"))
                    {
                        element.addClass("l-textarea-invalid");
                    }
                    else if (element.hasClass("l-text-field"))
                    {
                        element.parent().addClass("l-text-invalid");
                    }
                    $(element).removeAttr("title").ligerHideTip();
                    $(element).attr("title", lable.html()).ligerTip();
                },
                success: function (lable)
                {
                    var element = $("#" + lable.attr("for"));
                    if (element.hasClass("l-textarea"))
                    {
                        element.removeClass("l-textarea-invalid");
                    }
                    else if (element.hasClass("l-text-field"))
                    {
                        element.parent().removeClass("l-text-invalid");
                    }
                    $(element).removeAttr("title").ligerHideTip();
                },
                submitHandler: function ()
                {
                    //alert("Submitted!");
                    return true;
                }
            });
            $("form").ligerForm();
            $(".l-button-test").click(function ()
            {
                alert(v.element($("#txtName")));
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

    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/user/updateTeacher">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="teacher.tchUsername" type="text" value="${teacher.tchUsername}" id="username" ltype="text" validate="{required:true,minlength:3,maxlength:10,notnull:true}" nullText="不能为空!"/></td>
                <td align="left"></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">密码:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="teacher.tchPassword" type="password" id="pwd" value="${teacher.tchPassword}" ltype="text" validate="{required:true,minlength:3,maxlength:10,notnull:true}" nullText="不能为空!"/></td>
                <td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td" valign="top">状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_0" type="radio" name="teacher.tchStatus" value="1" checked="checked" /><label for="rbtnl_0">启用</label> <input id="rbtnl_1" type="radio" name="teacher.tchStatus" value="0" /><label for="rbtnl_1">禁用</label>
                </td><td align="left"></td>
            </tr>   
            <tr>
                <td align="right" class="l-table-edit-td">姓名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="teacher.tchName" value="${teacher.tchName}"type="text" id="name" ltype="text" validate="{required:true,minlength:3,maxlength:10,notnull:true}" nullText="不能为空!"/></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">性别:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input id="rbtnl_2" type="radio" name="teacher.tchSex" value="M" checked="checked" /><label for="rbtnl_2">男</label>&nbsp;&nbsp; &nbsp;&nbsp;<input id="rbtnl_4" type="radio" name="teacher.tchSex" value="F" /><label for="rbtnl_4">女</label>
                </td><td align="left"></td>
            </tr>    
             <tr>
                <td align="right" class="l-table-edit-td">电话:</td>
                <td align="left" class="l-table-edit-td" style="width:160px"><input name="teacher.tchPhone" value="${teacher.tchPhone}"  type="text" id="txtEmail" ltype="text" validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">添加日期:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input name="teacher.tchAddTime" value="<s:date name="teacher.tchAddTime" format="yyyy-MM-dd"></s:date>"  type="text" id="txtDate" ltype="date" validate="{required:true}" />
                </td><td align="left"></td>
            </tr>
            <!-- 所教课程怎么弄？？？ -->
            <tr>
                <td align="right" class="l-table-edit-td">所教课程:</td>
                <td align="left" class="l-table-edit-td" style="width:180px">
                <input type="text" id="selectBox">
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">介绍:</td>
                <td align="left" class="l-table-edit-td" colspan="2"> 
                <textarea name="teacher.tchDescription" value="" cols="100" rows="4" class="l-textarea" id="description" style="width:400px" validate="{required:true}" >${teacher.tchDescription}</textarea>
                </td> <td align="left"></td>
            </tr>
        </table>
 <br />
<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="button" value="测试" class="l-button l-button-test"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>

    
</body>
</html>
