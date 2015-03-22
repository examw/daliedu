<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addLecture</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/style.css" rel="stylesheet" type="text/css" />
      <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
   	<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script type="text/javascript">
       $(function ()
        {
			if("${dataFileUrl}"){
				$(".up").hide();
			}
			$("input[name='uploadType']").change(function(){
				if($(this).val()==1||$(this).val()==2)
				{
					$(".up").show();
				}else{
					$(".up").hide();
				}
			});
        });   
    </script>
</head>

<body style="padding:10px "  >

    <form name="form1" method="post" id="form1" enctype="multipart/form-data" action="${pageContext.request.contextPath}/grade/uploadDataFile">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<s:if test="dataFileUrl != null">
        		<tr>
            	<td>
              		原附件地址:${dataFileUrl}
              	 </td>
            	</tr>
            	<tr>
                <td align="right" class="l-table-edit-td">
                	<label><input type="radio" value="1" name="uploadType"/>修改并删除</label>
                	<label><input type="radio" value="2" name="uploadType"/>仅修改</label>
                	<label><input type="radio" value="3" name="uploadType"/>删除</label>
				</td>
				<input name="oldDataUrl" value="${dataFileUrl}" type="hidden"/>
           		</tr>
        	</s:if>
            <tr class="up">
            	<td>
              	 请选择需要上传的文件：<input type="hidden" name="gradeId" value="${gradeId}" />
              	 </td>
            </tr>
            	<tr class="up">
                <td align="right" class="l-table-edit-td"><input type="file" id="file" name="fileInput"/></td>
            </tr>
            <tr>
            	<td></td>
            </tr>
        </table>
        <input type="submit" value="提交" id="Button1" class="l-button l-button-submit" />
     </form>
</body>
</html>