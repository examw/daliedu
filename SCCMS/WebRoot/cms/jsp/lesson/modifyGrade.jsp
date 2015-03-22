<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addclass</title>
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
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script type="text/javascript">
    		 var eee;
    		 var examId=${session.gexamId};
    		 var examPid =${session.gexamPid};
    		 $(document).ready(function(){   
	             $("#form1").change(function(){  
	                 parent.modifyGradeMark  = true; 
	             });            
	    	 }); 
    		 var lastExamName,lastGTypeName;
        $(function ()
        {
        	$("#teacher").ligerComboBox({
                width: 250,
                slide: false,
                selectBoxWidth: 178,
                selectBoxHeight: 100, 
                valueField: 'tchId', 
                textField: 'tchName',
                valueFieldID: 'teacherId',
                initValue:'${grade.tchId}',
        		url:"${pageContext.request.contextPath}/grade/classTeacher?examPid="+examPid+"&examId="+examId
            });
        	$("#class").ligerComboBox({
                width: 250,
                slide: false,
                selectBoxWidth: 178,
                selectBoxHeight: 100, 
                valueField: 'gtypeId', 
                textField: 'gtypeName',
                valueFieldID: 'gtypeId',
                initValue:'${grade.gradeCategory.gtypeId}',
        		url:"${pageContext.request.contextPath}/grade/classList",
        		onSelected: function (value,text)
        		{
        			if(!lastGTypeName)
        				$("#gradeName").val($("#gradeName").val()+text);
        			else
        				$("#gradeName").val($("#gradeName").val().replace(lastGTypeName,text));
        			lastGTypeName = text;
        		}
        		});
        	$("#exam").ligerComboBox({
                width: 250,
                slide: false,
                selectBoxWidth: 178,
                selectBoxHeight: 100, 
                valueField: 'examId', 
                textField: 'examName',
                valueFieldID: 'examId',
                initValue:examId,
        		url:"${pageContext.request.contextPath}/grade/examList?examPid="+examPid,
        		onSelected: function (value,text)
        		{
        			if(!lastExamName)
        				$("#gradeName").val(text+$("#gradeName").val());
        			else
        				$("#gradeName").val($("#gradeName").val().replace(lastExamName,text));
        			lastExamName = text;
        		}
            });
        	var status = "${grade.gradeSingle}";
        		if(status=="0")
        		{
        			$("#rbtnl_0").attr('checked','checked');
        		}else
        			$("#rbtnl_1").attr('checked','checked');
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
                
                  	tchId =$("#teacherId").val();
                  	gtypeId =$("#gtypeId").val();
                  	examId =$("#examId").val();
                   	$.post(
            				"${pageContext.request.contextPath}/grade/updateGrade",
            				{"grade.gradeOPrice":$("#gradeOPrice").val(),
            				"grade.gradeId":$("#gradeId").val(),
            				"grade.gradeSingle":$("input[name='grade.gradeSingle']:checked").val(),
            				"grade.gradeRPrice":$("#gradeRPrice").val(),"grade.gradeRemark":$("#gradeRemark").val(),
            				"grade.gradeDueTime":$("#gradeDueTime").val(),
            				"grade.gradeName":$("#gradeName").val(),
            				"tchId":tchId,
            				"gtypeId":gtypeId,
            				"examId":examId
            				},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						parent.modifyGradeMark = false;
                    					parent.fresh("grade");
                         				parent.tab.selectTabItem("grade");
                         				parent.tab.removeTabItem("modifyGrade");
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
               	parent.modifyGradeMark = false;
        		parent.tab.removeTabItem("modifyGrade");
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
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<tr>
                <td align="right" class="l-table-edit-td">考试类型:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="exam" name="exam"  validate="{required:true}"/>
                <input type="hidden" id="gradeId" value="${grade.gradeId}"/>
                </td>
           	 </tr>
             <tr>
                <td align="right" class="l-table-edit-td">班级类型:</td>
                <td align="left" class="l-table-edit-td" >
                <input type="text" id="class" name="grade"  validate="{required:true}"/>
                </td>
                <td align="left" class="l-table-edit-td">
                	<input type="button" value="添加新类型" class="l-button l-button-submit" name="gradeCategory" onclick="addclick()">
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">班级名称:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="gradeName" name="gradeName"  validate="{required:true}" value="${grade.gradeName}"/>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">老师:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="teacher" name="teacher"  validate="{required:true}"/>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">单独购买:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="rbtnl_0" type="radio" name="grade.gradeSingle" value="0"  /><label for="rbtnl_0">是</label> <input id="rbtnl_1" type="radio" name="grade.gradeSingle" value="1" /><label for="rbtnl_1">否</label>
                </td><td align="left"></td>
            </tr>   
             <tr>
                <td align="right" class="l-table-edit-td">原价:</td>
                <td align="left" class="l-table-edit-td"><input name="grade.gradeOPrice"  value="${grade.gradeOPrice}" type="text" id="gradeOPrice" ltype="text" number="true"  validate="{required:true,minlength:2,maxlength:7}"  /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">优惠价:</td>
                <td align="left" class="l-table-edit-td"><input name="grade.gradeRPrice"  value="${grade.gradeRPrice}" type="text" id="gradeRPrice" ltype="text" number="true"  validate="{required:true,minlength:2,maxlength:7}"  /></td>
                <td align="left"></td>
            </tr>
                 
            <tr>
                <td align="right" class="l-table-edit-td">到期日期:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="grade.gradeDueTime"  value="<fmt:formatDate  value="${grade.gradeDueTime}" pattern="yyyy-MM-dd" />" type="text" id="gradeDueTime" ltype="date" validate="{required:true}" />
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">备注:</td>
                <td align="left" class="l-table-edit-td"> 
                <textarea cols="100" rows="4" class="l-textarea" id="gradeRemark" style="width:400px"  name="grade.gradeRemark">${grade.gradeRemark}</textarea>
                </td><td align="left"></td>
            </tr>
        </table>
 <br />
<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="button" value="取消" class="l-button l-button-test" name="cancel"/> 
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>

    
</body>
</html>
