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
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script type="text/javascript">
   
    		/*  var id =parent.getNodeId(); */
    	var j;
    	function submit(){
    			$("#form1").submit();
    		}
    		//老师下拉框
	     $(function ()
	          {
	             $("#parent").ligerComboBox({
	              width : 180, 
	              selectBoxWidth: 180,
	              selectBoxHeight: 200, 
	              valueField: 'id', 
	              valueFieldID:'parentId',
	              treeLeafOnly: false,
	              initValue:'${newClass.parentId}',
	              tree: { url: '${pageContext.request.contextPath}/new/tree.action',checkbox: false}        
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
                submitHandler: function (form)
                {
                	 $.ajax({
                         url:'${pageContext.request.contextPath}/new/save.action',
                         dataType:'json',
                         type:'post',
                         data:$('#form1').serialize(),
                         error:function(data){
                         },
                         success:function(data){
                        	LG.showSuccess(data.message, function(data){
                        		if(!data.isError){
                        			parent.f_reload();
                        			parent.window.addNewClass.close();
                        		}
                        		
                        	});
                         }
                     });
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
<body style="padding:10px">
<div>
    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/new/save.action">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	 <tr>
                <td align="right" class="l-table-edit-td">资讯名称:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="classCname" value="${newClass.classCname }"   validate="{required:true}"  name="classCname"   />
                <input type="hidden" value="${newClass.id}" name="id"   />
                </td>
           	 	<td></td>
           	 </tr>
             <tr>
                <td align="right" class="l-table-edit-td">资讯英文:</td>
                <td align="left" class="l-table-edit-td"><input type="text" id="classEname" value="${newClass.classEname}" name="classEname" /></td>
                <td></td>
            </tr>
              <tr>
                <td align="right" class="l-table-edit-td">资讯路径:</td>
                <td align="left" class="l-table-edit-td"><input type="text"   validate="{required:true}"  id="urlPath" value="${newClass.urlPath}" name="urlPath" /></td>
                <td></td>
            </tr>
         	<tr>
                <td align="right" class="l-table-edit-td">上级资讯:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="parent"  name="parent" />
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">关键字:</td>
                <td align="left" class="l-table-edit-td"><input name="keywords" type="text" value="${newClass.keywords}" ltype="text"  validate="{required:true}" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">排序:</td>
                <td align="left" class="l-table-edit-td"><input type="text" id="orderId" value="${newClass.orderId}"  name="orderId"/></td>
                <td></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">介绍:</td>
                <td align="left" class="l-table-edit-td"><input type="text" id="class" value="${newClass.descri}"  name="descri" /></td>
                <td></td>
            </tr>
        </table>
	<br/>

</form>
</div>
</body>
</html>
