<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>modifyPackageCategory</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/style.css" rel="stylesheet" type="text/css" />
   	<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog2.js" type="text/javascript"></script>
    <script type="text/javascript">window.UEDITOR_HOME_URL= "/ueditor/"</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/cms/ueditor/editor_config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/cms/ueditor/editor.min.js"></script>
    <script type="text/javascript">
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
                    
                	$.post("${pageContext.request.contextPath}/exam/examUpdate",
                					{examName:$("#examName").val(),
                					id:"${exam.id}",
									examDescription:editor.getContent(),
									examUrl:$("#examUrl").val()},
          							function(ok){
          							if(ok==true){
          								$.ligerDialog.success('修改成功');
          								setTimeout(function(){parent.f_closeWindow();},2000);
          								 
          							}else{
          								$.ligerDialog.error('修改失败');
          							}
								},
							"json"
          					);
                	}
            });
            $("form").ligerForm();
            $(".l-button-test").click(function ()
            {
                parent.f_closeWindow();
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

    <form name="form1" method="post"  id="form1">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	 <tr>
                <td align="right" class="l-table-edit-td">考试类型:</td>
                <td align="left" class="l-table-edit-td">
                <input name="exam.examName" type="text" id="examName" value="${exam.examName}"  validate="{required:true,maxlength:15}" />
                </td>
           	 </tr>
           	 <tr>
                <td align="right" class="l-table-edit-td">演示视频:</td>
                <td align="left" class="l-table-edit-td">
                <input name="exam.examName" type="text" id="examUrl" value="${exam.examUrl}"/>
                </td>
           	 </tr>
            <tr>
                <td align="right" class="l-table-edit-td">考试描述:</td>
                <td align="left" class="l-table-edit-td"> 
                <textarea cols="100" rows="6" class="l-textarea" id="ptypeDescription" style="width:402px"  name="exam.examDescription">${exam.examDescription}</textarea>
                </td><td align="left"></td>
                <script type="text/javascript">
						/*     var editor = new UE.ui.Editor();
    							editor.render("myEditor"); */
    							//1.2.4以后可以使用一下代码实例化编辑器
    							//UE.getEditor('myEditor')
   						 var editor;
        				editor = new UE.ui.Editor( { 
           				toolbars:[['undo', 'redo', '|','bold', 'italic', 'underline', 'strikethrough', 'removeformat',
            			'fontfamily', 'fontsize','forecolor']],
            			initialContent:"",
             			initialFrameWidth:400,
        				initialFrameHeight:180,
        				focus:true
        				//pasteplain:true        //纯文本粘贴
        				} );
        				editor.render('ptypeDescription');
				</script> 
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
