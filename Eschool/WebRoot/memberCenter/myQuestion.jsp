<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的答疑  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.link{cursor: pointer;word-break:break-all;}
	.pageclass{cursor:pointer}
</style>
<script language="javascript" src="../js/jquery-1.4.3.js"></script>
<script language="javascript">
 $(function(){$("#question_").addClass("hhover");});
      $(function(){
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
			location="../member/myQuestion?page="+$(this).html();
	});
	});
	function del(questionId)
	{
		var r = confirm("确认删除么？");
		if(r)
		{
			$.ajax({
				async:true,
				type:"POST",
				url:"../member/delQuestion",
				data:{"questionId":questionId},
				dataType:"json",
				success:function(data)
				{
					if(data)
				{
						alert("删除成功");
						window.location.reload();
					}
				},
				error:function()
				{
					alert("系统错误");
				}
			});
		}
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">学习答疑</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的答疑</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li ><a href="./allQuestion">最新问题</a></li>
<li id="xz">我的答疑</li>
<li><a href="./myQuestionCollect">答疑收藏</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
<ul class="info">
	<li class="lfhre_sp">
	<ol>
  <li class="infoxz">我的答疑</li>
  <li><a href="../memberCenter/addQuestion.jsp">我要提问</a></li>
  </ol>
  </li>
 </ul>
<s:if test="list.size()!=0">
 <div class="" id='listContent'>
  <ul class="info">
  <li class="lfhre_li">
  		<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
<tr>
  <td height="24" bgcolor="#f9f9f9" align="center" width="50" class="xxzx_ber_a"><strong>状态</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="300" class="xxzx_ber_a"><strong>标题</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="100" class="xxzx_ber_a"><strong>操作</strong></td>
</tr>

	<s:iterator value="list" var="q">
		<tr>
			 <td colspan="4" class="xxzx_ber_c font_14">
                <div class="wzgk_onec center">
                    	<table  border="0" cellspacing="0" cellpadding="0" width="688">
                    	<tr>
					<td height="24" bgcolor="#f9f9f9" align="center" width="50" class="xxzx_ber_a" name="status"><img src="../images/answer${q.questionStatus }.gif"/></td>
                   <td bgcolor="#f9f9f9" align="center" width="300" class="xxzx_ber_a"><a href="../question/loadQuestion?questionId=${q.questionId }" class="link">${q.questionTitle }</a></td>
  					<td bgcolor="#f9f9f9" align="center" width="100" class="xxzx_ber_a"><a href="../question/loadQuestion?questionId=${q.questionId }" class="link">查看</a>&nbsp;&nbsp;<a onclick="del(${q.questionId});" class="link">删除 </a></td>
  					</tr>
                       </table>
                </div>
        </td>
		</tr>		
	</s:iterator>
</tbody>
</table>
<div id="page">共${total}条/<span id="page2"></span>页&nbsp;&nbsp;&nbsp;&nbsp;
<span id = "pagecode">
</span>
</div>

 </li>
  </ul>
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
