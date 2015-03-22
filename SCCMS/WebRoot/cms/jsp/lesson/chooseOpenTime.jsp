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
   	<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#opentimeset").ligerDateEditor({});
    	});
       function submit(){
    	   var opentime = $("#opentimeset").val();
    	   if(!opentime){
    		   alert("请设置时间");
    		   return false;
    	   }
    	   console.info(opentime);
    	   return opentime;
       }
    </script>
</head>

<body>
	<div style="margin:10px;padding:10px">
		<span>开放时间:</span><input type="text" id="opentimeset"/>
	</div>
</body>
</html>