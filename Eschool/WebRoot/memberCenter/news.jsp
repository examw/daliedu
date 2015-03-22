<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>优异网校会员中心</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
.w1 {
    float: left;
    font-size: 16px;
    font-style:bold;
    height: 35px;
    line-height: 35px;
    padding-top: 25px;
    text-align: center;
    width: 670px;
}
</style>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
	<div class="content">
		<h1 class="w1">${news.title}</h1>
		<span style="float:right;margin-right:10px"><fmt:formatDate value="${news.addtime}" type="both"></fmt:formatDate></span>
		<div style="clear:both"></div>
		<div style="margin:10px;word-wrap:break-word; overflow:hidden;width:700px">
			${news.content}
		</div>
	</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
