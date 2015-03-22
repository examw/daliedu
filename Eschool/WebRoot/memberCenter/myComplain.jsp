<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我要投诉  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript">
$(function(){
	//格式化内容
	$("#complain_").addClass("hhover");
   	var tds = $("td[name='txtContent']");
   	for(var i=0;i<tds.length;i++)
   	{
   		if($(tds[i]).html().length>13)
   		{
   			$(tds[i]).html($(tds[i]).html().substring(0,13)+"...");
   		}
   	}
	//初始化页码
	var page = Number("${total/pagesize}");//一共多少页
	var currentPage = Number("${page}");//当前页
	var temp = 0;
	if((page*10)%10!=0)	page = Math.floor(Number(page))+1;
	$("#page2").html(page.toFixed(0));
	if(currentPage>=2)
	{
		$prev = $('<a href="?page='+(currentPage-1)+'">上一页</a>');
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
		$next = $('<a href="?page='+(currentPage+1)+'">下一页</a>');
		$("#pagecode").append($next);
	}
	$("a[name='pagecode']").live('click',function(){
		//$(this).addClass("current").siblings().removeClass("current");
		if($(this).html()==currentPage){ alert("这就是当前页");}
		else
			location="../member/comlainList?page="+$(this).html();
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的投诉</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的投诉</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li id="xz">我的投诉</li>
<li><a href="../memberCenter/complain.jsp">我要投诉</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
<s:if test="list.size()!=0">
<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
<tr>
  <td height="24" bgcolor="#f9f9f9" align="center" width="230" class="xxzx_ber_a"><strong>投诉名称</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="91" class="xxzx_ber_a"><strong>投诉时间</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="266" class="xxzx_ber_a"><strong>投诉内容</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="101" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
</tr>
	<s:iterator value="list" var="ac">
		<tr>
  		<td height="24" bgcolor="#f9f9f9" align="center" width="230" class="xxzx_ber_a">${ac.acName}</td>
  		<td bgcolor="#f9f9f9" align="center" width="91" class="xxzx_ber_a"><fmt:formatDate value="${ac.acAddTime }" type="both" pattern="yyyy-MM-dd" /></td>
  		<td bgcolor="#f9f9f9" align="center" width="266" class="xxzx_ber_a" name="txtContent">${ac.acContent }</td>
  		<td bgcolor="#f9f9f9" align="center" width="101" class="xxzx_ber_a"><a href="../member/complainDetail?acId=${ac.acId }">查看</a></td>
		</tr>		
	</s:iterator>

</tbody>
</table>
<div id="page">共${total}条/<span id="page2"></span>页&nbsp;&nbsp;&nbsp;&nbsp;
<span id = "pagecode">
</span>
</div>
</s:if>
<s:else>
<div class="fy"><div class="emptyDiv2"><span class="no"></span></div></div>
</s:else>
</div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
