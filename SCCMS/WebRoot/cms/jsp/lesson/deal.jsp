<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addLecture</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/style.css" rel="stylesheet" type="text/css" />
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
        var dealName="";
        var dealContent="";
        var id="";
        var dealLastDate="";
        $(function(){
        	dealName=$("#txtName").val();
        	$("#txtName").blur(function(){
        		dealName = $("#txtName").val();
        	});
        	dealLastDate=$("#lastDate").val();
        	$("#lastDate").blur(function(){
        		dealLastDate = $("#lastDate").val();
        	});
        	id = $("#id").val();
       
        });
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
                  
                }
            });
            $("form").ligerForm();
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

<body style="padding:10px "  >

    <form name="form1" method="post" id="form1">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">协议名称:</td>
                <td align="left" class="l-table-edit-td">
                <input name="txtName" value="${deal.dealName}" type="text" id="txtName" ltype="text"  />
                <input id ="id" value="${deal.id}" type="hidden" name="id">
                </td>
                <td align="left"></td>
                
                <td align="right" class="l-table-edit-td">到期时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="deal.dealLastDate" type="text" id="lastDate" value="${deal.dealLastDate}" ltype="date" />
                </td><td align="left"></td>
            </tr>
            <tr>
                <!-- <td align="right" class="l-table-edit-td">讲义内容:</td> -->
                <td align="left" class="l-table-edit-td" colspan="5"> 
                <textarea name="lecture.lectContent" cols="100"  rows="5" class="l-textarea" id="editor" style="width:651px"  >${deal.dealContent}</textarea>
                </td><td align="left"></td>
            </tr>
        </table>
 <br />
    </form>
<br/>   
<br/>   
<br/>   
<br/>   
    
    <div style="display:none">
    <!--  数据统计代码 --></div>

    
</body>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor.min.js"></script> 
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor_config.js"></script> 
<script type="text/javascript">
	var editor =UE.getEditor('editor');
</script>
</html>
