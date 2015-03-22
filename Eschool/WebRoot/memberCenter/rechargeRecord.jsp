<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>充值记录   我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	a{cursor:pointer;}
</style>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript">
	$(function(){$("#recharge_").addClass("hhover");});
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
			location="../member/tradeList?page="+$(this).html();
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
<p class="weizhi">当前位置：<a href="../memberCenter/member.jsp">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/recharge.jsp">账户充值

</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">充值记录</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
	<li><a href="../memberCenter/recharge.jsp">学习卡充值</a></li>
	<li><a href="../memberCenter/cashRecharge.jsp">现金券充值</a></li>
	<li id="xz">充值记录</li>
</ul>
</span>
</h1>
    <div class="ListContent">
    	<br><s:if test="recordList.size()!=0">
        <table border="0" cellpadding="0" cellspacing="0" width="688">
            <tbody>
                <tr>
                    <td align="center" class="xxzx_ber_a" height="24" style=
                    "background-color: #F9F9F9" width="137">
                    <strong>充值时间</strong></td>

                    <td align="center" class="xxzx_ber_a" style=
                    "background-color: #F9F9F9" width="95">
                    <strong>充值金额</strong></td>

                    <td align="center" class="xxzx_ber_a" style=
                    "background-color: #F9F9F9" width="143">
                    <strong>充值类型</strong></td>

                    <td align="center" class="xxzx_ber_a" style=
                    "background-color: #F9F9F9" width="132">
                    <strong>充值IP</strong></td>

                    <td align="center" class="xxzx_ber_a" style=
                    "background-color: #F9F9F9" width="165">
                    <strong>充值卡号</strong></td>
                </tr>

                <tr>
                    <td align="left" class="xxzx_ber_e font_14" colspan="6">
                        <table border="0" cellpadding="0" cellspacing="0"
                        width="680">
                            <tbody>
                            	<s:iterator value="recordList" var="record">
                                <tr>
                                    <td class="font_14" width="126" align="center">
                                    <fmt:formatDate value="${record.tradeTime }" type="both" pattern="yyyy-MM-dd HH:mm" />
                                    </td>
                                    <td align="center" class="font_14" width="89">￥&nbsp;${record.tradeMoney }&nbsp;元</td>
                                    <td align="center" width="121" id="rcType">${record.tradePattern }</td>
                                    <td align="center" class="font_14" width="121">${record.tradeIp }</td>
                                    <td align="center" class="font_14" style="font-size: 12px;" width="129">
                                    <s:if test="#record.cardId!=null">
                                    ${record.cardId}
                                    </s:if>
                                    <s:else>
                                    -------
                                    </s:else>
                                    </td>
                                </tr>
                                </s:iterator>
                            </tbody>
                        </table>
                      </td>
                </tr>
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
