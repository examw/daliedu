<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript">
	function note()
	{
		alert("没有对应的学生信息");
		location="${pageContext.request.contextPath}/cms/jsp/student/export.jsp";
	}
</script>
</head>
<body onload="note()">
</body>
</html>
