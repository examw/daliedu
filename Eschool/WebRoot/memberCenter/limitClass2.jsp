<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>听课</title>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script>
	$(function(){
		alert("听课次数已达上限,想继续听课请联系管理员");
		window.history.go(-1);
	});
</script>
</head>
<body>
</body>
</html>