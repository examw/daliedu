<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学习记录</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="/memberCenter/member.jsp">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="/member/myLessons">网络课堂</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">学习记录</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li><a href='/member/myLessons'>我的课程</a></li>
<li><a href='/member/noPayLessons'>未支付课程</a></li>
<li><a href='/member/overLessons'>已过期课程</a></li>
<li id="xz"><a href="/member/studyInfo">学习记录</a></li>
<li><a href="#">我的学分</a></li>

</ul>
</span>
</h1>
<div class="ListContent">
<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
<tr>
    <td height="24" bgcolor="#f9f9f9" align="center" class="xxzx_ber_a" width="344" ><p class="back_g"><strong>课程名称</strong></p></td>
    <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>学习时间</strong></td>
    <td bgcolor="#f9f9f9" align="center" width="149" class="xxzx_ber_a"><strong>学习IP</strong></td>
</tr>
<s:iterator value="list" var="record">
<tr>
    <td width="344" class="xxzx_ber_e font_14"> 
    &nbsp;<img src="../images/pic_bh.gif">&nbsp;
   <a href="/member/classroom?classId=${record.classId}" title="${record.recordName }">
   <c:set var="name" value="${record.recordName}"/> <c:choose><c:when test="${fn:length(name) > 22}"><c:out value="${fn:substring(name, 0, 22)}..." /></c:when><c:otherwise><c:out value="${name}" /></c:otherwise>
   </c:choose>
   </a>
   </td>
 
   <td align="center"  class="xxzx_ber_e font_12"><fmt:formatDate value="${record.recordStartTime}" pattern="yyyy-MM-dd  hh:mm:ss" /></td>
   <td align="center" width="149" class="xxzx_ber_e font_14">${record.recordIp }</td>
</tr>
</s:iterator>
</tbody>
</table>
<s:if test="list.size==0">
<div class="emptyDiv2">
    <span class="no">&nbsp;</span>
</div>
</s:if>
</div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
<script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
     $(function(){
      	$("#class_").addClass("hhover");
      });   
     
</script>
</html>
