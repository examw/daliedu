<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>批量添加</title>
	<link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
  	<link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
   	<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script type="text/javascript">
    var id=${session.gexamId};
	var pid =${session.gexamPid};
    var num =parent.num;
	var tchId =parent.tchId;
	var classTitle=parent.classTitle;
	var classYear =parent.classYear;
	var classHdUrl =parent.classHdUrl;
	var classTriUrl =parent.classTriUrl;
	var classAudio =parent.classAudio;
	var classOpenTime =parent.classOpenTime;
	var classIfFree=parent.classIfFree;
    $(function(){
		$("#tchId").ligerComboBox({
        width: 250,
        slide: false,
        selectBoxWidth: 178,
        selectBoxHeight: 100, 
        valueField: 'tchId', 
        textField: 'tchName',
        valueFieldID: 'teacherId',
        initValue:tchId, 
		url:"${pageContext.request.contextPath}/grade/classTeacher?examPid="+pid+"&examId="+id
    });
	});
    $(function(){
		var $table = $("#classTable");
		$("#classTable tr[name='classDetail']").remove();
		var $bottom = $("#classTableBottom");//底部元素
		$bottom.remove();
		for(var i=1;i<=num;i++)
		{
			var html="";
				html+="<tr name='classDetail'><table border='1' cellpadding='0' cellspacing='0' class='l-table-edit'><tr>";
				html+="<td colspan='6' align='center' style='color: red;font-size:18px;background-color:gray;'><strong>第"+i+"节</strong></td>";
				html+="</tr>";
				html+="<tr>";
                html+="<td align='right' class='l-table-edit-td'>老&nbsp;&nbsp;&nbsp;&nbsp;师:</td>";
                html+="<td align='left' class='l-table-edit-td'>";
                html+="<input type='text'  validate='{required:true}'  name='list["+(i-1)+"].tchId' value='"+tchId+"' text='rgfgf'/></td>";
                html+="<td align='left' width='50'></td>";
                html+="<td align='right' class='l-table-edit-td'>标&nbsp;&nbsp;&nbsp;&nbsp;题:</td>";
                html+="<td align='left' class='l-table-edit-td'><input name='list["+(i-1)+"].classTitle' type='text' value='"+classTitle+i+"' ltype='text'  validate='{required:true}' /></td>";
                html+="<td align='left'></td>";
            	html+="</tr>";
            	html+="<tr>";
                html+="<td align='right' class='l-table-edit-td'>版&nbsp;&nbsp;&nbsp;&nbsp;本:</td>";
                html+="<td align='left' class='l-table-edit-td'><input  name='list["+(i-1)+"].classYear' type='text' value='"+classYear+"'  ltype='text' digits='true'  validate='{required:true}' /></td>";
                html+="<td align='left'></td>";
                html+="<td align='right' class='l-table-edit-td'>高清地址:</td>";
                html+="<td align='left' class='l-table-edit-td'><input  name='list["+(i-1)+"].classHdUrl' type='text' value='"+classHdUrl+i+"' ltype='text'  validate='{required:true}' /></td>";
                html+="<td align='left'></td>";   
           		html+="</tr>";
            	html+="<tr>";  
                html+="<td align='right' class='l-table-edit-td'>三分地址:</td>";
                html+="<td align='left' class='l-table-edit-td'><input   name='list["+(i-1)+"].classTriUrl' type='text' value='"+classTriUrl+i+"' ltype='text'  validate='{required:true}' /></td>";
                html+="<td align='left'></td>";
                html+="<td align='right' class='l-table-edit-td'>音频地址:</td>";
                html+="<td align='left' class='l-table-edit-td'><input  name='list["+(i-1)+"].classAudio' type='text' value='"+classAudio+i+"' ltype='text'  validate='{required:true}' /></td>";
                html+="<td align='left'></td>"; 
            	html+="</tr>";     
             	html+="<tr>";
                html+="<td align='right' class='l-table-edit-td'>开放日期:</td>";
                html+="<td align='left' class='l-table-edit-td'>";
                html+="<input name='list["+(i-1)+"].classOpenTime' type='text' value='"+classOpenTime+"' id='"+i+"' ltype='date' validate='{required:true}' />";
                html+="</td><td align='left'></td>";
                html+="<td align='right' class='l-table-edit-td' valign='top'>免费试听:</td>";
                html+="<td align='left' class='l-table-edit-td'>";
                html+="<input  type='radio' name='list["+(i-1)+"].classIfFree' value='0' checked='checked' /><label for='rbtnl_0'>否</label> <input  type='radio' name='list["+(i-1)+"].classIfFree' value='1' /><label for='rbtnl_1'>是</label>";
               	html+="</td><td align='left'></td>";
            html+="</tr>";
			html+="</table>";	
			html+="</tr>";
			var $tr=$(html);
			$table.append($tr);
		}
		
		$table.append($bottom);
		$table.show();
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
            $("form .l-text,.l-textarea").ligerHideTip();
        }
      
    });
    $("form").ligerForm();
});  
    </script>
</head>
<body style="padding:20px">
	 <form name="form1" method="post"  id="form1" >
	 	<table  cellpadding="0" cellspacing="0" id="classTable" class="l-table-edit" >
	 		
	 	</table>
	 </form>
</body>
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
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
</html>