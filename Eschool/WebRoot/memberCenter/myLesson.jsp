
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的课程</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
<script language="javascript" src="../js/UserLesson.js"></script>
<script type="text/javascript">
     $(function(){
      	$("#class_").addClass("hhover");
      });   
      function showPapers(gid)
     	{
     	var name = escape(escape($("#name_"+gid).val()));
     	location = "/member/paperList?gradeId="+gid+"&gradeName="+name;
     	}
</script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="#">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">网络课堂</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的课程</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li id="xz"><a href='/member/myLessons'>我的课程</a></li>
<li><a href='/member/noPayLessons'>未支付课程</a></li>
<li><a href='/member/overLessons'>已过期课程</a></li>
<li><a href="/member/studyInfo">学习记录</a></li>
<li><a href="#">我的学分</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
 <tr>
    <td height="24" bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><p class="back_g"><strong>课程名称</strong></p></td>
    <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>开通时间</strong></td>
    <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>关闭时间</strong></td>
    <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>学&nbsp;分</strong></td>
    <td bgcolor="#f9f9f9" align="center" width="149" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
</tr>
 <s:iterator value="myLesson.classPackages" var="cp" status="col">
 <tr>
   <td width="344" class="xxzx_ber_c font_14">
   &nbsp;<img name="myImg" id='img_${col.index+1}' alt="展开" src='../images/pic_011.gif' class="img_b"   onclick="showDivById('${col.index+1}','myDiv','myImg'),stra('${col.index+1}','查看详细','收&nbsp;起')"/>&nbsp;
          <a href="javascript:;"  onclick="showDivById('${col.index+1}','myDiv','myImg'),stra('${col.index+1}','查看详细','收&nbsp;起')" title='${cp.pkgName}'>${cp.pkgName}<s:if test="#cp.limit">[补课卡]</s:if></a>
   </td>
   <td align="center" width="84" class="xxzx_ber_e font_12">
        
    </td>
    <td align="center" width="85" class="xxzx_ber_e font_12">
         </td>
    <td align="center" width="102" class="xxzx_ber_e font_14"> 0</td>                               
    <td align="center" class="xxzx_ber_e font_a">
 		<a id='a${col.index+1}' class="disBtn"  name="aDis" href="javascript:;"   onclick="showDivById('${col.index+1}','myDiv','myImg'),stra('${col.index+1}','查看详细','收&nbsp;起')" >查看详细</a>
  </td>
</tr>
<tr>
   <td class="xxzx_ber_d font_14" colspan="6">
   <div name="myDiv" class="wzgk_oned center" id="${col.index+1}" style="display: none;">
   <table cellspacing="0" cellpadding="0" border="0" width="680">
   <tbody>
	<tr>
     <td bgcolor="#fff3db" align="center" width="344" style="line-height:26px;"><p class="back_g">课程名称</p></td>
     <td bgcolor="#fff3db" align="center" width="84" style="line-height:26px;">开通时间</td>
     <td bgcolor="#fff3db" align="center" width="85" style="line-height:26px;">关闭时间</td>
     <td height="26" bgcolor="#fff3db" align="center" width="102" style="line-height:26px;">学&nbsp;分</td>
     <td height="26" bgcolor="#fff3db" align="center" width="149" style="line-height:26px;">操&nbsp;作</td>
   </tr>
   <s:iterator value="#cp.grade" var="g" status="status">
  	<tr>                                    
	<td  class="xxzx_ber_e font_14"> &nbsp;&nbsp;
       <a href='/member/myClass?gradeId=${g.gradeId}&&i=${cp.itemId}' title="${g.examCategory.examName}-${g.gradeCategory.gtypeName}">${g.examCategory.examName}-${g.gradeCategory.gtypeName}</a>
       <input type="hidden" id="name_${g.gradeId }" value="${g.examCategory.examName}-${g.gradeCategory.gtypeName}">
    </td>
    <td align="center"  class="xxzx_ber_e font_12">
      <fmt:formatDate value="${cp.orderTime}" pattern="yyyy-MM-dd" />
    </td>
    <td align="center" class="xxzx_ber_e font_12">
      <fmt:formatDate value="${g.gradeDueTime}" pattern="yyyy-MM-dd" /> </td>
    <td align="center"  class="xxzx_ber_e font_14">0</td>                               
    <td align="center" class="xxzx_ber_e font_a">
 		<a href="/member/myClass?gradeId=${g.gradeId}&&i=${cp.itemId}">学习</a>
        <a href="javascript:;" onclick="showPapers(${g.gradeId});">作业</a>
  		<a href="/v_2012/usercenter/StudyCenter/myclass.aspx?code=${g.gradeId}">下载</a>
  </td>
</tr>
   </s:iterator>
   </tbody>
   </table>
   </div>
  </td>
</tr>
 
</s:iterator>
 <s:iterator value="myLesson.grade" var="g" status="col">
<tr>                                    
	<td width="344" class="xxzx_ber_e font_14"> &nbsp;<img src="../images/pic_bh.gif">&nbsp;
       <a href="/member/myClass?gradeId=${g.gradeId}&&i=${g.itemId}" title="${g.examCategory.examName}-${g.gradeCategory.gtypeName}">${g.examCategory.examName}-${g.gradeCategory.gtypeName}</a>
    </td>
    <td align="center" width="84" class="xxzx_ber_e font_12">
        <fmt:formatDate value="${g.orderTime}" pattern="yyyy-MM-dd" />
    </td>
    <td align="center" width="85" class="xxzx_ber_e font_12">
         <fmt:formatDate value="${g.gradeDueTime}" pattern="yyyy-MM-dd" /> </td>
    <td align="center" width="102" class="xxzx_ber_e font_14"> 0</td>                               
    <td align="center" class="xxzx_ber_e font_a">
 		<a href="/member/myClass?gradeId=${g.gradeId}&&i=${g.itemId}">学习</a>
        <a href="/v_2012/usercenter/LessonWork/myClassWork.aspx?code=${g.gradeId}">作业</a>
  		<a href="/v_2012/usercenter/StudyCenter/myclass.aspx?code=${g.gradeId}">下载</a>
  </td>
</tr>
  </s:iterator>
</tbody>
</table>
<s:if test="myLesson.grade.size==0&&myLesson.classPackages.size==0">
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

