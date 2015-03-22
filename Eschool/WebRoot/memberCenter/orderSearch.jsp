<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="../images/pic_bh.gif" >
<title>订单查询   我的订单</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	#page .pageclass{cursor: pointer;}
</style>
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
<script language="javascript">
$(function(){
 //全局的ajax访问，处理ajax清求时sesion超时  
         $.ajaxSetup({   
             contentType:"application/x-www-form-urlencoded;charset=utf-8",   
             complete:function(XMLHttpRequest,textStatus){   
                     var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); //通过XMLHttpRequest取得响应头，sessionstatus，  
                     if(sessionstatus=="timeout"){   
                                 //如果超时就处理 ，指定要跳转的页面   
                                         window.location.replace("../user/login.jsp");   
                                 }   
                      }   
             });   
	$("#order_").addClass("hhover");});
function showDivById(did, divName, imgName) {
    var lessonDiv = $("#" + did);
    var lessonTable=$("#tb_"+did);  
    if (arguments.length==3) {
        var img = $("#img_" + did); //图标    
        var divList = $("div[name='" + divName + "']");
        var imgList = $("img[name='" + imgName + "']");
        divList.each(function () {
            if ($(this).attr("id") != did) {
                $(this).hide(); //隐藏详细
                    //img.attr("src", "../images/pic_011.gif"); 
                   // img.attr("alt", "展开");
                }
        });
        imgList.each(function () {
                $(this).attr("src", "../images/pic_011.gif");
                $(this).attr("alt", "展开");
        });

        if (lessonDiv.css("display") == "none") {
        	//alert($("tr[name="+did+"]"));
        	if(!$("tr[name="+did+"]").length){
        	//加载item列表
        	$.ajax({
        		async:true,
        		type:"POST",
        		url:"../member/itemList",
        		data:{"orderId":did,"url":window.location.href},
        		dataType:"json",
        		success:function(list)
        		{
        			for(var data=0;data<list.length;data++){
        			var $tr = $('<tr name="'+did+'"><td style="width: 410px;" class="font_14 qddb"><p style="text-indent: 10px;"><span title="" id="ctl00_cp1_Repeater1_ctl00_Repeater2_ctl00_lilDiscountTitle">'+list[data].itemName
         						+'</span></p></td><td align="center" style="width: 108px;" class="font_14 qddb">￥'+list[data].itemOPrice
         						+'元</td><td align="center" style="width: 108px;" class="font_14 qddb">￥'+list[data].itemRPrice
   								+'元</td><td align="center" style="width: 125px;" class="font_a qddb">--</td></tr>');
   					lessonTable.append($tr);
   					if(list[data].itemPresent)
   					{
   					var present = list[data].itemPresent.split(";");
   					for(var p =0;p<present.length;p++)
   					{
						var $td = $('<tr name="'+did+'"><td style="width: 410px;" class="font_14 qddb" colspan="4"><p style="text-indent: 10px;"><img src="../images/kcdd.gif">'+present[p]
         						+'</p></td></tr>');  
   						lessonTable.append($td); 						
   					}
   					}
   					}
        		}
        	});
        	}
            lessonDiv.show(); //显示详细
            img.attr("alt", "收缩");
            img.attr("src", "../images/pic_010.gif");

        } else {
            lessonDiv.hide(); //隐藏详细
            img.attr("alt", "展开");
            img.attr("src", "../images/pic_011.gif");
        }        
    }else if (arguments.length==2) {
       
        var divList2 = $("div[name='" + divName + "']");
        divList2.each(function () {
            if ($(this).attr("id") != did.toString()) {
                $(this).hide(); //隐藏详细
            }
        });
        if (lessonDiv.css("display") == "none") {
            lessonDiv.show(); //显示详细
        } else {
            lessonDiv.hide(); //隐藏详细 
        }    
    }
}
function deleteOrder(orderId)
{
	var r=confirm("确定要删除该订单吗？");
  	if (r==true)
    {
    	$.ajax({
    		async:true,
    		type:"POST",
    		url:"../member/delOrder",
    		data:{"orderId":orderId},
    		dataType:"json",
    		success:function(data)
    		{
    			if(data)
    			{
    				window.location.reload();
    			}else
    			{
    				alert("删除失败!");
    			}
    		},
    		error:function(){
    			alert("系统异常,请稍后重试!");
    		}
    	});
    }
}
function payOrder(orderId)
{
	$.ajax({
		async:true,
		type:"POST",
		url:"../member/payOrder",
		data:{"orderId":orderId},
    	dataType:"json",
    	success:function(data)
    	{
    		if(data)
    		{
    			$("#a_pay").attr('href','../order/orderDetail?orderId='+orderId);
    		}else
    		{
    			alert("订单包含已过期课程不能支付!");
    			window.location.reload();
    		}
    	},
    	error:function(){
    		alert("系统异常,请稍后重试!");
    	}
	});
}
function search()
{
	if(!$("#txtOrderCode").val()||!$.trim($("#txtOrderCode").val()))
	{
		return;
	}
	$("#searchForm").submit();
}
$(function(){
	//初始化选择框
	var selectValue ="${selectValue}";
	$("#ctl00_cp1_ddlPay option[value="+selectValue+"]").attr('selected','selected');
	$("#ctl00_cp1_ddlPay").change(function(){
	 	location = "../member/orderList?selectValue="+$("#ctl00_cp1_ddlPay").val();
	 });
//初始化页码
	var page = Number("${total/pagesize}");//一共多少页
	var keywords = "${keywords}";
	if($.trim(keywords))
	{
		keywords = "&keywords="+escape(escape(keywords));
	}
	var currentPage = Number("${page}");//当前页
	var selectValue = $("#ctl00_cp1_ddlPay").val();
	var temp = 0;
	if((page*10)%10!=0)	page =Number(Math.floor(Number(page))+1);
	$("#page2").html(page.toFixed(0));
	if(currentPage>=2)
	{
		$prev = $('<a href="'+location.pathname+'?page='+(currentPage-1)+'&selectValue='+selectValue+keywords+'">上一页</a>');
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
		$next = $('<a href="'+location.pathname+'?page='+(currentPage+1)+'&selectValue='+selectValue+keywords+'">下一页</a>');
		$("#pagecode").append($next);
	}
	$("a[name='pagecode']").live('click',function(){
		//$(this).addClass("current").siblings().removeClass("current");
		if($(this).html()==currentPage){ alert("这就是当前页");}
		else
			location=location.pathname+"?page="+$(this).html()+"&selectValue="+selectValue+keywords;
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的订单</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">课程订单</a><!-- <a href="#">我的课程</a> --></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li id="xz">课程订单</li>
<!-- <li><a href="#">商品订单</a></li> -->
</ul>
</span>
</h1>
<div class="ListContent">
<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
<tr>
<td height="40" width="397">
<select style="width:120px;" id="ctl00_cp1_ddlPay" name="ctl00$cp1$ddlPay">
	<option value="0">订单状态</option>
	<option value="1">未支付订单</option>
	<option value="2">已支付订单</option>
	<option value="3">已取消订单</option>
</select>
&nbsp;&nbsp;
</td>
<td width="218" style="width: 213px;">
	<form action="../member/searchOrder" method="post" id="searchForm">
	<input type="text" style="color:#999999;width:195px;" class="lfhre_input" id="txtOrderCode" value="课程名称、订单编号" name="keywords" onfocus="this.select();"/>
	
	</form>
</td>
<td width="73" style="width: 73px;"><input type="image" src="../images/cx_one.gif" id="ctl00_cp1_ImageButton1" name="ctl00$cp1$ImageButton1" onclick="search();"/></td>
</tr>
</tbody>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
<tr>
 <td height="24" bgcolor="#f9f9f9" align="center" width="137" class="xxzx_ber_a">
 <strong>订单编号 </strong>
 </td>
 <td bgcolor="#f9f9f9" align="center" width="95" class="xxzx_ber_a"><strong>订单金额</strong></td>
 <td bgcolor="#f9f9f9" align="center" width="143" class="xxzx_ber_a"><strong>支付方式</strong></td>
 <td bgcolor="#f9f9f9" align="center" width="132" class="xxzx_ber_a"><strong>下单时间</strong></td>
 <td bgcolor="#f9f9f9" align="center" width="165" class="xxzx_ber_a"><strong>订单状态</strong></td>
 <td bgcolor="#f9f9f9" align="center" width="94" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
</tr>
<tr>
 <td align="left" class="xxzx_ber_e font_14" colspan="6">
    <table cellspacing="0" cellpadding="0" border="0" width="680">
     <tbody>
     <s:if test="orderList.size()!=0">
     <s:iterator value="orderList" var="order">
     <tr>
     <td width="126" class="font_14">
     &nbsp;<img style="cursor: pointer" onclick="showDivById(${order.orderId},'myDiv','myImg')" class="img_a" src="../images/pic_011.gif" alt="展开" id="img_${order.orderId }" name="myImg"/>&nbsp; <a onclick="showDivById(${order.orderId},'myDiv','myImg')" href="javascript:;">${order.orderNo}</a>
     </td>
     <td align="center" width="89" class="font_14">￥${order.orderMoney }元</td>
     <td align="center" width="121">${order.payment }</td>
     <td align="center" width="121" class="font_14"><fmt:formatDate value="${order.orderAddTime }" type="both" pattern="yyyy-MM-dd" /></td>
     <td align="center" width="129" style="font-size: 12px;" class="font_14"><font>${order.status }</font></td>
     <td align="center" width="94" class="font_a">
     <s:if test="#order.orderStatus==0">
     <a target="_blank" id="a_pay" href="javascript:;" onclick="payOrder(${order.orderId});">支付</a>
     <a href="javascript:;" id="ctl00_cp1_Repeater1_ctl00_lbtnDel" onclick="deleteOrder(${order.orderId});">取消</a>
     </s:if>
     <s:else>
     <a>--</a>
     <a>--</a>
     </s:else>
     </td>
     </tr>
     <tr >
     	<td colspan="6">
     	<div style="display: none;" id="${order.orderId }" class="wzgk_oned center" name="myDiv">
   		<table cellspacing="0" cellpadding="0" border="0" width="680" id="tb_${order.orderId }">
   		<tbody>
   		<tr>
    		<td bgcolor="#fff3db" align="center" style="line-height: 26px;"><p class="back_g">商品名称</p></td>
    		<td bgcolor="#fff3db" align="center" style="line-height: 26px;">原&nbsp;价</td>
    		<td bgcolor="#fff3db" align="center" style="line-height: 26px;">优惠价</td>
    		<td bgcolor="#fff3db" align="center" style="line-height: 26px;">操&nbsp;作</td>
   		</tr>
   		<!--套餐-->
   		<!-- <tr>
   		<td style="width: 410px;" class="font_14 qddb">
   			<p style="text-indent: 10px;">
   			<span title="设备工作监理基础及相关知识超值套餐" id="ctl00_cp1_Repeater1_ctl00_Repeater2_ctl00_lilDiscountTitle">设备工作监理基础及相关知识超值套餐</span>
   			</p>
   		</td>
   		<td align="center" style="width: 108px;" class="font_14 qddb">￥500.00元</td>
   		<td align="center" style="width: 108px;" class="font_14 qddb">￥350.00元</td>
   		<td align="center" style="width: 125px;" class="font_a qddb">--</td>
   		</tr> -->
   		</tbody>
   		</table>
   		</div>
   		</td>
     </tr>
     </s:iterator>
   </tbody>
   </table>
  <!--  <div style="display: none;" id="1843334347" class="wzgk_oned center" name="myDiv">
   <table cellspacing="0" cellpadding="0" border="0" width="680">
   <tbody>
   <tr>
    <td bgcolor="#fff3db" align="center" style="line-height: 26px;"><p class="back_g">商品名称</p></td>
    <td bgcolor="#fff3db" align="center" style="line-height: 26px;">原&nbsp;价</td>
    <td bgcolor="#fff3db" align="center" style="line-height: 26px;">优惠价</td>
    <td bgcolor="#fff3db" align="center" style="line-height: 26px;">操&nbsp;作</td>
   </tr>
   套餐
   <tr>
   <td style="width: 410px;" class="font_14 qddb">
   <p style="text-indent: 10px;">
   <span title="设备工作监理基础及相关知识超值套餐" id="ctl00_cp1_Repeater1_ctl00_Repeater2_ctl00_lilDiscountTitle">设备工作监理基础及相关知识超值套餐</span>
   </p>
   </td>
   <td align="center" style="width: 108px;" class="font_14 qddb">￥500.00元</td>
   <td align="center" style="width: 108px;" class="font_14 qddb">￥350.00元</td>
   <td align="center" style="width: 125px;" class="font_a qddb">--</td>
   </tr>
   </tbody>
   </table>
   </div> -->
</td>
</tr>
</tbody>
</table>
<div style="clear: both;" class="fy">                       
<div id="page">共${total }条/<span id="page2"></span>页&nbsp;&nbsp;&nbsp;&nbsp;
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
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
