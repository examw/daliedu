<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<s:iterator value="#cp.grade" var="g" status="status">

</s:iterator>
<s:iterator value="myLesson.grade" var="g" status="col">
<li class="Title">
<p class="course">
	<img src="../images/pic_bh.gif" width="18" height="15" />&nbsp;${g.examCategory.examName}${g.gradeCategory.gtypeName}<s:if test="#g.limit">[补课卡]</s:if></p>
		<span class="courseList">
			<s:iterator value="#g.classDetails" var="cd" status="col">
			<s:if test="#col.getIndex()<6">
			<a href="/member/myClass?gradeId=${g.gradeId}&&i=${g.itemId}">0${col.index+1}讲</a>
			</s:if>
			</s:iterator>
			<s:if test="#g.classDetails.size>6">
			<a href="/member/myClass?gradeId=${g.gradeId}">更多...</a>
			</s:if>
		</span>
</li>
</s:iterator>
<li id="morelesson"><a href="/member/myLessons?stuId=<s:property value="#session.student.stuId"/>">更多课程>></a></li>
<s:else>
<li class="Title">您还没有选购课程</li>
</s:else>
</ul>
