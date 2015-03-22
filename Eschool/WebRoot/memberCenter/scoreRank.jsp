<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${paper.paperName }</title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META HTTP-EQUIV="Window-target" CONTENT="_top">
<style type="text/css"> 
body {background-color: #a1a1a1;margin: 20px 0 20px 0;	font-size: 12px; text-align:center;}
.main{background-color: #FFFFFF;width: 830px;margin:auto auto}
.contentcenter{padding:0px; margin: 22px 27px 5px 27px; font-size: 12px;line-height: 20px;text-align: center;color: #000000;}
.title {font-family: Arial, Helvetica, sans-serif, "新宋体";font-size: 18px;font-weight: bold;color: #ff0000;line-height: 30px;}
.btn {height:24px; padding:2px 2 0 2; border:1px solid #34a7db; background:url(../images/input_bg3.jpg);  font-size:12px; color:#000; cursor:pointer;}
.btn1 {height:24px; padding:2px 2 0 2; border:1px solid #dea303; background:url(../images/input_bg3_.jpg); font-size:12px;color:#000;cursor:pointer;}
.menu {background-color:#f7f7f7; line-height:22px; text-align:center; padding:5px;position: absolute;width:105px;top:100px;visibility: visible;z-index: 1; border: green 1px solid;}
.SubmitShow{ margin:3px 0 3px 0; padding:3px 0 3px 0;}
.SubmitHidden{ display:none;}
TD {
	FONT-SIZE: 12px; LINE-HEIGHT: 19px; FONT-FAMILY: "宋体"
}
</style>
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
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
<div class="main">
<div style="width:195px; float:left;margin-top:27px" ><img src="../images/d_1.jpg" width="195" height="92" /></div>
<div style="border-bottom:#000000 solid 1px; height:41px;float:left; width:554px;padding-top:45px; padding-bottom:10px; text-align:center">考试时间：${paper.paperTime } 分钟 &nbsp; 考生：${student.stuUsername }&nbsp; 总分 ：${paper.paperScore } 分 </div>
<div style="height:92px; float:right; width:81px;;margin-top:27px"><img src="../images/d_2.jpg" width="81" height="92" /></div>
<div class="contentcenter">
<span class="title">${paper.paperName }</span><br />
<br />
<br />
<div align="center">
<table cellspacing=1 cellpadding=0 width="98%" bgcolor=#cccccc border=0 >
  <tr>
	<td align=center bgcolor=#ffffff height=50>
	<table cellspacing=1 cellpadding=3 width="98%" border=0 style="margin:10 0 0 0">
	<tr bgcolor=#f3f3f3>
	  <td width="10%" bgcolor="#FEF3DE" align="center">排名</td>
	  <td width="15%" bgcolor="#FEF3DE">用户名</td>
	  <td width="12%" bgcolor="#FEF3DE">完成用时</td>
	  <td width="15%" bgcolor="#FEF3DE">考试分数</td>
	  <td width="21%" bgcolor="#FEF3DE">作题时间</td>
	</tr>
 	<s:iterator value="recordList" var="r" status="no">
	<tr >
	<td align=middle class="STYLE13"><B><font color=red>1</font></B></td>
	<td>${r.stuUserName }</td>
	<td>${r.useTime }分钟</td>
	<td>${r.rcdScore }分</td>
	<td><fmt:formatDate value="${r.rcdEndTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
 	</s:iterator>
	  </table>
  </td>
  </tr>
</table>
   <div id="page">共${total}条/<span id="page2"></span>页&nbsp;&nbsp;&nbsp;&nbsp;
<span id = "pagecode">
</span>
</div>
</div><br />
<div>
<p align="center" >
  <input type="button" value="查看试卷答案" name="sub" class="btn" onMouseOver="this.className='btn1';" onMouseOut="this.className='btn';" onClick="window.location='/member/showPaper?paperId=${paper.encodeId}&actionFlag=withAnswer';" />
  <input type="button" value="查看成绩" name="sub2" class="btn" onMouseOver="this.className='btn1';" onMouseOut="this.className='btn';" onClick="window.location='/member/loadPaper?paperId=${paper.encodeId}';" />
   <input type="button" value="进入会员中心" name="sub" class="btn1" onClick="window.location='/member/center';"  />
</p>
</div>
<br />
<br />
</div>
</div>
</body>
</html>

