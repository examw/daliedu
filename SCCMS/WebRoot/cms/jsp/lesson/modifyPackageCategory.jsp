<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>modifyPackageCategory</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/uploadify.css" rel="stylesheet" type="text/css" />
   	<script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script> 
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/cms/js/swfobject.js"></script>
	<script type="text/javascript"src="${pageContext.request.contextPath}/cms/js/jquery.uploadify.v2.1.4.js"></script>
    <script type="text/javascript">window.UEDITOR_HOME_URL= "/ueditor/"</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/cms/ueditor/editor_config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/cms/ueditor/editor.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){   
	        $("#form1").change(function(){  
	               parent.modifyPackageCategoryMark = true ; 
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
                	$.post("${pageContext.request.contextPath}/package/packageCategoryModify",{"packageCategory.ptypeName":$("#ptypeName").val(),
                							"packageCategory.ptypeId":$("#ptypeId").val(),"packageCategory.ptypeDescription":editor.getContent()},
                							function(ok){
                								if(ok){
                									$.ligerDialog.success( '修改成功!', function ()
                									{
                									 parent.f_closeWindow();
                									}); 
                								}else{
                									alert('修改失败');
                								}
                							},"json");
                	}
            });
            $("form").ligerForm();
            $(".l-button-test").click(function ()
            {
            	 parent.f_closeWindow();
            });
        });  
        
        $(document).ready(function() {
			$('#fileInput').uploadify( {
				'uploader' : '${pageContext.request.contextPath}/cms/js/uploadify.swf',
				'script' : '${pageContext.request.contextPath}/package/updateImage;jsessionid=<%=session.getId()%>', 
				'folder' : 'upload',
				'cancelImg' : '${pageContext.request.contextPath}/cms/css/images/cancel.png',
				'fileDataName' : 'fileInput', //和input的name属性值保持一致就好，Struts2就能处理了   
				'queueID' : 'fileQueue',
				'auto' : true,//是否选取文件后自动上传   
				'multi' : false,//是否支持多文件上传 
				'simUploadLimit' :5,//一次同步上传的文件数目   
				'fileDesc' : '支持格式:gif', //如果配置了以下的'fileExt'属性，那么这个属性是必须的 
				'fileExt' : '*.gif;',//允许的格式 
				'queueSizeLimit':5,
				'sizeLimit' : 5120000, //单位为字节
				'buttonText' : '重新上传',//按钮上的文字   
				'displayData' : 'percentage',//有speed和percentage两种，一个显示速度，一个显示完成百分比    
				'onError' : function(event, ID, fileObj, errorObj) {
					if (errorObj.type === "File Size") {
						alert('超过文件上传大小限制,文件会被自动清除！');
						$('#fileInput').uploadifyClearQueue(ID);
					}
				},
				'onQueueFull': function(event,data) {  //清除一个的时候.对应的循序清楚数组中的，后面的向前赋值。
	     					alert("上传数目已满. 最多上传5个文件！");
	    		 },
				'onComplete' : function(event, queueID, fileObj, response, data) {
					var s=response.split(",");
				   	$("#result").html(s[0]); 					//显示上传成功结果
				    setInterval("showResult()", 2000); 	 	//两秒后删除显示的上传成功结果 	
				}
	
			});
	
		});
        function showResult() {//删除显示的上传成功结果   
			$("#result").html("");
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
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	 <tr>
                <td align="right" class="l-table-edit-td">套餐类型:</td>
                <td align="left" class="l-table-edit-td">
                <input name="packageCategory.ptypeName" type="text" id="ptypeName" value="${packageCategory.ptypeName}"/>
                 <input type="hidden" id="ptypeId"" name="packageCategory.ptypeId" value="${packageCategory.ptypeId}"/>
                </td>
           	 </tr>
           	 <tr>
                <td align="right" class="l-table-edit-td">套餐图片:</td> 
                <td align="left" class="l-table-edit-td">
                <div id="fileQueue"></div>
				<input type="file" name="fileInput" id="fileInput" /><div id="result"></div>
                </td> 
           	 </tr>
            <tr>
                <td align="right" class="l-table-edit-td">套餐描述:</td>
                <td align="left" class="l-table-edit-td"> 
                <textarea cols="100" rows="4" class="l-textarea" id="ptypeDescription" style="width:400px"  name="packageCategory.ptypeDescription">${packageCategory.ptypeDescription}</textarea>
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
