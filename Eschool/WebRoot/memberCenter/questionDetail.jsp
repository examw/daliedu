<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>答疑详细  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.link{cursor: pointer;}
	.qingwen_a {
    border: 1px solid #C6DBEB;
    color: #166AA1;
}
.qw_sp {
    background: none repeat scroll 0 0 #ECF7FE;
    display: block;
    height: 30px;
    padding-top: 12px;
}
.qw_sp dl dt {
    float: left;    text-indent: 17px;    width: 42px;
}
.qw_sp dl dd {
    float: left;word-break:break-all;
}
.ddq_1 {
    font-size: 14px;
    width: 533px;
}
.qw_wt {
    background: url("../images/pic_16.gif") repeat-x scroll 0 bottom transparent;
    line-height: 21px;
    padding-bottom: 5px;
    padding-left: 33px;
    padding-top: 10px;
    padding-right:10px;
    height:auto;
    word-break:break-all;
}
.qw_xx {
    color: #525252;
    display: block;
    height: 38px;
    line-height: 38px;
}
.qw_xx dl dd {
    float: left;
    text-indent: 20px;
    width: 166px;
}
.qingwen_b {
    background: none repeat scroll 0 0 #FFFFEA;
    border: 1px solid #FEDC9C;
    margin-top: 20px;
    position: relative;
}
.qw_bsp {
    background: url("../images/pic_16.gif") repeat-x scroll 0 bottom transparent;
    display: block;
    height: 30px;
    padding-top: 15px;
    width: 683px;
}
.qw_bsp dl dd {
    color: #000000;
    float: left;
    font-size: 14px;
}
.qw_bsp dl dt {
    float: left;
    text-align: center;
    width: 30px;
}
.qw_bsp em {
    background: url("../images/pic_22.gif") no-repeat scroll 0 0 transparent;
    display: block;
    height: 9px;
    left: 0;
    margin-left: 33px;
    margin-top: -9px;
    position: absolute;
    top: 0;
    width: 17px;
}
.qw_hd {
    background: url("../images/pic_16.gif") repeat-x scroll 0 bottom transparent;
    color: #000000;
    line-height: 21px;
    padding-bottom: 10px;
    padding-left: 33px;
    padding-top: 10px;
    width: 650px;
}
.qw_hd p {
    color: #E62000;
}
.qw_bbsp {
    display: block;
    height: 69px;
    padding-left: 33px;
    width: 650px;
}
.ohno {
    background: url("../images/ohno.gif") no-repeat scroll center center transparent;
    display: block;
    height: 100px;
    position: static !important;
    width: 324px;
}
</style>
<script language="javascript" src="../js/jquery-1.4.3.js"></script>
<script language="javascript">
$(function(){$("#question_").addClass("hhover")});
$(function(){
	$("#fav").click(function()
	{
		fav($(this).attr("questionid"),$(this).attr("flag"));
	});
});
function fav(questionId,flag)
{
	if(flag==1) //表示没有收藏要收藏
	{
		$.ajax({
			async:true,
			type:"post",
			dataType:"json",
			url:"../question/fav",
			data:{"questionId":questionId},
			success:function(data){
				if(data)
				{
					//收藏成功
					$("#fav").attr("flag",0);
					$("#favImg").attr("src","../images/pic_30.gif");
				}else
				{
					alert("取消失败,您可能没有收藏此问题");
				}
			}
		});
	}else
	{
		$.ajax({
			async:true,
			type:"post",
			dataType:"json",
			url:"../question/unfav",
			data:{"questionId":questionId},
			success:function(data){
				if(data)
				{
					//取消成功
					$("#fav").attr("flag",1);
					$("#favImg").attr("src","../images/pic_31.gif");
				}else
				{
					alert("取消失败,您可能没有收藏此问题");
				}
			}
		});
	}
	
}
function unfav(questionId)
{
	$.ajax({
			async:true,
			type:"post",
			dataType:"json",
			url:"../question/unfav",
			data:{"questionId":questionId},
			success:function(data){
				if(data)
				{
					window.location="../member/myQuestionCollect";
				}else
				{
					alert("取消失败,您可能没有收藏此问题");
					window.location="../member/myQuestionCollect";
				}
			}
		});
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../member/myQuestion">学习答疑</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">答疑详细</a></p>
<div class="List" style="border-top:1px solid #C6DBEB"> 
<div class="ListContent">
<s:if test="question!=null">
 <div class="" id='listContent'>
  <ul class="info">
  <li class="">
  	    <div class="qingwen_a">
                <span class="qw_sp">
                    <dl>
                        <dt><img src="../images/answer0.gif" width="16" height="16" /></dt>
                        <dd class="ddq_1"><strong>请问：</strong>${question.questionTitle}</dd>
                    </dl>
                    <dd ><span style="color:#f25500;"><!-- 收藏人数 --></span>&nbsp;<a href="javascript:;"  id="fav" questionid="${question.questionId}" flag="${favFlag }"><img src="../images/pic_3${favFlag }.gif" align="absmiddle" title="加入收藏" width="61" height="15" id="favImg"/></a></dd>
                </span>
                <div class="qw_wt" id="qcon">
						${question.questionContent }
                </div>
                <span class="qw_xx center">
                <dl><dd>提问人：${question.student.stuUsername }</dd><dd  style="width:200px;">问题类型：${question.type }</dd><dd style="width:200px;">提问时间：<fmt:formatDate value="${question.questionAddTime }" type="both" pattern="yyyy-MM-dd HH:mm" /></dd></dl></span>
                      
                </div>
                <s:if test="question.tbAnswers.size()!=0">
                <s:iterator value="question.tbAnswers" var="answer">
				<div class="qingwen_b">
                    <span class="qw_bsp center">
                    <em></em>
                    <dl>
                        <dt><img src="../images/answer1.gif" width="16" height="16" /></dt>
                        <dd><strong>回答：</strong></dd>
                    </dl>
                    </span>
                <div class="qw_hd center">
                      	<p>学员您好：</p>
                      	<p>${answer.answerContent }</p>
                      	<p>祝您学习愉快！</p>
                </div>
                    <span id="reStar" class="qw_bbsp center">
                        <span>解答团队： | 解答时间：<fmt:formatDate value="${answer.answerTime }" type="both" pattern="yyyy-MM-dd HH:mm" /></span></span>
                </div> 
                </s:iterator>
                </s:if>
                <s:else>
                					<div class="qingwen_b">
                    <span class="qw_bsp center">
                    <em></em>
                    <dl>
                        <dt><img src="../images/answer1.gif" width="16" height="16" /></dt>
                        <dd><strong>回答：</strong></dd>
                    </dl>
                    </span>
                <div class="qw_hd center">
                      	暂无回复
                </div>                    
                </div> 
                </s:else>
  </li>
  <li class="lfhre_li">
  </li>
  </ul>
</div>
</s:if>

<s:else>
<div class="fy">
	<div class="emptyDiv2">
		<div class="ohno"></div>
		<div>
		<span color="font-size:14px">Sorry,该问题不存在或已经被删除!</span>
		<a href="javascript:;"onclick="unfav(${questionId});" style="cursor: pointer">取消对该问题的收藏，并返回</a>
		</div>
	</div>
</div>	
</s:else>


</div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
