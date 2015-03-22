<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<META name="ROBOTS" content="All" />
<link rel="stylesheet" type="text/css" href="../css/shop.css">
<style type="text/css">
.oneli_da{width:864px;}
.oneli_c{background:none repeat scroll 0 0 #F9F9F9;border:1px solid #D9D9D9;height:148px;position:relative;width:838px;}
.oneli_c i{background:url("../images/pic_024.gif") no-repeat scroll 0 0 transparent;cursor:pointer;display:block;height:12px;margin-right:10px;margin-top:10px;position:absolute;right:0;top:0;width:12px;}
.dt_left{background:url("../images/pic_023.gif") repeat-y scroll right 0 transparent;float:left;height:124px;margin-top:13px;width:570px;}
.dd_right{float:left;line-height:21px;padding-left:10px;padding-top:30px;width:240px;}
dl,dt,dd{border:0 none;margin:0;padding:0;}
.xxkh{float:left;height:124px;padding-left:13px;padding-top:5px;width:554px;}
.xh{float:left;width:263px;}
.mm{float:left;width:180px;}
.jy{float:left;width:100px;}
.dd_right em{color:#F04B0A;}
.span_f{clear:both;display:inline-block;float:right;margin-right:13px;padding-top:8px;}
.lfhre_input{background:url("../images/pic_007.gif") repeat-x scroll 0 0 transparent;border:1px solid #999999;height:21px;line-height:22px;width:178px;}
.tck1{background:none repeat scroll 0 0 #FFFFFF;border:1px solid #AAAAAA;display:none;font-size:14px;height:275px;left:50%;margin-left:-269.5px;margin-top:-127.5px;position:absolute;top:50%;width:539px;}
.tck1 .title{background:url("../images/pic_25.gif") repeat-x scroll 0 0 transparent;display:block;font-size:14px;font-weight:bold;height:33px;line-height:33px;margin-bottom:15px;position:relative;text-indent:10px;}
.tck1 .title i{background:url("../images/pic_26.gif") no-repeat scroll 0 0 transparent;cursor:pointer;display:block;height:18px;margin-right:10px;margin-top:7px;position:absolute;right:0;top:0;width:18px;}
.all1{background:none repeat scroll 0 0 #FFFFEA;border:1px solid #FEDC9C;display:none;height:135px;left:50%;margin-left:-196px;margin-top:-67.5px;padding-left:80px;position:absolute;top:50%;width:380px;}
.all1 li{float:left;margin-left:10px;margin-top:50px;}
.payok{line-height:30px;margin:40px 20px 20px;}
.tck1 ul{float:left;width:500px;}
.tck1 ul li{float:left;line-height:26px;}
.noborder{background:none repeat scroll 0 0 white;border:medium none;font-size:14px;}
.tck_text{color:#F25500;}
.w125{text-align:right;width:200px;}
.input{border-color:#868686 #868686 #D3D3D3 #D3D3D3;border-style:solid;border-width:1px;font-size:14px;height:20px;line-height:24px;padding:2px;width:190px;}
.attention{clear:both;color:#F25500;font-size:12px;padding-left:113px;text-align:center;}
.de_bt{margin:10px auto;padding-left:200px;width:300px;}
.de_bt1,.de_bt_2{background:none repeat scroll 0 0 #FFFFFF;border:1px solid #FEDC9C;font-family:"微软雅黑","宋体";font-size:16px;height:33px;line-height:33px;margin:10px auto 10px 80px;text-align:center;width:120px;}
.back{background:none repeat scroll 0 0 black;display:none;height:100%;left:0;opacity:0.3;position:absolute;top:0;width:100%;}
</style>
<script src="../js/jquery-1.4.3.js" type="text/javascript"></script>
<script type="text/javascript">
	var alibody="";
	var gift="";
	var momey =parseFloat("${student.stuCard}");
    //支付方式切换
 	$(function(){
 		//初始化支付宝支付参数
 		$("#foot").load("/common/foot2.html");
 		$("#out_trade_no").val("${order.orderId}");
 		//网银在线
 		$("#chinaBankOid").val("${order.orderId}");
 		//财富通
 		$("#cft_oid").val("${order.orderId}");
 		$("#card_oid").val("${order.orderId}");
 		$("#wy_oid").val("${order.orderId}");
 		//$("div.buyPay_con:gt(0)").hide();
 	 	$("ul.buyPayTit li").click(function() {
 	    	var value = $(this).attr("id");
 	        $(this).addClass("current").siblings("li").removeClass("current");
 			$("div.buyPay_con:eq("+$("ul.buyPayTit li").index(this)+")").show().siblings("div.buyPay_con").hide();
 	    });
 	});
 	function loginOut()
    {
    	$.ajax({
    		async:true,
    		type:"POST",
    		dataType:'json',
    		url:"../user/loginOut",
    		success:function(data)
    		{
    			if(data)
    			{
    				location="../cart/cartList";
    			}else
    			{
    				notice("登出失败",2,100);
    			}
    		},
    		error:function()
    		{
    			notice("系统异常",2,100);
    		}
    		
    	});
    }
    function closeUseCard(flag)
    {
    	if(flag) $("#usecard").hide();
    	else $("#usecard").show();
    }
    function pay1()
    {
    	if($("div.buyPay_con:visible").attr('id')=="fastPay")
    	{
    	    $("#"+$("input[name='thirdPay']:checked").val()).submit();
    	}
    	if($("div.buyPay_con:visible").attr('id')=="cardPay")
    	{
    		if(Number($("#card_balance").html())+Number($("#cash_balance").html())==0)
    		{
    			alert("余额为0,您可以充值或者选择其他支付方式");
    			return;
    		}
    		$("#cardForm").submit();
    		return;
    	}
    }
    function recharge() {
        var name = $("#txtCardNum").val();
        var pass = $("#txtCardPass").val();
        var money = $("#txtMoney").val();
        if (!name||!$.trim(name))
        {
        	error("lblMsg","请输入学习卡号!");
        	return false;
        }
        if (/^[0-9A-Za-z]+[-][0-9]+$/.test(name) == false)
        {
        	error("lblMsg","请输入正确的学习卡号!");
        	return false;
        }
        if (!pass||!$.trim(pass))
        {
        	error("lblMsg","请输入学习卡密码!");
        	return false;
        }
        if(!money||!$.trim(money)||!/^[0-9]{1,5}$/.test(money))
        {
        	error("lblMsg","请认真输入金额");
        	return false;
        }
        if(Number(money)<0)
        {
        		
        		return false;
        }
       	error("lblMsg","正在充值中...");
        $.ajax({
        	aysnc:true,
        	type:"POST",
        	url:"../member/recharge",
        	data:{"cardNo":name,"cardPwd":pass,"money":Number(money)},
        	dataType:"json",
        	success:function(data)
        	{
        		if(data>0)
        		{
        			//充值成功
        			//alert("充值成功,您刚刚充值了"+data+"元到了您的账户");
        			momey=momey+data;
        			error("lblMsg","充值成功");
					$("#card_balance").html(Number(momey).toFixed(2));
        			return;
        		}
        		if(data==0)
        		{
					error("lblMsg","卡号或密码输入有误");return;        		
        		}
        		if(data==-1)
        		{
        			error("lblMsg","该学习卡有效期已过");return;  
        		}
        		if(data<=-100)
        		{
        			error("lblMsg","充值金额大于余额,余额为："+Math.abs(Number(data+100)));return;  
        		}
        		if(data==-3)
        		{
        			error("lblMsg","该学习卡属于赠送类型,一人一次,您已经使用过这种类型");return;  
        		}
        	},
        	error:function()
        	{
        		alert("系统错误");
        	}
        });
    }
    function error(id,msg) {
       	$("#"+id).html(msg);
        disappear(id,3);
        return false;
    }
    function disappear(id,second) {
        second = second ? second : 10;
        setTimeout("$('#"+id+"').html('')", 1000 * second);
    }
</script>
</head>
<body>
    <script type="text/javascript">
     var order ="${order}";
 	 if(!order)
 	 {
 	    alert("没有这个订单！");
 	    location ="../cart/cartList";
 	 }else if("${order.orderStatus}"==1)
 	 {
 	 	alert("订单已支付完成，去个人中心");
 	 	location = "../member/center";
 	 }
    </script>
<div class="top">
  <div class="harder">
    <div class="logo"><a href="../main.jsp"><img src="../class/class/images/logo.png" alt="网校"/></a></div>
    
<div class="login">
    <s:if test="#session.student==null">
    <a href="javascript:;" onclick="LoginDisplay(0);"><img src="../class/class/images/zhuce.gif"/></a> 　
    <a href="javascript:;" onclick="LoginDisplay(0);"><img src="../class/class/images/denglu.gif"/></a>
    </s:if>
    <s:else>
    	<span style="color:white">欢迎&nbsp;<a href="../member/center">${student.stuUsername }</a></span>&nbsp;&nbsp;
    	<a href="javascript:;" onclick="loginOut();">退出</a>&nbsp;&nbsp;
    	<a href="../member/center" >个人中心</a>
    </s:else> 
    </div>    <div class="clear"></div>
  </div>
</div>

<div id="wapper">
        <div class="cont">
            <div class="bmlc">
                <ul class="lct lct2">
                    <li>购课车</li>
                    <li class="on">生成订单</li>
                    <li>付款</li>
                    <li>完成</li>
                </ul>
            </div>
            <div class="bmqd">
                <div class="title" id="title_ke">
                    <span class="flt2">商品清单</span></div>
                <div class="kclist">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="ca_tab3">
                        <tbody> 
                                                                          
                        <tr style="display: none;" id="load" class="shoplist"><td colspan="5" align="left"><img src="http://img.233.com/wx/artDialog/skins/icons/loading.blue.gif"></td></tr><tr><th height="34" width="427">课程名称</th><th width="136">原价</th><th width="129">现价</th><th width="106">立即节省</th><th width="83">操作</th></tr>
                        <s:iterator value="items" var="item">    
                        <tr class="shoplist">
                        	<td align="center"><a class="noday7" href="javascript:;">${item.itemName }</a></td>
                        <!-- 	<script type="text/javascript">
                        		alibody=alibody+!alibody?"${item.itemName}":" | ${item.itemName}";if(!"${item.itemPresent}"){gift = gift+" | ${item.itemPresent}"}
                        	</script> -->
                        	<td align="center"><s><strong>￥</strong>${item.itemOPrice }</s></td>
                        	<td align="center"><span class="tc1"><strong id="couse_price_9581">￥${item.itemRPrice }</strong></span></td>
                        	<td align="center">${item.itemOPrice - item.itemRPrice }元</td><td align="center" width="72">${order.status }</td>
                        </tr>
                        </s:iterator>
                        </tbody>
                    </table>
              </div>  
              <div class="total_info">
                        <div class="checkout">
                           ${student.stuUsername }，您已完成报名！请记下您的订单号为：<strong>${order.orderNo }</strong></div>
                    <div class="row_price">
                            您共购买<b>&nbsp;${number }&nbsp;</b>门课程，总计：<strong>${order.orderMoney }</strong>元</div>
                    </div>  
               <s:if test="order.orderMoney>order.cashMoney">
              <div class="total_info">
                        <div class="checkout"></div>
                    <div class="row_price">
                            	其中已支付了：<b>&nbsp;${order.orderMoney-order.remainMoney }&nbsp;</b>元，应付：<strong>${order.remainMoney }</strong>元</div>
                    </div> 
               </s:if>
            <br clear="all">
              <div class="title" id="title_hang">
              	<span class="flt2" >请选择支付方式</span>
              	<div class="buySubmitBox"><a href="#topay" class="buySubmit" ><font color="#FFFFFF">去结算</font></a></div>
              </div>
        </div>
    <div class="buyPay">
    <ul class="buyPayTit">
      <li class="current" id="paytab2">网上支付</li>
      <li id="paytab3">银行汇款</li>
      <li id="paytab4">学习卡支付</li>
      <li id="paytab5" onclick="showWin('payorder');">大额支付</li>
      <a name="topay"></a>
    </ul>
    <!--网上支付 start-->
  	<div class="buyPay_con" id="fastPay">
  		<div id="bank_divzfb" style="display: none;">
					<form id="aliform" name="alipayment" action="../order/preparePay?payment=ZFB" method="post" target="_blank">
    					<input type="hidden" id="out_trade_no" name="orderId"/>
    				</form>
				</div>
				<!-- 支付宝参数 END // -->
				<!-- 网银在线参数 START -->
				<div style="display:none" id="bank_divch">
				<form name="BKForm" id="BKForm" action="../order/preparePay?payment=WY" method="post" target="_blank">
					<input id="chinaBankOid" name="orderId" type="hidden"/> 
				</form>
				</div>
				<!-- 财付通 -->
				<div style="display:none" id="bank_divcft">
				<form name="cftForm" id="cftForm" action="../order/preparePay?payment=CFT" method="post" target="_blank">
					<input id="cft_oid" name="orderId" type="hidden"/> 
				</form>
				</div>
      <h5 class="bor1"><span class="fb f14"></span></h5>
      <ul class="buyB_payPlat buyB_payPlat2 borderNo">
          <li><input type="radio" value="aliform" name="thirdPay"  id="radio_ali" ><img alt="支付宝" style="border:1px #bbb solid" src="../images/zfb_logo.jpg" onclick="$('#radio_ali').attr('checked',true)"></li>
          <li><input type="radio" value="BKForm" name="thirdPay" id="radio_wy"><img style="border:1px #bbb solid" alt="网银在线" src="../images/wy_logo.jpg" onclick="$('#radio_wy').attr('checked',true)"></li>
          <li><input type="radio" value="cftForm" name="thirdPay" id="radio_cft"><img style="border:1px #bbb solid" alt="财付通" alt="财付通" src="../images/pay_cft.jpg" onclick="$('#radio_cft').attr('checked',true)"></li>
      </ul>
      <div class="clear"></div>
    </div>
    <!--快捷支付 end-->

    <!--银行汇款 start-->
  	<div class="buyPay_con" style="display: none;">
      <table cellspacing="0" cellpadding="0" border="0" class="buyB_rechTable mtop-5">
      	<tr>
                        <td height="32" style="background-color: #F4F4F4"
                        width="20%"><strong>银行名称</strong></td>
                        <td style="background-color: #F4F4F4" width="36%">
                        <strong>帐号</strong></td>
                        <td style="background-color: #F4F4F4" width="24%">
                        <strong>开户行</strong></td>
                        <td style="background-color: #F4F4F4" width="20%">
                        <strong>收款人</strong></td>
                    </tr>
                    <tr>
                        <td><img alt="中国工商银行" height="20" src=
                        "../images/pay_bank_icbc.gif" width="110"></td>
                        <td class="f16px">6222 0802 0001 3324 127</td>
                        <td>工商银行西直门支行</td>
                        <td>李道桂</td>
                    </tr>
                    <tr style="background-color: #F4F4F4">
                        <td><img alt="中国建设银行" height="20" src=
                        "../images/pay_bank_cbc.gif" width="110"></td>
                        <td class="f16px">4367 4200 1412 0324 100</td>
                        <td>中国建设银行北京车公庄支行</td>
                        <td>李道桂</td>
                    </tr>
                    <tr>
                        <td><img alt="中国银行" height="20" src=
                        "../images/pay_bank_cb.gif" width="110"></td>
                        <td class="f16px">6217 5801 0000 0569 145</td>
                        <td style="line-height:18px;">中国银行北京市西城区车公庄支行</td>
                        <td>李道桂</td>
                    </tr>
                    <tr style="background-color: #F4F4F4">
                        <td><img alt="中国农业银行" height="20" src=
                        "../images/pay_bank_abc.gif" width="110"></td>
                        <td class="f16px">6228 4800 1808 1447 478</td>
                        <td style="line-height:18px;">北京西城支行</td>
                        <td>李道桂</td>
                    </tr>
                    <tr>
                        <td><img alt="中国邮政储蓄银行" height="20" src=
                        "../images/pay_bank_psbc.gif" width="110"></td>
                        <td class="f16px">6210 9810 0001 6998 884</td>
                        <td style="line-height:18px;">中国邮政储蓄银行北京车公庄支行</td>
                        <td>李道桂</td>
                    </tr>
                    <tr>
                        <td><img alt="兴业银行" height="20" src=
                        "../images/pay_bank_icbc.gif" width="110"></td>
                        <td class="f16px">622909 363182 394010</td>
                        <td>北京月坛支行</td>
                        <td>李道桂</td>
                    </tr>
                    <tr>
                    <td colspan="4" align="left">
                    	<div style="text-align:left">
                    		<span style="margin-left:40px;color:red">汇款说明：</span>1, 汇款时请写明用户名和订单号;&nbsp;&nbsp;2, 客服热线：4000 525 585
                    	</div>
                    </td>
                    </tr>
      </table>
    </div>
    <!--银行汇款 end-->
     <!--学习卡支付 start-->
  	<div class="buyPay_con" style="display: none;" id="cardPay">
      <h5 class="bor1"><span class="fb f14">您的学习卡账户余额为：￥</span><span style="color:red" id="card_balance"><fmt:formatNumber value="${student.stuCard}" pattern="#,##0.00" /></span> 元
      	<!-- <span style="margin-left:10px;color:blue;cursor:pointer" onclick="closeUseCard(0)" >充值</span> --><br>
      	<span style="margin-left">现金账户余额： ￥<span style="color:red" id="cash_balance"><fmt:formatNumber value="${student.stuCash}" pattern="#,##0.00" /></span>元</span>
      </h5>
      <div class="oneli_da" id="usecard" style="margin-top:10px;">
            <ul>
              <li class="oneli_c" id="recharge"> <i title="关闭" onclick="closeUseCard(1)"  class="xxk_gb"></i>
                <dl>
                  <dt class="dt_left">
                    <div class="xxkh">
                      <ul>
                        <li class="xh">请输入学习卡卡号</li>
                        <li class="mm">请输入学习卡密码</li>
                        <li class="jy">请输入充值的金额</li>
                        <li class="xh">
                          <input type="text" class="text_one text_kg_a" name="cardnum" id="txtCardNum" style="width:251px;" />
                        </li>
                        <li class="mm">
                          <input type="password" class="text_one text_kg_a" name="cardpass" id="txtCardPass" style="width:168px;" />
                        </li>
                        <li class="jy">
                          <input type="text" class="text_one text_kg_a" name="money" id="txtMoney" style="width:96px;" />
                          <input type="hidden" name="cmd" value="recharge" />
                        </li>
                      </ul>
                      <span class="span_f"><em class="span_a" id="lblMsg" style="font-size:14px;font-weight:bold;"></em>
                      <input type="image" src="../images/pic_012.gif" align="absmiddle" width="98" height="25" onclick="recharge()"  />
                      </span>
                      </form>
                    </div>
                  </dt>
                  <dd class="dd_right"><em>温馨提示：</em><br>
                    1、多张学习卡可以连续充值；<br>
                    2、充值的金额可以大于支付本次购买。<br>
                    3、请在正规网点购买学习卡，以免受骗；<br>
                    4、赠送类型的学习卡一次充完</dd>
                </dl>
              </li>
            </ul>
          </div>
      <ul class="buyB_payPlat buyB_payPlat2 borderNo">
      	  <li style="width:800px;color: red">支付规则：优先学习卡余额支付,不够再从现金余额中支付,还不够剩余金额可以选择网上支付</li>
      </ul>
      <div style="display:none">
      	<form action="../order/cardPay" method="post" id="cardForm">
      		<input type="hidden" id="card_oid" name="orderId">
      	 </form>
      </div>
     
      <div class="clear"></div>
    </div>
    <div class="buyPay_con" style="display: none;" id="multiPay">
    	大额支付用于限额500的情况下使用，您也可以去<a style="color:red" href="../memberCenter/cashRecharge.jsp" target="_blank">会员中心充值</a>，然后再来支付
    </div>
    <!--快捷支付 end-->
  </div>
   <div class="clear"></div>
   <div id="priceinfo">
  <div class="buySettle">
  <div class="title"> <span class="flt2">结算信息</span></div>
     	<div id="totalDetail">
	  	<!-- <span class="blackBg">商品总格</span>
	    <span class="fo fa" id="oldmoney"></span>&nbsp;—
	    <span class="blackBg">减价金额</span>
	    <span class="fo fa" id="cutprice">￥0.00</span>&nbsp;—
	    <span class="blackBg" >优惠金额</span>
	    <span class="fo fa" id="yhmoney"></span>&nbsp;+
	    <span class="blackBg">运费</span>
	    <span class="fo fa" id="freight">￥0.00</span>&nbsp;=
    	<span class="fo fa fb" id="paySumPrice">￥0.00</span>
    	<span class="fo fa fb" id="paySumPriceRecv" style="display:none">￥0.00</span> -->
    	<div class="pt10"><span class="fo f24 fm">应付订单金额：</span><span class="fo fa f28" id="payprice"></span><span class="fo fa f18">${order.cashMoney }</span></div>
    </div>

    <div class="buySubmitBox"><a href="javascript:pay1()" class="buySubmit" ><font color="#FFFFFF">结算</font></a></div>
  </div>
  </div>
  
      <div class="clear"></div>
      <div id="foot"></div>
    </div>


</div>
<div id="back" class="back"></div>
<div class="tck1" id="payorder">
  <div class="title">在线支付<i onClick="closeWin();"></i></div>
  <form name="payform" method="post" action="../order/preparePay?payment=WY" target="_blank" onsubmit="setTimeout('pay()',1)">
    <input name="cmd" type="hidden" value="add" />
    <input id="wy_oid" name="orderId" type="hidden"/> 
    <ul>
      <li class="w125">订单号：</li>
      <li>
        <input id="orderNum" size="15" class="tck_text noborder" name="orderNum" value="${order.orderNo }" readonly="readonly" />
      </li>
    </ul>
    <ul>
      <li class="w125">订单合计金额：</li>
      <li class="tck_text"><span id="orderamount">${order.orderMoney }</span>元</li>
    </ul>
    <ul>
      <li class="w125">已支付金额：</li>
      <li class="tck_text"><span id="payamount">${order.orderMoney-order.remainMoney }</span>元</li>
    </ul>
    <p>&nbsp;</p>
    <ul>
      <li class="w125">
        <label for="amount">请输入金额：</label>
      </li>
      <li class="tck_text">
        <input name="amount" id="amount" onfocus="this.select();"  class="input" size="15" value="499" maxlength="20" />
      </li>
      <li class="attention" style="float:none;">注意：每次支付金额不能超出银行卡限额</li>
      <li class="de_bt">
        <input type="image" src="../images/de_bt.gif" onClick="return check()" />
      </li>
    </ul>
  </form>
  <div class="payok" id="payok" style="display:none"> 
   	您已经完成支付，请耐心等待客服确认，或者拨打以下电话联系客服快速开课：<br>
	客服热线：<strong style=" color:#f25500">010-59059038</strong> 或 <strong style=" color:#f25500">400-678-3456</strong>（长途免费）
    <div>
    <img src="../images/gb_new_bt.gif" style="cursor:pointer" onClick="closeWin();" />
    </div>
  </div>
</div>
<div class="all1" id="payresult">
  <ul>
    <li class="de_bt1"><a href="javascript:void(0);" id="btnSuccess">已完成支付</a></li>
    <li class="de_bt_2"><a href="javascript:void(0);" id="btnFailed">支付遇到问题</a></li>
  </ul>
</div>
<script type="text/javascript">
//显示订单详情
function detail(id){
	$("#detail"+id).toggle("slow");
	var img = $("#img"+id);
	if(img.attr("src").indexOf("xial_1")>-1)
		$(img.attr("src",img.attr("src").replace("xial_1","xial_2")));
	else
		$(img.attr("src",img.attr("src").replace("xial_2","xial_1")));
}
//显示窗体
function showWin(id){
/* 	if(Number("${order.cashMoney}")<500)
	{
		alert("不需要使用大额支付功能");
		return;
	} */
	$("#back").css("height",Math.max($("body").height(),$("html").height())).show();
	$("#"+id).css("top",function(eid){
		return getWinHeight()/2-$("#"+eid).height()/2+Math.max($("body").scrollTop(),$("html").scrollTop())-20;
	}).fadeIn("slow");
	$("html,body").css("overflow","hidden");
}
//关闭窗体
function closeWin(){
	$("html,body").css("overflow","");
	$("#back").hide();
	$("#payorder,#payresult,#payok").fadeOut("slow");
	$(":radio").attr("checked",false);
}
function check(){
	var amount = document.payform.amount,
		error = function(msg){
				alert(msg);
				return false;
			};
	if(amount.value==""){
		return error("支付金额不能为空！");
	}
	if(!parseInt(amount.value)){
		amount.value="";
		return error("请输入正确的金额");
	}
	//pay();
	return true;
}
//去支付
function pay(){
	closeWin();
	showWin("payresult");
	$("#btnSuccess").attr("href",location.pathname+"?orderId=${order.orderId}&payType=multipay").click(function(){
		$(this).html("刷新中...").unbind("click");
		$("#btnFailed").unbind("click");
	});
	$("#btnFailed").unbind("click").click(function(){
		closeWin();
		showWin("payorder");
	});
}
//获取网页可视高度
function getWinHeight(){
	return window.innerHeight?window.innerHeight:document.documentElement.offsetHeight-5;
}

$(function(){
	if("${payType}"=="multipay")
	{
		 $("ul.buyPayTit li[id='paytab5']").addClass("current").siblings("li").removeClass("current");
		 $("div.buyPay_con[id='multiPay']").show().siblings("div.buyPay_con").hide();
		showWin("payorder");
	}
})
</script>
</body>
</html>