<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addClassDetail</title>
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
    		 var tchId;
    		 var id=${session.gexamId};
    		 var pid =${session.gexamPid};
    		 initValue=${grade.tchId}
    		 
    		 $(document).ready(function(){   
	             $("#form1").change(function(){  
	                 parent.addClassDetailMark = true; 
	             });               
	    	 });  	
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
                    gradeId=$("#gradeId").val();
                  	tchId =$("#teacherId").val();
                    $.post(
            				"${pageContext.request.contextPath}/grade/classDetailAdd",
            				{"gradeId":gradeId,"tchId":tchId,"classDetail.classTitle":$("#classTitle").val(),"classDetail.classYear":$("#classYear").val(),
            				"classDetail.classIfFree":$("input[name='classDetail.classIfFree']:checked").val(),
            				"classDetail.classOpenTime":$("#classOpenTime").val(),"classDetail.classHdUrl":$("#classHdUrl").val(),
            				"classDetail.classTriUrl":$("#classTriUrl").val(),"classDetail.classAudio":$("#classAudio").val(),
            				"classDetail.classMin":$("#classMin").val(),"classDetail.classSec":$("#classSec").val()},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '操作成功!', function ()
                					{
                						parent.addClassDetailMark = false; 
                						parent.fresh("grade");
                         				parent.tab.selectTabItem("grade");
                         				parent.tab.removeTabItem("addClassDetail");
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
               parent.addClassDetailMark = false;
               parent.tab.selectTabItem("grade");
               parent.tab.removeTabItem("addClassDetail");  
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
<div>
    <form name="form1" method="post"  id="form1">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	 <tr>
                <td align="right" class="l-table-edit-td">考试类型:</td>
                <td align="left" class="l-table-edit-td"><input type="text" id="exam" value="${grade.examCategory.examName}" disabled="true"   /></td>
           	 	<td></td>
           	 </tr>
             <tr>
                <td align="right" class="l-table-edit-td">班级类型:</td>
                <td align="left" class="l-table-edit-td"><input type="text" id="class" value="${grade.gradeCategory.gtypeName}" disabled="true" /></td>
                <td><input value="${grade.gradeId}" name="gradeId"  type="hidden"  id="gradeId"></td>
            </tr>
            
         	<tr>
                <td align="right" class="l-table-edit-td">老师:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="tchId"   validate="{required:true}"  name="teacher" />
                </td>
            </tr>
            <!--  <tr>
                <td align="right" class="l-table-edit-td">老师:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="teacher"/>
                </td>
            </tr> -->
            <tr>
                <td align="right" class="l-table-edit-td">标题:</td>
                <td align="left" class="l-table-edit-td"><input name="classDetail.classTitle" type="text" id="classTitle" ltype="text"  validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">免费试听:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="rbtnl_0" type="radio" name="classDetail.classIfFree" value="0" checked="checked" /><label for="rbtnl_0">否</label> <input id="rbtnl_1" type="radio" name="classDetail.classIfFree" value="1" /><label for="rbtnl_1">是</label>
                </td><td align="left"></td>
            </tr>   
             <tr>
                <td align="right" class="l-table-edit-td">版本:</td>
                <td align="left" class="l-table-edit-td"><input  name="classDetail.classYear" type="text" id="classYear" ltype="text" digits="true"  validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">听课次数:</td>
                <td align="left" class="l-table-edit-td"><input  name="classDetail.listenNum" value="6" type="text" id="listenNum" ltype="text" digits="true"  validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">高清频地址:</td>
                <td align="left" class="l-table-edit-td"><input value="http://" name="classDetail.classHdUrl" type="text" id="classHdUrl" ltype="text"  validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">三分频地址:</td>
                <td align="left" class="l-table-edit-td"><input value="http://"  name="classDetail.classTriUrl" type="text" id="classTriUrl" ltype="text"  validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>     
             <tr>
                <td align="right" class="l-table-edit-td">音频地址:</td>
                <td align="left" class="l-table-edit-td"><input value="http://"  name="classDetail.classAudio" type="text" id="classAudio" ltype="text"  validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>   
            <tr>
                <td align="right" class="l-table-edit-td">开放日期:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="classDetail.classOpenTime" type="text" id="classOpenTime" ltype="date" validate="{required:true}" />
                </td><td align="left"></td>
            </tr>
			<tr>
                <td align="right" class="l-table-edit-td">课节时间:</td>
            </tr>
            <tr>
            	<td align="right" class="l-table-edit-td">分钟:</td>
                <td align="left" class="l-table-edit-td" ><input name="classDetail.classMin" type="text" id="classMin" ltype='spinner' ligerui="{type:'int',isNegative:false}" value="60" class="required" validate="{digits:true,min:1,max:300}" />
              	</td>
              	<td align="left"></td>
            </tr>
             <tr>
            	<td align="right" class="l-table-edit-td">秒:</td>
                <td align="left" class="l-table-edit-td" >
                    <input name="classDetail.classSec" type="text" id="classSec" ltype='spinner' ligerui="{type:'int',isNegative:false}" value="30" class="required" validate="{digits:true,min:0,max:60}" />
              	</td>
              	<td align="left"></td>
            </tr>
        </table>

<br/>
<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="button" value="取消" class="l-button l-button-test" />
    </form>
</div>
<div style="display:none">
    <!--  数据统计代码 --></div>

    
</body>
</html>
