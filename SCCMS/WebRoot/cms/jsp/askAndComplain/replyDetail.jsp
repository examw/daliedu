<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<s:iterator value="reply" var="r" status="status">
			<tr><td>回复${status.index+1 }</td></tr>
			<tr>
			<td style="border:1px solid #D0E4FE" width="400px" height="50px">
				<div>${r.replyContent}</div>
			</td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>