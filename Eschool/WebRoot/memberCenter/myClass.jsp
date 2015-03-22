<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>课程详细</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
    $(function(){
      	$("#class_").addClass("hhover");
      });   
    $(function(){
	//初始化页码
	var page = Number("${total/pagesize}");//一共多少页
	var currentPage = Number("${page}");//当前页
	var temp = 0;
	var gradeId =${gradeId}
	if((page*10)%10!=0)	page = Math.floor(Number(page))+1;
	$("#page2").html(page);
	if(currentPage>=2)
	{
		$prev = $('<a  href="?page='+(currentPage-1)+'&gradeId='+gradeId+'&i=${i}">上一页</a>');
		$("#pagecode").append($prev);
	}
	if(currentPage==1) temp = 1;
	else temp = currentPage-1;  
	for(var i=temp;i<=currentPage+3&&i<=page;i++)
	{
		if(i==currentPage)
		{
			var $a=$('&nbsp;<span class="current" name="pagecode">'+i+'</span>&nbsp;');
		}else
		{
			var $a=$('&nbsp;<a name="pagecode" class="pageclass">'+i+'</a>&nbsp;');
		}
		$("#pagecode").append($a);  
	}
	if(page>1&&currentPage!=page)
	{
		$next = $('<a href="?page='+(currentPage+1)+'&gradeId='+gradeId+'&i=${i}">下一页</a>');
		$("#pagecode").append($next);
	}
	$("a[name='pagecode']").live('click',function(){
		//$(this).addClass("current").siblings().removeClass("current");
		if($(this).html()==currentPage){ alert("这就是当前页");}
		else
			location="../member/myClass?page="+$(this).html()+"&gradeId="+gradeId+"&i=${i}";
	});
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
<p class="weizhi">当前位置：<a href="/memberCenter/member.jsp">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="">学习中心</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="/member/myLessons">网络课堂</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">课程详细</a></p>
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
<div class="divb_sp">${gradeName}<em>（共${gradeTime}讲）更新到第<s:property value="classDetail.size" />讲</em></div>
<div class="divb_spa">学习记录：
	<s:if test="studyRecord!=null">
	<em><fmt:formatDate value="${studyRecord.recordStartTime}" pattern="yyyy-MM-dd  hh:mm:ss" /> <font style="font-weight:bold"><a  href="/member/classroom?classId=${studyRecord.classId}">${studyRecord.recordName}</a></font></em>
	</s:if>
	<s:else>
	<em><font style="font-weight:bold">您还没有开始学习这个课程</font></em>
	</s:else>
</div>
<s:if test="dataUrl!=null">
<div class="divb_spa">资料下载：
	<em><a href="/member/dataDownload?gradeId=${gradeId}"><font style="font-weight:bold">${gradeName}资料下载</font></a></em>
</div>
</s:if>
<div class="xxzx_two">
<div class="ctt_02_tab">
<span id="bxz">课堂讲座</span>
</div>
</div>
<div class="listenContent">
<table cellspacing="0" cellpadding="0" border="0" width="660">
<tbody>
<tr>
   <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>讲&nbsp;座</strong></td>
   <td height="24" bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>课程名称</strong></td>
   <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>状&nbsp;态</strong></td>
   <td bgcolor="#f9f9f9" align="center" width="149" class="xxzx_ber_a"><strong>下&nbsp;载</strong></td>
</tr>
<s:iterator value="classDetail" var="cd" status="col">
<tr>
	<s:if test="#col.getIndex()+page*pagesize-pagesize+1>9">
    <td align="center" width="79" class="xxzx_ber_e font_14">第${col.index+page*pagesize-pagesize+1}讲</td>
    </s:if>
    <s:else>
    	<td align="center" width="79" class="xxzx_ber_e font_14">第0${col.index+page*pagesize-pagesize+1}讲</td>
    </s:else>
    <td width="424" class="xxzx_ber_e font_14" align="center">
    <dt style="float:left;"><a target="_blank" href="/member/classroomHD?classId=${i}_${cd.classId}">${cd.classTitle}</a></dt>
    <dd style="float:left; margin-top:3px">&nbsp;&nbsp;
    <a target="_blank" href="/member/classroomHD?classId=${i}_${cd.classId}"><img height="16" width="16" style="border:0px; margin-top:2px" alt="播放" src="../images/bf_ico_1.png"></a></dd>
    </td>
    <td align="center" width="102" class="xxzx_ber_e font_12">学习中</td>
    <td align="center" class="xxzx_ber_e font_a">
    <a onclick="shownodownlesson()" href="javascript:;">MP3</a>&nbsp;
    <a onclick="shownodownlesson()" href="javascript:;">视频</a>&nbsp;
    <a onclick="shownodownlesson()" href="javascript:;">讲义</a>&nbsp;
    </td>
</tr>
</s:iterator>
</tbody>
</table>
</div>
<div id="page">共${total}条/<span id="page2"></span>页&nbsp;&nbsp;&nbsp;&nbsp;
<span id = "pagecode">
</span>
</div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
