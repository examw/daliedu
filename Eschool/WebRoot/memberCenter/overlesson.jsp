<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过期课程</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
<script language="javascript" src="../js/UserLesson.js"></script>
<script type="text/javascript">
     $(function(){
      	$("#class_").addClass("hhover");
      });   
     
</script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="#">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">网络课堂</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">已过期课程</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li><a href='/member/myLessons'>我的课程</a></li>
<li><a href='/member/noPayLessons'>未支付课程</a></li>
<li  id="xz"><a href='/member/overLessons'>已过期课程</a></li>
<li><a href="/member/studyInfo">学习记录</a></li>
<li><a href="#">我的学分</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
 <tr>
      <td height="24" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><p class="back_g"><strong>课程名称</strong></p></td>
      <td align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong></strong></td>
      <td align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>过期时间</strong></td>
      <td width="149" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
 </tr>
 <s:iterator value="gradeList" var ="g">
<tr>
   <td width="344" class="xxzx_ber_e font_14">
   &nbsp;<img src="../images/pic_bh.gif">&nbsp;
   <a href="#" title="${g.examCategory.examName}-${g.gradeCategory.gtypeName}">${g.examCategory.examName}-${g.gradeCategory.gtypeName}</a>
   </td>
   <td align="center" width="84" class="xxzx_ber_e font_12"></td>
   <td align="center" width="85" class="xxzx_ber_e font_12"><fmt:formatDate value="${g.gradeDueTime}" pattern="yyyy-MM-dd" /> </td>
   <td align="center" class="xxzx_ber_e font_a">
 	 ----
   </td>
</tr>
</s:iterator>
</tbody>
</table>
<s:if test="gradeList.size==0">
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
</html>
