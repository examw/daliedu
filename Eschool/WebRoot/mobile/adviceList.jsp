<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>意见列表</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<link type="text/css" rel="stylesheet" href="../images/recharge.css"></link>
<style type="text/css">
.select{margin:10px 10px}
.trbg1{background-color:#ECF7FE}
.trbg2{background-color:#FFFFEA}
.pageclass{cursor:pointer}
</style>
<script type="text/javascript" src="../js/citys.js"></script>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript">
$(function(){
	//初始化表格行
 	$("#tabList tr:even").addClass("trbg1");
	$("#tabList tr:odd").addClass("trbg2");
	//初始化页码
	var page = Number("${total/pagesize}");//一共多少页
	var currentPage = Number("${page}");//当前页
	var temp = 0;
	if((page*10)%10!=0)	page = Math.floor(Number(page))+1;
	$("#page2").html(page);
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
			location="../mobile/adviceList?page="+$(this).html();
	});
	});
</script>
</head>
<body>
<div class="center_nav nav_main center">
        <ul class="nav_chn">
            <li id="logo"><a href="#"><img height="36" src="../images/wxzx1.gif"
            width="155"></a></li>

<!--             <li class="nhover"><a href=
            "/memberCenter/member.jsp">我的首页</a></li>

            <li><a href="#">报名中心</a></li>

            <li><a href="#">学习答疑</a></li>

            <li><a href="#">网校首页</a></li> -->
        </ul>
        <%-- <div class="nav_right">
            <div class="login">
                欢迎您 &nbsp;${teacher.tchUsername }&nbsp;| <a href=
                "../question/teacherLogout">退出</a>
            </div>

            <div class="search">
                <span>搜索:</span>
                <h2><input name="Keyword" type="text"> <img src=
                "../images/search.gif"></h2>
            </div>
        </div> --%>
    </div>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<div class="RightList" style="width:900px">
<!-- <p class="weizhi">当前位置：<a href="../memberCenter/member.jsp">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/info.jsp">个人信息
 -->
<!-- </a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">个人资料</a></p> -->
<div class="List" style="width:900px">
<div class="select">
	<!-- <span>问题所属考试:</span>
		<select id="examPid">
			<option value="0">请选择考试类别</option>
		</select>
		<select id="examId" onchange="initGrade();">
			<option value="0">请选择考试类别</option>
		</select>
	<span style="margin-left:30px">所属班级:</span>
		<select id="gradeId">
			<option value="0">请选择班级</option>
		</select>
		<span style="margin-left:30px"></span>
		<input type="button" value="查询" onclick="search();"> -->
</div>
<s:if test="list.size!=0">
<table id="tabList" cellspacing="0" cellpadding="0" border="0" width="880"  style="margin-left:10px;margin-top:20px">
<tbody>
<tr height="40">
  <td bgcolor="#f9f9f9" align="center" width="500" class="xxzx_ber_a"><strong>内容</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="200" class="xxzx_ber_a"><strong>时间</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="150" class="xxzx_ber_a"><strong>建议人</strong></td>
</tr>
	<s:iterator value="list" var="q">
		<tr height="40">
<!-- 			 <td colspan="4" class="xxzx_ber_c font_14">
                <div class="wzgk_onec center">
                    	<table  border="0" cellspacing="0" cellpadding="0" width="850" style="margin-left:10px;margin-top:20px">
                    	<tr> -->
 				   <td  align="center" width="500" class="xxzx_ber_a">${q.adviceContent }</td>
  					<td  align="center" width="200" class="xxzx_ber_a"><fmt:formatDate value="${q.adviceAddTime }" type="both" pattern="yyyy-MM-dd HH:mm" /></td>
  					<td  align="center" width="150" class="xxzx_ber_a">${q.username }</td>
  					</tr>
<!--                        </table>
                </div>
        </td> 
		</tr>	-->	
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
<div id="foot">
<p><a href="#">中华考试网</a>|<a href="#">网站导航</a>|<a href="#">认证服务</a>|<a href="#">支付帮助</a>|<a 

href="#">意见反馈</a></p>
<p>Copyright &copy;	 2007-2012 中华考试网(Examw.com) All Rights Reserved</p>
</div>
</div>
</body>
</html>
