<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我的作业</title>
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
      function showPaper(id)
      {
      		location="/member/loadPaper?paperId="+id;
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
<p class="weizhi">当前位置：<a href="#">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">课程作业</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的作业</a></p>
<div class="List">
<ul>
<li class="wk_left">
<div class="ctt_leftone">
<h1 class="MyWorkTop" style="border:none;border-bottom: 1px solid #C6DBEB;">
<span>
<ul>
<li id="xz">我的作业</li>
<li><a href="/member/examRecordList">作业记录</a></li>
<!-- <li><a href="#">错题汇总</a></li> -->
</ul>
</span>
</h1>
<s:if test="paperList.size>0">
<div class="ctt_nrbox">
   <div class="ctt_nq center">
	<h3 class="nq_h4">
            ${gradeName }</h3>
<!-- 	<div class="tishi_a" id="explainDiv"><strong>温馨提示：</strong><br />
			·灰色显示表示本讲暂不提供作业。</div> -->
                    <!--Table-->
                   <table border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="63" height="24" align="center" nowrap="nowrap" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>序&nbsp;号</strong></td>
                            <td width="350" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>作业名称</strong></td>
                            <!-- <td width="50" align="center" nowrap="nowrap" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>状&nbsp;态</strong></td>
                            <td width="46" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>学&nbsp;分</strong></td> -->
                            <td width="95" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
                          </tr>
                         <s:iterator value="paperList" var="paper" status="no">
                         	<s:if test="#paper!=null">
                                 <tr>
                                   <td align="center" nowrap="nowrap" class="xxzx_ber_e font_14">
                                       第${paper.paperEGCheaterId }讲
                                   </td>
                                   <td nowrap="nowrap" class="xxzx_ber_e font_14">
                                       
                                       <a id="ctl00_cp1_Repeater1_ctl00_hlTitle" target="_blank" href="/member/loadPaper?paperId=${paper.encodeId }" >${paper.paperName }</a>
                                  </td>
                                    <!-- <td align="center" nowrap="nowrap" class="xxzx_ber_e font_14">
                                        未完成</td>
                                   <td align="center" class="xxzx_ber_e font_14">
                                        7</td> -->
                                    <td align="center" class="xxzx_ber_e font_14"><p class="x_ks14">
                                        <a href='/member/loadPaper?paperId=${paper.encodeId }' target="_blank" >查看</a></td>
                                </tr> 
                               </s:if>
                               <s:else>
                               		 <tr>
                                   <td align="center" nowrap="nowrap" class="xxzx_ber_e font_14">
                                       <font style='color:#d5d2d1;'>第${no.index+1 }讲</font>
                                   </td>
                                   <td nowrap="nowrap" class="xxzx_ber_e font_14">
                                       
                                       <a id="ctl00_cp1_Repeater1_ctl01_hlTitle" class="noDeco"><font style='color:#d5d2d1;'>------</font></a>
                                  </td>
                                    <!-- <td align="center" nowrap="nowrap" class="xxzx_ber_e font_14">
                                        <font style='color:#d5d2d1;'>-</font></td>
                                   <td align="center" class="xxzx_ber_e font_14">
                                        <font style='color:#d5d2d1;'>0</font></td> -->
                                    <td align="center" class="xxzx_ber_e font_14"><p class="x_ks14">
                                        <font style='color:#d5d2d1;'>暂不提供</font></td>
                                </tr> 
                               </s:else>
                            </s:iterator>
   </tbody>
   </table>
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
</div></s:if><s:else>
<div class="fy"><div class="emptyDiv2"><span class="no"></span></div></div>
</s:else>
</div>
</li>
<li class="wk_right">
<span class="Tip center">
<p class="TipTitle">作业小贴士:</p>
<p>1. 根据课程所提供的考卷做作业</p>
<p>2. 该作业只保存最近一次的作业的成绩情况</p>
<p>3. 可以重复做</p>
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
