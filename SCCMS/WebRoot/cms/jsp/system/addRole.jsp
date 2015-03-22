<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head><title>
</title>
    <link href="../../css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="../../css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="../../js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="../../js/base.js" type="text/javascript"></script>
    <script src="../../js/ligerForm.js" type="text/javascript"></script>
    <script src="../../js/ligerComboBox.js" type="text/javascript"></script>
    <script src="../../js/ligerButton.js" type="text/javascript"></script>
    <script src="../../js/ligerDialog.js" type="text/javascript"></script>
    <script src="../../js/ligerSpinner.js" type="text/javascript"></script>
    <script src="../../js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="../../js/ligerTip.js" type="text/javascript"></script>
    <script src="../../js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="../../js/jquery.metadata.js" type="text/javascript"></script>
    <script src="../../js/messages_cn.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTree1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
	 <style type="text/css">
   .l-tree .l-tree-icon-none img {
    border: 0 none;
    height: 16px;
    width: 16px;
	}
    </style>
    <script type="text/javascript">
    	var eee ,manager;
    	$(function(){
    		 $("#menu").ligerComboBox({ 
        	 		width : 180, 
            		selectBoxWidth: 500,
             		selectBoxHeight: 250, 
             		valueField: 'id',
             		textField:'text',
             		treeLeafOnly: false,
              		valueFieldID: 'menuId',
              		tree:{url:"${pageContext.request.contextPath}/system/menuTree"}
            });
            manager = $("#menu").ligerGetTreeManager();
    	});
    	  function getChecked()
        {
            var notes = manager.getChecked();
            var text = "";
            for (var i = 0; i < notes.length; i++)
            {
                
                text += notes[i].data.text + ",";
            }
            alert('选择的节点数：' + text);
        }
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
            				"${pageContext.request.contextPath}/system/roleAdd",{"role.roleName":$("#roleName").val(),"role.menuId":$("#menuId").val(),"role.roleDescribe":$("#roleDescribe").val()},
            				function(data){
            					if(data){
            						 LG.tip('保存成功!');
            					}
            				},
            				"json"
            			);
                }
            });
            $("form").ligerForm();
            $(".l-button-test").click(function ()
            {
                alert(v.element($("#txtName")));
            });
        });  

    </script>
    <style type="text/css">
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>

</head>

<body style="padding:10px">
 <a class="l-button" onclick="getChecked()" style="float:left;margin-right:10px;">获取选择(复选框)</a> 
    <form name="form1" method="post"  id="form1">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">名字:</td>
                <td align="left" class="l-table-edit-td"><input name="roleName" type="text" id="roleName" ltype="text"  validate="{required:true,minlength:2,maxlength:10}" /></td>
                <td align="left"></td>
            </tr>       
            <tr>
                <td align="right" class="l-table-edit-td">权限:</td>
                <td align="left" class="l-table-edit-td">
   				<input type="text" id="menu" name="role.menuId" validate="{required:true}"/>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">描述:</td>
                <td align="left" class="l-table-edit-td"> 
                <textarea  name="role.roleDescribe" id="roleDescribe" cols="100" rows="4" class="l-textarea" style="width:400px"></textarea>
                </td><td align="left"></td>
            </tr>
        </table>
 <br />
<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="reset" value="重置" class="l-button l-button-reset"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>
</body>
</html>
