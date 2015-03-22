<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.l-table-edit {margin-top:100px}
</style>
<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
function commit()
{
		var value = $("#img_file").val();
		if(!value)
		{
			alert("请选择图片文件");
			return;
		}
		if(value.indexOf(".jpg")!=-1||value.indexOf(".png")!=-1)
		{
			$("#fileForm").submit();
			return;
		}
		else
		{
			alert("文件类型限制,只能是jpg或png");
			return;
		}
		
}
</script>
</head>
<body>
	<center>
        <table cellpadding="0" cellspacing="0" class="l-table-edit">
        	<!--  -------------------------  -->
        	<tr>
        		<td	align="center" style="height:40px">原始图像
        		</td>
        		<td align="center" style="height:20px" colspan="2">选择文件上传
        		</td>
        	</tr>
            <tr>
                <td align="right" class="l-table-edit-td"><img src="<%=request.getParameter("imgUrl")%>"></td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
				<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/user/uploadTchImg" id="fileForm">
                	<input id="img_file" type="file" name="mf" accept="image/png, image/jpeg">
					<input type="hidden" name="tchId" value="<%=request.getParameter("id")%>">
                </form>
                </td>
                <td align="left"><input id="upload" style="" type="button" value="上传" name="upload" onclick="commit();"></td>
            </tr>
            <tr><td align="center" colspan="3" style="height:30px"><input type="button" value="返回" onclick="history.back()"></td></tr>
        </table>
 <br />
    </center>
</body>
</html>
