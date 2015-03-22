<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>
</title>
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
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script>
    <script type="text/javascript"> 
    	function check()
    	{
    		var content = $("#content").val();
    		if($.trim(content).length<10)
    		{
    			$("#msg").show();
    			return false;
    		}
    		$("#msg").hide();
    		return true;
    	}
    	//提交
    	function commit()
    	{
    		if(check())
    		{
    			  $.ligerDialog.confirm('提交了就不能改了！确定提交吗', function (yes)
    			  {
    			  		if(yes)
    			  		{
    			  			$.ajax({
    			  				async:true,
    			  				type:"POST",
    			  				url:"../complain/addReply",
    			  				data:{"reply.acId":$("#acId").val(),"reply.replyContent":$("#content").val()},
    			  				dataType:'json',
    			  				success:function(data)
    			  				{
    			  					if(data)
    			  					{
    			  						alert("回复成功!");
    			  						parent.parent.fresh("complainList");
            							parent.parent.closeTab("reply");
    			  					}
    			  				}
    			  				
    			  			
    			  			});
    			  		}
    			  });
    		}
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
    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/complain/load">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!--  -------------------------  -->
            <tr>
                <td align="right" class="l-table-edit-td">编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input class="l-text" name="reply.ac_id" type="text" id="acId" value="${ac.acId }" disabled="disabled"/></td>
                <td align="left"><span style="color:red" id="nameInfo"></span></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">内容:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
                <textarea name="teacher.tchDescription" cols="100" rows="4" class="l-textarea" id="description" style="width:400px" disabled="disabled">${ac.acContent}</textarea>
                <td align="left"><span style="color:red" id="pwdInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">答复:</td>
                <td align="left" class="l-table-edit-td" colspan="2"> 
                <textarea name="reply.replyContent" cols="100" rows="4" class="l-textarea" id="content" style="width:400px" ></textarea>
                </td> <td align="left"><span style="color:red" id="dInfo"></span></td>
            </tr>
            <tr>
            	<td colspan="3"><span id="msg" style="color:red;display:none">请认真答复,字数不少于10个!</span></td>
            </tr>
        </table>
 <br />
<input type="button" value="提交" id="Button1" class="l-button l-button-submit" onclick="commit();"/> 
<input type="button" value="测试" class="l-button l-button-test"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>    
</body>
</html>
