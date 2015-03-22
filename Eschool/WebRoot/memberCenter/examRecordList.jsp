<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>作业记录</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style>
.ctt_leftone {
    border: 1px solid #C6DBEB;
    display: inline-block;
    margin-bottom: 10px;
    width: 537px;
}
.nq_h4 {
    border-bottom: 1px solid #D8D8D8;
    color: #166AA1;
    display: block;
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 10px;
    padding-bottom: 10px;
    padding-top: 10px;
}
.ctt_nq{
	padding:10px 0 10px 10px
}
.tishi_a {
    background: none repeat scroll 0 0 #FFFFE9;
    border: 1px solid #FEDA99;
    color: #F25500;
    line-height: 20px;
    margin-bottom: 10px;
    margin-right: 10px;
    padding: 8px 10px;
    position: relative;
}
</style>
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
<script language="javascript" src="../js/UserLesson.js"></script>
<script type="text/javascript">
     $(function(){
      	$("#exam_").addClass("hhover");
      	//初始化页码
	var page = Number("${total/pagesize}");//一共多少页
	var currentPage = Number("${page}");//当前页
	var temp = 0;
	var path = location.href+location.search;
	if((page*10)%10!=0)	page = Math.floor(Number(page))+1;
	$("#page2").html(page.toFixed(0));
	if(currentPage>=2)
	{
		$prev = $('<a href="'+path+'&page='+(currentPage-1)+'">上一页</a>');
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
		$next = $('<a href="'+path+'&page='+(currentPage+1)+'">下一页</a>');
		$("#pagecode").append($next);
	}
	$("a[name='pagecode']").live('click',function(){
		//$(this).addClass("current").siblings().removeClass("current");
		if($(this).html()==currentPage){ alert("这就是当前页");}
		else
			location=location.href+location.search+"&page="+$(this).html();
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
<p class="weizhi">当前位置：<a href="/member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">课程作业</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的作业</a></p>
<div class="List">
<ul>
<li class="wk_left">
<div class="ctt_leftone">
<h1 class="MyWorkTop" style="border:none;border-bottom: 1px solid #C6DBEB;">
<span>
<ul>
<li><a href="/member/lessonExam">我的作业</a></li>
<li id="xz">作业记录</li>
<!-- <li><a href="#">错题汇总</a></li> -->
</ul>
</span>
</h1>
<s:if test="recordList.size>0">
<div class="ctt_nrbox">
                              <div class="ctt_nq center">
                                      <table width="518" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td width="230" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>作业名称</strong></td>
                                                <td width="50" align="center" nowrap="nowrap" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>花费时间</strong></td>
                                                <td width="40" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>得&nbsp;分</strong></td>
                                                <td width="65" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>完成时间</strong></td>
                                              </tr>
                                              <s:iterator value="recordList" var="record">
                                              				                                              			     <form action="/member/loadPaper" method="post" id="form_${record.id }"><input name="paperId" value="${record.paperId }" type="hidden"/></form>
                                              				
                                                            <tr>
                                                                <td nowrap="nowrap" class="xxzx_ber_e font_14"><a href='javascript:;' onclick="$('#form_${record.id}').submit();" class="a">
                                                                    ${record.paperName }</a>
                                                                </td>
                                                                <td nowrap="nowrap" class="xxzx_ber_e font_14" style="text-align:center;"> 
                                                                    ${record.useTime }分钟
                                                                 </td>
                                                                <td align="center" class="xxzx_ber_e font_14">
                                                                    ${record.rcdScore }分
                                                              </td>
                                                                <td align="center" class="xxzx_ber_e font_14">&nbsp;
                                                                    <fmt:formatDate value="${record.rcdEndTime }" pattern="yyyy-MM-dd"/>
                                                                </td>
                                                          </tr>                                                    
                                                  </s:iterator>  
                                      </table>
                                       <div class="fy" style=" clear:both;">
   <div id="page">共${total}条/<span id="page2"></span>页&nbsp;&nbsp;&nbsp;&nbsp;
<span id = "pagecode">
</span>
</div>
   </div>
<!-- <tr>
   <td nowrap="nowrap" class="xxzx_ber_e font_14">&nbsp;
   <img src="../images/pic_bh.gif" class="img_b">&nbsp;
   <a href="/v_2012/usercenter/LessonWork/myClassWork.aspx?code=A555917158BAD9F5BF6B69B05941068D">
   建设工程经济--精华班</a>
   </td>
   <td align="center" class="xxzx_ber_e font_14">0</td>
   <td align="center" class="xxzx_ber_e font_14">
   <p class="x_ks"><a href="/v_2012/usercenter/LessonWork/myClassWork.aspx?code=A555917158BAD9F5BF6B69B05941068D" style="font-size:12px;">做作业</a></p>
   </td>            
</tr> -->
</div>
</div>
</s:if>
<s:else>
<div class="fy"><div class="emptyDiv2"><span class="no"></span></div></div>
</s:else>
</li>
<li class="wk_right">
<span class="Tip center">
<p class="TipTitle">作业小贴士:</p>
<p>1. 根据课程所提供的考卷做作业</p>
<p>2. 该作业只保存最近一次的成绩情况</p>
<p>3. 可以重复做作业</p>
</span>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">建设工程经济</a></h2>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">建设工程项目管理</a></h2>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">建设工程法规相...</a></h2>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">专业工程管理实...</a></h2>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">专业工程管理实...</a></h2>
</li>
</ul>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
