<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addClassDetail</title>
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
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script type="text/javascript">
    	     var eee;
    		 var tchId;
    		 var id=${session.gexamId};
    		 var pid =${session.gexamPid};
    		 var initValue=<%=request.getParameter("tchId")%>
    		 var gradeId=<%=request.getParameter("gradeId")%>
    		/*  var id =parent.getNodeId(); */
    		//老师下拉框
			$(function(){
				$("#tchId").ligerComboBox({
                width: 250,
                slide: false,
                selectBoxWidth: 178,
                selectBoxHeight: 100, 
                valueField: 'tchId', 
                textField: 'tchName',
                valueFieldID: 'teacherId',
                initValue:initValue, 
        		url:"${pageContext.request.contextPath}/grade/classTeacher?examPid="+pid+"&examId="+id
            });
			});	
    	
        $(function ()
        {
            $.metadata.setType("attr", "validate");
            var v = $("#form1").validate({
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
            		f_batchAdd();
            		f_form();
            		$("#test1").remove();
                }
              
            });
            $("#form1").ligerForm();
        });  
        function f_form(){
        	$.metadata.setType("attr", "validate");
            var v = $("#form2").validate({
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
                    $("form")[1].submit(); 
                }
              
            });
            $("#form2").ligerForm();
        }
        
        //设置大题数
		var data="${data}";
		if(data=="true")
		{
			alert("添加成功");
			parent.f_closeWindow();
			
		}
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>

</head>
<body style="padding-top: 20px">
<center>
<div id="test1">
    <form name="form1" method="post"  id="form1" >
        <table cellpadding="0" cellspacing="0" class="l-table-edit"  >
        	 <tr>
        	 	<td colspan="6" align="center" height="30px" style="color: red;font-size:18px;background-color:#4e72b8;"><strong>基本信息设置</strong></td>
        	 </tr>
        	 <tr>
           	 	<td align="right" class="l-table-edit-td">章节数量:</td>
                <td align="left" class="l-table-edit-td"><input name="number" type="text" id="number" ltype="text"  validate="{required:true}" value="3"/></td>
                <td align="left"></td>
                <td align="right" class="l-table-edit-td">开放日期:</td>
                <td align="left" class="l-table-edit-td">
                <input name="classDetail.classOpenTime" type="text" id="classOpenTime" ltype="date" validate="{required:true}" />
                </td><td align="left"></td>
            </tr>
         	<tr>
                <td align="right" class="l-table-edit-td">老&nbsp;&nbsp;&nbsp;&nbsp;师:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="tchId"   validate="{required:true}"  name="teacher" /></td>
                <td align="left" width="50"></td>
                <td align="right" class="l-table-edit-td">标&nbsp;&nbsp;&nbsp;&nbsp;题:</td>
                <td align="left" class="l-table-edit-td"><input name="classDetail.classTitle" type="text" id="classTitle" ltype="text"  validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">版&nbsp;&nbsp;&nbsp;&nbsp;本:</td>
                <td align="left" class="l-table-edit-td"><input  name="classDetail.classYear" type="text" id="classYear" ltype="text" digits="true"  validate="{required:true}" /></td>
                <td align="left"></td>
                <td align="right" class="l-table-edit-td">高清地址:</td>
                <td align="left" class="l-table-edit-td"><input 0name="classDetail.classHdUrl" type="text" id="classHdUrl" ltype="text" validate='{maxlength:50}' /></td>
                <td align="left"></td>   
            </tr>
            <tr>  
                <td align="right" class="l-table-edit-td">三分地址:</td>
                <td align="left" class="l-table-edit-td"><input   name="classDetail.classTriUrl" type="text" id="classTriUrl" ltype="text" validate='{maxlength:50}'/></td>
                <td align="left"></td>
                <td align="right" class="l-table-edit-td">音频地址:</td>
                <td align="left" class="l-table-edit-td"><input   name="classDetail.classAudio" type="text" id="classAudio" ltype="text" validate='{maxlength:50}' /></td>
                <td align="left"></td> 
            </tr>     
            <tr>
            	<td colspan="6" align="center"><input type="submit" value="确定" id="Button1" class="l-button l-button-submit" /></td>
            </tr>
        </table>
    </form>
</div>
<div>
	<form action="${pageContext.request.contextPath}/grade/batchAdd" id="form2" method="post">
		<table id="classTable" style="display: none"  class="l-table-edit">
				<tr id="classTableBottom">
					<td align="center"><input type="submit" value="提交"  class="l-button l-button-submit" /></td>
				</tr>
				
		</table>
	</form>
</div>
<div style="display:none">
    <!--  数据统计代码 --></div>
</center>
</body>
<script type="text/javascript">
	function f_batchAdd()
	{
		num =$("#number").val();
		tchId =$("#teacherId").val();
		classTitle=$("#classTitle").val();
		classYear =$("#classYear").val();
		classHdUrl =$("#classHdUrl").val();
		classTriUrl =$("#classTriUrl").val();
		classAudio =$("#classAudio").val();
		classOpenTime =$("#classOpenTime").val();
		tchName=$("#tchId").val();
		var $table = $("#classTable");
		var $bottom = $("#classTableBottom");//底部元素
		$bottom.remove();
		for(var i=1;i<=num;i++)
		{
			var hurl = classHdUrl==""?"":classHdUrl+i+".flv";
			var TriUrl=classTriUrl==""?"":classTriUrl+i+".flv";
			var Audio=classAudio==""?"":classAudio+i+".mp3";
			var html="";
				html+="<tr>";
				html+="<td colspan='6' align='center' style='color: red;font-size:18px;background-color:#4e72b8;'><strong>第"+i+"节</strong></td>";
				html+="</tr>";
				html+="<tr>";
                html+="<td align='right' class='l-table-edit-td'>老&nbsp;&nbsp;&nbsp;&nbsp;师:</td>";
                html+="<td align='left' class='l-table-edit-td'>";
                html+="<input type='text'  disabled='true'   value='"+tchName+"' /></td>";
                html+="<input type='hidden' name='list["+(i-1)+"].tchId' value='"+tchId+"'/></td>";
                html+="<input type='hidden' name='list["+(i-1)+"].gradeId' value='"+gradeId+"'/></td>";
                html+="<td align='left' width='50'></td>";
                html+="<td align='right' class='l-table-edit-td'>标&nbsp;&nbsp;&nbsp;&nbsp;题:</td>";
                html+="<td align='left' class='l-table-edit-td'><input name='list["+(i-1)+"].classTitle' type='text' value='"+classTitle+i+"' ltype='text'  validate='{required:true}' /></td>";
                html+="<td align='left'></td>";
            	html+="</tr>";
            	html+="<tr>";
                html+="<td align='right' class='l-table-edit-td'>版&nbsp;&nbsp;&nbsp;&nbsp;本:</td>";
                html+="<td align='left' class='l-table-edit-td'><input  name='list["+(i-1)+"].classYear' type='text' value='"+classYear+"'  ltype='text' digits='true'  validate='{maxlength:30}' /></td>";
                html+="<td align='left'></td>";
                html+="<td align='right' class='l-table-edit-td'>高清地址:</td>";
                html+="<td align='left' class='l-table-edit-td'><input  name='list["+(i-1)+"].classHdUrl' type='text' value='"+hurl+"' ltype='text'  validate='{maxlength:50}' /></td>";
                html+="<td align='left'></td>";   
           		html+="</tr>";
            	html+="<tr>";  
                html+="<td align='right' class='l-table-edit-td'>三分地址:</td>";
                html+="<td align='left' class='l-table-edit-td'><input   name='list["+(i-1)+"].classTriUrl' type='text' value='"+TriUrl+"' ltype='text'  validate='{maxlength:50}' /></td>";
                html+="<td align='left'></td>";
                html+="<td align='right' class='l-table-edit-td'>音频地址:</td>";
                html+="<td align='left' class='l-table-edit-td'><input  name='list["+(i-1)+"].classAudio' type='text' value='"+Audio+"' ltype='text'  validate='{maxlength:50}' /></td>";
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
            	html+="<tr>";
            	html+="<td align='right' class='l-table-edit-td'>课节时间:</td>";
            	html+="</tr>";
            	html+="<tr>";
                html+="<td align='right' class='l-table-edit-td'>分&nbsp;&nbsp;&nbsp;&nbsp;钟:</td>";
                html+="<td align='left' class='l-table-edit-td'>";
                html+="<input name='list["+(i-1)+"].classMin' type='text'  ltype='spinner' ligerui='{type:'int',isNegative:false}' value='60' class='required' validate='{digits:true,min:1,max:300}'/> ";
                html+="</td><td align='left'></td>";
                html+="<td align='right' class='l-table-edit-td'>秒:</td>";
                html+="<td align='left' class='l-table-edit-td'>";
                html+="<input name='list["+(i-1)+"].classSec' type='text'  ltype='spinner' ligerui='{type:'int',isNegative:false}' value='30' class='required' validate='{digits:true,min:0,max:60}' />";
			html += "</td><td align='left'></td>";
			html += "</tr>";
			var $tr = $(html);
			$table.append($tr);
		}

		$table.append($bottom);
		$table.show();
	}
</script>
</html>
