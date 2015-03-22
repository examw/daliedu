<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我要咨询  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.wzgk_oneb {
    background: none repeat scroll 0 0 #FAFAFA;
    border: 1px solid #DFDFDF;
    clear: both;
    line-height: 24px;
    margin-bottom: 15px;
    margin-left: 10px;
    padding: 10px;
    position: relative;
}
.wzgk_oneb em {
    background: url("../images/pic_003.gif") no-repeat scroll 0 0 transparent;
    display: inline-block;
    height: 7px;
    left: 0;
    margin-left: 22px;
    margin-top: -7px;
    position: absolute;
    top: 0;
    width: 12px;
}
.ts_02 {
    color: #F25500;
    display: block;
    font-weight: bold;
}
.wzgk_oneb .tsnr_02 {
    text-align: center;
}
</style>
<script language="javascript" src="../js/jquery-1.4.3.js"></script>
<script language="javascript">
	$(function(){$("#ask_").addClass("hhover")});
	function Reajax(consultationid) {
            if (document.getElementById("lblRe" + consultationid).style.display == "none") {
                $(".wzgk_oneb").hide();
                if($("#lblRe"+consultationid).attr("isLoad")==0)
                {
                	$.ajax({
                		async:true,
                		type:"post",
                		url:"../member/loadReply",
               			data:{"acId":consultationid},
               			dataType:"json",
               			success:function(data)
               			{
               				$("#text"+consultationid).html(data);
               				$("#lblRe"+consultationid).attr("isLoad",1);
               			},
               			error:function(){alert("系统异常");}
                	});
                }
                $("div [id=lblRe" + consultationid + "]").show();
            }
            else {
                $("div [id=lblRe" + consultationid + "]").hide();
            }
        }
   $(function(){
   	//格式化内容
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
			location="../member/askList?page="+$(this).html();
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../member/askList">我的咨询</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的咨询</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li id="xz">我的咨询</li>
<li><a href="../memberCenter/ask.jsp">我要咨询</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
<s:if test="list.size()!=0">
<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
<tr>
  <td height="24" bgcolor="#f9f9f9" align="center" width="230" class="xxzx_ber_a"><strong>咨询名称</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="91" class="xxzx_ber_a"><strong>咨询时间</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="266" class="xxzx_ber_a"><strong>咨询内容</strong></td>
  <td bgcolor="#f9f9f9" align="center" width="101" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
</tr>

	<s:iterator value="list" var="ac">
		<tr>
			 <td colspan="4" class="xxzx_ber_c font_14">
                <div class="wzgk_onec center">
                    	<table  border="0" cellspacing="0" cellpadding="0">
                    	<tr>
                    <td height="24" bgcolor="#f9f9f9" align="center" width="230" class="xxzx_ber_a">${ac.acName}</td>
  					<td bgcolor="#f9f9f9" align="center" width="91" class="xxzx_ber_a"><fmt:formatDate value="${ac.acAddTime }" type="both" pattern="yyyy-MM-dd" /></td>
  					<td bgcolor="#f9f9f9" align="center" width="266" class="xxzx_ber_a" name="txtContent">${ac.acContent }</td>
  					<td bgcolor="#f9f9f9" align="center" width="101" class="xxzx_ber_a"><a id="lbl${ac.acId }" title="${ac.status }" style="cursor: pointer;" onclick="Reajax(${ac.acId});">查看</a></td>
  					</tr>
                       </table>
                </div>
                <div class="wzgk_oneb" id="lblRe${ac.acId }" style="display: none" isLoad="0">
                <em></em> 
                <span class="ts_02">网校回复：</span>
                    <p class="tsnr_02" id="text${ac.acId }">暂无回复</p>
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
