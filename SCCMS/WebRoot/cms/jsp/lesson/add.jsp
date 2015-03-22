<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addclass</title>
    <link href="../../css/ligerui-all.css" rel="stylesheet" type="text/css" />
   	<link href="${pageContext.request.contextPath}/cms/css/style.css" rel="stylesheet" type="text/css" />
   	<script src="../../js/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="../../js/base.js" type="text/javascript"></script>
    <script src="../../js/ligerForm.js" type="text/javascript"></script>
    <script src="../../js/ligerDateEditor.js" type="text/javascript"></script>
    <script src="../../js/ligerComboBox.js" type="text/javascript"></script>
    <script src="../../js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="../../js/ligerButton.js" type="text/javascript"></script>
    <script src="../../js/ligerDialog.js" type="text/javascript"></script>
    <script src="../../js/ligerRadio.js" type="text/javascript"></script>
    <script src="../../js/ligerSpinner.js" type="text/javascript"></script>
    <script src="../../js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="../../js/ligerTip.js" type="text/javascript"></script>
    <script src="../../js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="../../js/jquery.metadata.js" type="text/javascript"></script>
    <script src="../../js/messages_cn.js" type="text/javascript"></script>
    <script src="../../js/ligerGrid.js" type="text/javascript"></script>
    <script type="text/javascript">
    		 var eee;
    		 var id=${session.gexamId};
    		 var pexamId =${session.gexamPid};
    		 
    		 $(document).ready(function(){   
	             $("#form1").change(function(){  
	                 parent.gradeAddMark = true; 
	             });               
	    	});  	
    		//老师下拉框
			$(function(){
				$("#teacher").ligerComboBox({
                width: 250,
                slide: false,
                selectBoxWidth: 178,
                selectBoxHeight: 100, 
                valueField: 'tchId', 
                textField: 'tchName',
                valueFieldID: 'teacherId',
        		url:"${pageContext.request.contextPath}/grade/classTeacher?examPid="+pexamId+"&examId="+id
            });
           		
			});
			var lastExamName,lastGTypeName;
			//班级下拉框
			function gradeList(){
				$("#class").ligerComboBox({
                width: 250,
                slide: false,
                selectBoxWidth: 178,
                selectBoxHeight: 100, 
                valueField: 'gtypeId', 
                textField: 'gtypeName',
                valueFieldID: 'gtypeId',
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
			}
			$(function(){
				 gradeList();
			});
			//考试类型下拉框
			$(function(){
				$("#exam").ligerComboBox({
                width: 250,
                slide: false,
                selectBoxWidth: 178,
                selectBoxHeight: 100, 
                valueField: 'examId', 
                textField: 'examName',
                valueFieldID: 'examId',
        		url:"${pageContext.request.contextPath}/grade/examList?examPid="+pexamId,
        		onSelected: function (value,text)
        		{
        			if(!lastExamName)
        				$("#gradeName").val(text+$("#gradeName").val());
        			else
        				$("#gradeName").val($("#gradeName").val().replace(lastExamName,text));
        			lastExamName = text;
        		}
            });
       
			});
       		
        $(function ()
        {
        	parent.$obj = $("#form1"); 
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
                    var tchId =$("#teacherId").val();
                  	var gtypeId =$("#gtypeId").val();
                  	var examId =$("#examId").val();
                  	$.post(
            				"${pageContext.request.contextPath}/grade/gradeAdd",
            				{"grade.gradeOPrice":$("#gradeOPrice").val(),
            				"grade.gradeSingle":$("input[name='grade.gradeSingle']:checked").val(),
            				"grade.gradeRPrice":$("#gradeRPrice").val(),
            				"grade.gradeRemark":$("#gradeRemark").val(),
            				"grade.gradeDueTime":$("#gradeDueTime").val(),
            				"grade.gradeName":$("#gradeName").val(),
            				tchId:tchId,
            				gtypeId:gtypeId,
            				examId:examId},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						parent.gradeAddMark = false; 
                    					parent.fresh("grade");
                         				parent.tab.selectTabItem("grade");
                         				parent.tab.removeTabItem("addGrade");
                					}); 
            					}else{
            						$.ligerDialog.alert("班级名称可能重复");
            					}
            				},
            				"json"
            		);
                    
                }
            });
            $("form").ligerForm();
            $(".l-button-test").click(function ()
            {
              parent.gradeAddMark = false; 
              parent.tab.selectTabItem("grade");
              parent.tab.removeTabItem("addGrade");
            });
        }); 
        
        
         function addclick()
		        {
		        	$.ligerDialog.prompt('班级类别','请输入班级类型', function (yes, value)
                     	{
						if(yes){
							var reg = /^[\u2E80-\uFE4F]+$/;
							if(value=="请输入班级类型"||value==""){
								$.ligerDialog.warn('请输入班级类型名字'); return; 
							}else if(reg.test(value)){
								$.post("${pageContext.request.contextPath}/grade/gcAdd",{gtypeName:value},
          						function(ok){
	          						if(ok==true){
	          							$.ligerDialog.success('添加成功');
	          							parent.fresh("addGrade");
	          						}else{
	          							$.ligerDialog.error('添加失败');
	          						}
								},
								"json"
          					);
							}else{
								$.ligerDialog.warn('请输入汉字'); return; 
							}
							
						}	
                     });
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

<body style="padding:10px">
    <form name="form1" method="post"  id="form1">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit"  >
        	 <tr>
                <td align="right" class="l-table-edit-td">考试类型:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="exam" name="exam"  validate="{required:true}"/>
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
                <input type="text" id="gradeName" name="gradeName"  validate="{required:true}"/>
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
                    <input id="rbtnl_0" type="radio" name="grade.gradeSingle" value="0"  checked="checked"/><label for="rbtnl_0">是</label> <input id="rbtnl_1" type="radio" name="grade.gradeSingle" value="1" /><label for="rbtnl_1">否</label>
                </td><td align="left"></td>
            </tr>   
             <tr>
                <td align="right" class="l-table-edit-td">原价:</td>
                <td align="left" class="l-table-edit-td"><input name="grade.gradeOPrice"   type="text" id="gradeOPrice" ltype="text" number="true"  validate="{required:true,minlength:2,maxlength:7}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">优惠价:</td>
                <td align="left" class="l-table-edit-td"><input name="grade.gradeRPrice"   type="text" id="gradeRPrice" ltype="text" number="true"  validate="{required:true,minlength:2,maxlength:7}" /></td>
                <td align="left"></td>
            </tr>
                 
            <tr>
                <td align="right" class="l-table-edit-td">到期日期:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="grade.gradeDueTime"   type="text" id="gradeDueTime" ltype="date" validate="{required:true}" />
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">备注:</td>
                <td align="left" class="l-table-edit-td" colspan="2"> 
                <textarea  rows="4"  class="l-textarea" id="gradeRemark" style="width:400px"  name="grade.gradeRemark">${grade.gradeRemark}</textarea>
                </td><td align="left"></td>
            </tr>
        </table>
 <br />
<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="button" value="取消" class="l-button l-button-test"  name="cancel"/> 
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>

    
</body>
</html>
