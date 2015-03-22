<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
 <div class="kctext"><img src="/main/images/kctext.jpg" /></div>
  <div class="kccon">
    <ul><s:iterator value="list" var="exam" status="col">
    <li>
    	<div class="kcb1"><a href="" target="_blank">${exam.examName}</a></div>
        <div class="kcb2">
     	<s:iterator value="# exam.children" var="c" status="status">
	     	<s:if test="#status.getIndex()<9">
	     		<a href="/main/main?examId=${c.examId}" >${c.examName}</a>　|	
	     	</s:if>
	     	<s:else></s:else>
     	</s:iterator>
		<s:if test="#exam.children.size>9">
  			<div onmousemove="onMous('id${col.index+1}')" onmouseout="onOver('id${col.index+1}')" style="position:relative;z-index:2;float:right;">
	            <a href="/" style="color:#f63;" title="更多;&gt;">更多&gt;&gt;</a>
	            <div class="gcglsw gcglsw3" id="id${col.index+1}">
	  				<s:iterator value="# exam.children" var="c" status="status"><s:if test="#status.getIndex()>=9"><a href="javascript:return%20false;" href="/main/main?examId=${c.examId}"> ${c.examName}</a>　|</s:if><s:else></s:else></s:iterator>
	  			</div>
  			</div>
  		</s:if>
  		<s:else></s:else></div><s:else></s:else>
  		</li></s:iterator></ul>
  </div>
