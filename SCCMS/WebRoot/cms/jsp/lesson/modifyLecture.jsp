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
 	<script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
 	<script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
 	<script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
 	<script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
 	<script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor_config.js"></script>
   <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor.min.js"></script>
    <style type="text/css">
        .clear {
            clear: both;
        }
    </style>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
    </head>
<script type="text/javascript">
	   var eee;
	   $(document).ready(function(){   
	        $("#form1").change(function(){  
	               parent.modifyLectureMark  = true; 
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
                     $.post(
            				"${pageContext.request.contextPath}/grade/updateLecture",
            				{"lecture.classId":$("#classId").val(),"lecture.lectContent":UE.getEditor('editor').getContent(),
            				"lecture.lectMin":$("#lectMin").val(),"lecture.lectSec":$("#lectSec").val(),
            				"lecture.lectId":$("#lectId").val(),"lecture.lectAddTime":$("#lectAddTime").val(),
            				"lecture.lectOrderId":$("#lectOrderId").val()},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success( '修改成功!', function ()
                					{
                						parent.modifyLectureMark  = false; 
                						parent.fresh("checkClassDetail");
                						parent.tab.selectTabItem("checkClassDetail");
                    					parent.tab.removeTabItem("modifyLecture");
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
               parent.modifyLectureMark  = false; 
               parent.tab.selectTabItem("checkClassDetail");
               parent.tab.removeTabItem("modifyLecture");
            });
        });   

</script>

</head>

<body style="padding:10px "  >
    <form name="form1" method="post" id="form1" action="${pageContext.request.contextPath}/grade/lectureUpdate">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td><input name="lecture.classId" value="${lecture.classId}" type="hidden" id="classId" /></td>
                <td><input name="lecture.lectId" value="${lecture.lectId}" type="hidden" id="lectId" /></td>
                <td><input name="lecture.lectAddTime" value="${lecture.lectAddTime}" type="hidden" id="lectAddTime" /></td>
                <td><input name="lecture.lectOrderId" value="${lecture.lectOrderId}" type="hidden" id="lectOrderId" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">开放时间:</td>
            </tr>
            <tr>
            	<td align="right" class="l-table-edit-td">分钟:</td>
                <td align="left" class="l-table-edit-td" >
                    <input name="lecture.lectMin" type="text" id="lectMin" ltype='spinner' ligerui="{type:'int',isNegative:false}" value="${lecture.lectMin}" class="required" validate="{digits:true,min:1,max:300}" />
              	</td>
              	<td align="left" id="checkMin"></td>
          <!--   </tr>
             <tr> -->
            	<td align="right" class="l-table-edit-td">秒:</td>
                <td align="left" class="l-table-edit-td" >
                    <input name="lecture.lectSec" type="text" id="lectSec" ltype='spinner' ligerui="{type:'int',isNegative:false}" value="${lecture.lectSec}" class="required" validate="{digits:true,min:0,max:60}" />
              	</td>
              	<td align="left" id="checkSec"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">讲义内容:</td>
                <td align="left" class="l-table-edit-td" colspan="5"> 
               	<textarea name="lecture.lectContent" cols="100" rows="10" class="l-textarea" id="editor" style="width:651px" >${lecture.lectContent}</textarea> 
                </td><td align="left"></td>
                
            </tr>
         
        </table>
 	<br/>
	<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
	<input type="button" value="取消" class="l-button l-button-test"  name="cancel"/> 
    </form>
<div style="display:none">
    <!--  数据统计代码 --></div>
</body>
<script type="text/javascript">
	//实例化编辑器
/* 	var lectContent; */
   var editor= UE.getEditor('editor');
     
</script>
</html>
