
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
 	<link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script type="text/javascript">
        var eee;
        $(function ()
        {
            $.metadata.setType("attr", "validate");
            var v = $("form").validate({
                debug: true,
                errorPlacement: function (lable, element)
                {
                    if (element.hasClass("l-textarea"))
                    {
                        element.ligerTip({ content: lable.html(), target: element[0] }); 
                    }
                    else if (element.hasClass("l-text-field"))
                    {
                        element.parent().ligerTip({ content: lable.html(), target: element[0] });
                    }
                    else
                    {
                        lable.appendTo(element.parents("td:first").next("td"));
                    }
                },
                success: function (lable)
                {
                    lable.ligerHideTip();
                    lable.remove();
                },
                submitHandler: function ()
                {
                    $("form .l-text,.l-textarea").ligerHideTip();
                   	$.post(
            				"${pageContext.request.contextPath}/system/saveOrUpdateWebInfo",
            				{   "webInfo.webInfoComName":$("#webInfoComName").val(),
            					"webInfo.webInfoId":$("#webInfoId").val(),
            					"webInfo.webInfoServiceTel":$("#webInfoServiceTel").val(),
            					"webInfo.webInfoOfficePhone":$("#webInfoOfficePhone").val(),
					            "webInfo.webInfoComPostCode":$("#webInfoComPostCode").val(),
					            "webInfo.webInfoComEmail":$("#webInfoComEmail").val(),
					            "webInfo.webInfoComfax":$("#webInfoComfax").val(),
					            "webInfo.webInfoWorkday":$("#webInfoWorkday").val(),
					            "webInfo.webInfoCopyright":$("#webInfoCopyright").val(),
					            "webInfo.webInfoIndex":$("#webInfoIndex").val(),
					            "webInfo.webInfoComAddress":$("#webInfoComAddress").val()
					            },
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                    					parent.fresh("webInfo");
                					}); 
            					}
            				},
            				"json"
            		);
                }
            });
            $("form").ligerForm();
            $(".l-button-test").click(function ()
            {
                 parent.tab.removeTabItem("webInfo");
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

    <form name="form1" method="post" action="../service/EmployeeEdit.aspx?ID=0" id="form1">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit"  >
            <tr>
                <td align="right" class="l-table-edit-td">公司名称:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoComName" type="text" value="${webInfo.webInfoComName}" id="webInfoComName" ltype="text" validate="{required:true,minlength:5,maxlength:25}" />
                	<input name="webInfo.webInfoId" value="${webInfo.webInfoId}" id="webInfoId" type="hidden" >
                </td>
                <td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">客服热线:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoServiceTel" value="${webInfo.webInfoServiceTel}"  type="text" id="webInfoServiceTel" ltype="text" validate="{required:true,minlength:5,maxlength:15}" /></td>
                <td align="left"></td>
                <td align="right" class="l-table-edit-td">办公电话:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoOfficePhone" value="${webInfo.webInfoOfficePhone}"   type="text" id="webInfoOfficePhone" ltype="text" validate="{required:true,minlength:2,maxlength:15}" /></td>
                <td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">邮编:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoComPostCode"  value="${webInfo.webInfoComPostCode}" type="text" id="webInfoComPostCode" ltype="digits" validate="{required:true,minlength:5,maxlength:12}" /></td>
                <td align="left"></td>
                <td align="right" class="l-table-edit-td">E-mail:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoComEmail" value="${webInfo.webInfoComEmail}"  type="text" id="webInfoComEmail" ltype="text" validate="{required:true,email:true}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">传真:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoComfax" value="${webInfo.webInfoComEmail}"  type="text" id="webInfoComfax" ltype="text" validate="{minlength:5,maxlength:25}" /></td>
                <td align="left"></td>
                <td align="right" class="l-table-edit-td">工作时间:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoWorkday" value="${ webInfo.webInfoWorkday}"  type="text" id="webInfoWorkday" ltype="text" validate="{required:true,minlength:5,maxlength:20}" /></td>
                <td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">版权:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoCopyright" value="${webInfo.webInfoCopyright}"   type="text" id="webInfoCopyright" ltype="text" validate="{required:true,minlength:5,maxlength:25}" /></td>
                <td align="left"></td>
               	<td align="right" class="l-table-edit-td">备案号:</td>
                <td align="left" class="l-table-edit-td"><input name="webInfo.webInfoIndex" value="${webInfo.webInfoIndex}"  type="text" id="webInfoIndex" ltype="text" validate="{required:true,minlength:5,maxlength:25}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">地址:</td>
                <td align="left" class="l-table-edit-td" colspan="4"> 
                <textarea name="webInfo.webInfoComAddress"   cols="100" rows="4"  class="l-textarea" id="webInfoComAddress" style="width:700px" validate="{required:true}" >${webInfo.webInfoComAddress}</textarea>
                </td>
                <td align="left"></td>
            </tr>
        </table>
     
 <br />
<input type="submit" value="保存" name="submit" id="Button1" class="l-button l-button-submit" /> 
<input type="button" value="关闭" name="close" class="l-button l-button-test"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>

</body>
</html>
