<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>答疑收藏  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.pageclass{cursor:pointer}
</style>
<script language="javascript" src="../js/jquery-1.4.3.js"></script>
<script language="javascript">
	function CourseSelect(myid,type){
	//套餐cookie
	var MyPackageIDCookie = getCookie('package');
	//班级cookie
	var MyGradeIDCookie = getCookie('grade');
		if(type==0)
		{
			if(MyPackageIDCookie==''){
				setCookie('package',myid,15);
			}else{
				setCookie('package',MyPackageIDCookie+','+myid,15);
			}	
		}else
		{
			if(MyGradeIDCookie==''){
				setCookie('grade',myid,15);
			}else{
				setCookie('grade',MyGradeIDCookie+','+myid,15);
			}
		}
	}

	function setCookie(cookieName,cookieValue,DayValue) {
		var expire = "";
		var day_value=1;
		if (DayValue != null) {
			day_value=DayValue;
		}
		expire = new Date((new Date()).getTime() + day_value * 86400000);
		expire = "; expires=" + expire.toGMTString();
		document.cookie = cookieName + "=" + escape(cookieValue) +";path=/"+ expire;
	}

	function getCookie(name) {
		var cookieValue = "";
		var search = name + "=";
		if (document.cookie.length > 0) {
			offset = document.cookie.indexOf(search);
			if (offset != -1) {
				offset += search.length;
				end = document.cookie.indexOf(";", offset);
				if (end == -1) end = document.cookie.length;
				cookieValue = unescape(document.cookie.substring(offset, end));
			};
		}
		return unescape(cookieValue);
	}
		
	
   $(function(){
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
				location="/member/myAgreement?page="+$(this).html();
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
<p class="weizhi">当前位置：<a href="#">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的协议</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li ><a href="javascript:;">我的协议</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
<s:if test="list.size()!=0">
<table width="685" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                            <td width="350" height="24" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>协议名称</strong></td>
                                            <td width="150" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>签订日期</strong></td>
                                            <td width="150" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>状&nbsp;态</strong></td>
                                            <td width="152" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
                                   </tr>
                                    <s:iterator value="list" var="sd">
                                        <tr>
                                            <td nowrap="nowrap" class="xxzx_ber_e font_14">·
                                                <span id="ctl00_cp1_Repeater1_ctl00_lblTitel" title="${sd.deal.dealName}">${sd.deal.dealName}</span>
                                            </td>
                                            <s:if test="#sd.stuDealTime==null">
                                            <td align="center" class="xxzx_ber_e font_14">
                                                ----</td>
                                            <td align="center" class="xxzx_ber_e font_14">
                                               	 未签订</td>
                                            <s:if test="#sd.packageStatus==1">
                                            <td align="center" class="xxzx_ber_e font_14">
                                            <p class="x_ks">
                                                 <i style="float:right;padding-right:23px;"></i>
                                                 <i style="float:right;padding-right:12px;"><a href="/cart/cartList"  onclick="CourseSelect(${sd.deal.dealPkgId},0);" target='_blank'>支付</a></i>
                                            </p>
                                            </td>
                                            </s:if>
                                            <s:else>
                                            <td align="center" class="xxzx_ber_e font_14">
                                            <p class="x_ks">
                                                 <i style="float:right;padding-right:23px;"></i>
                                                 <i style="float:right;padding-right:12px;"><a href="/main/deal?studealId=${sd.stuDealId}"  target='_blank'>签订</a></i>
                                            </p>
                                            </td>
                                            </s:else>
                                            </s:if>
                                            <s:else>
                                            <td align="center" class="xxzx_ber_e font_14">
                                                ${sd.stuDealTime}</td>
                                            <td align="center" class="xxzx_ber_e font_14">
                                               	 已签订</td>
                                             <td align="center" class="xxzx_ber_e font_14">
                                            <p class="x_ks">
                                                 <i style="float:right;padding-right:23px;"></i>
                                                 <i style="float:right;padding-right:12px;"><a href="/main/printDeal?studealId=${sd.stuDealId}" target='_blank'>打印</a></i>
                                            </p>
                                            </td>
                                            </s:else>
                                        </tr>
                                      </s:iterator>
                                    </table>
 <div id="page">共${total}条/<span id="page2"></span>页&nbsp;&nbsp;&nbsp;&nbsp;
				<span id = "pagecode"></span>
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
