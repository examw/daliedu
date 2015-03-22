<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>现金券充值   我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
 .title2 {
    background-color: #E7E7E7;
    border-bottom: 1px solid #D7D7D7;
    clear: both;
    font-size: 15px;
    font-weight: bold;
    height: 30px;
    line-height: 30px;
    margin-bottom: 10px;
    padding: 5px 0 0 15px;
}	
.zfboder {
    background-color: #FFFFFF;
    border: 4px solid #D9D9D9;
    padding: 10px;
    width: 220px;
}
.f16px {
    color: #CC0000;
    font-family: Arial;
    font-size: 14px;
    font-weight: bold;
}
.lfhre_input{background: url(../images/pic_007.gif) repeat-x scroll 0 0 transparent;border: 1px solid #999999;height: 21px;width: 178px;line-height:22px}
.payForm{display:none}
</style>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript" src="../artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(function(){$("#recharge_").addClass("hhover");});
	function showboxyhhk(obj){
		art.dialog({
            title: "温馨提示",
            content: '<div class="login2"><div class="loglf2"><ul><table border="1" class="PayTable f14px" cellspacing="0" cellpadding="0" align="center" bordercolor="#cccccc"><tr height="32"><td width="20%" height="32" bgcolor="#f4f4f4"><strong>银行名称</strong></td><td width="36%" bgcolor="#f4f4f4"><strong>帐号</strong></td><td width="24%" bgcolor="#f4f4f4"><strong>开户行</strong></td><td width="20%" bgcolor="#f4f4f4"><strong>收款人</strong></td></tr><tr>    <td><img src="../images/pay_bank_icbc.gif" width="110" height="20" alt="中国工商银行" /></td><td class="f16px">6212 2502 0000 2914 727</td><td style="line-height:18px;">北京市海淀区<br />    中关村南路支行</td><td>欧志华</td></tr><tr bgcolor="#f4f4f4"><td><img src="../images/pay_bank_cbc.gif" width="110" height="20" alt="中国建设银行" /></td><td class="f16px">6227 0000 1120 0217 750</td><td style="line-height:18px;">北京市海淀区<br />      中关村南大街支行</td><td>欧志华</td></tr> <tr><td><img src="../images/pay_bank_cb.gif" width="110" height="20" alt="中国银行" /></td><td class="f16px">6013 8201 0001 7969 539</td><td style="line-height:18px;">北京市海淀区<br />    魏公村支行</td><td>欧志华</td></tr><tr bgcolor="#f4f4f4"><td><img src="../images/pay_bank_abc.gif" width="110" height="20" alt="中国农业银行" /></td><td class="f16px">6228 4800 1087 7140 417</td><td style="line-height:18px;">北京市海淀区<br />      中关村白石桥支行</td><td>欧志华</td></tr><tr><td><img src="../images/pay_bank_psbc.gif" width="110" height="20" alt="中国邮政储蓄银行" /></td><td class="f16px">6210 9810 0000 5827 698</td><td style="line-height:18px;">北京市海淀区<br />魏公村支行</td><td>欧志华</td></tr><tr bgcolor="#f4f4f4"><td><img src="../images/pay_bank_cb.gif" width="110" height="20" alt="中国银行" /></td><td class="f16px">3493 5603 6894<br /><span style="font-size:12px;">(不建议使用，不能即时查询)</span></td><td style="line-height:18px;">中国银行北京<br />  魏公村支行</td><td>北京环球兴学<br />    科技发展有限公司</td></tr><tr height="32" bgcolor="#f4f4f4"><td colspan="4"><table class="body" cellspacing="0"><tr><td height="20" align="left" valign="center" bgcolor="#FFFFFF" class="fB ft14"><strong><span style="color:#cc0000">&nbsp;银行汇款说明</span></strong></td></tr><tr>  <td height="20" align="left" valign="center" bgcolor="#FFFFFF"><strong>1</strong>&nbsp;&nbsp;<span class="f16px">客服咨询:4000-525-585 </span></td></tr><tr>    <td height="20" align="left" valign="center" bgcolor="#FFFFFF"><strong>2</strong>&nbsp;  您对服务人员的服务不满意，请投诉到：examwcom@qq.com(请手动将其中的&ldquo;#&rdquo;替换成&ldquo;@&rdquo;)</td></tr><tr>  <td height="20" align="left" valign="center" bgcolor="#FFFFFF"><strong>3</strong>&nbsp; 汇款时请多汇几元钱或者几角钱，如100.7元，目的是为了方便我们的查询，可大幅提高您的款项入账速度。</td></tr></table></td></tr></table></ul></div></div>',
            zIndex: 18008,
            lock: true,
            resize: false,
            fixed: true
            });
	}
	function showForm(type)
	{
		$("div .pay").hide();
		if(type=="ZFB")
		{
			$("span[name='paytype']").html("支付宝");
		}
		if(type=="WY")
		{
			$("span[name='paytype']").html("网银在线");
		}
		$("#payType").val(type);
		$("div .payForm").show();
	}
	function checkMoney()
	{
		var val = $("#money").val();
		if(!val||!$.trim(val))
        {
        	$("#valueInfo").html("<span style='color:red'>不能为空</span>");
        	return false;
        }
        if(/^[0-9]+[.]?[0-9]{0,2}$/.test(val))
        {
        	if(Number(val)<50)
        	{
        		$("#valueInfo").html("<span style='color:red'>充值最低50起</span>");
        		return false;
        	}
        	$("#money").val(Number(val));
        	$("#valueInfo").html("");
        	return true;
        }else
        {
        	$("#valueInfo").html("<span style='color:red'>充值最低50起,最多保留2位小数</span>");
        	return false;
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
<p class="weizhi">当前位置：<a href="../memberCenter/member.jsp">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/recharge.jsp">账户充值

</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">现金券充值</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
	<li><a href="../memberCenter/recharge.jsp">学习卡充值</a></li>
	<li id="xz">现金券充值</li>
	<li><a href="../member/tradeList">充值记录</a></li>
</ul>
</span>
</h1>
    <div class="ListContent">
<div class="cd_line"></div>
<div class="pay">
<div class="title2">请选择以下充值方式</div>
<TABLE width="100%" border=0 align="center">
<TBODY>
<TR>
<TD width="33%" align="center">
<table width="100%" align="center" class="zfboder" onMouseOver="this.style.border='4px solid #f60'" onmouseout="this.style.border='4px solid #d9d9d9'" href="javascript:;" height="194" title="网银在线支付">
<tr><td  align="center" valign="middle">
<a onclick="showForm('WY')"><img src="../images/wy.gif" alt="网银在线支付" style="cursor:pointer;" border="0"/></a>
</td>
</tr>
</table>
</TD>
<TD width="33%" align="center">
<table width="100%" align="center" class="zfboder" onMouseOver="this.style.border='4px solid #f60'" 
onmouseout="this.style.border='4px solid #d9d9d9'" href="javascript:;" height="194" title="支付宝在线支付">
<tr>
<td  align="center" valign="middle">
<a onclick="showForm('ZFB')"><img src="../images/zfb.gif" alt="支付宝在线支付" style="cursor:pointer;" border="0"/></a>
</td>
</tr>
</table></TD>
<td width="33%" align="center">
<table width="100%"  class="zfboder" onMouseOver="this.style.border='4px solid #f60'" onmouseout="this.style.border='4px solid #d9d9d9'" href="javascript:;" height="194" title="银行汇款">
<tr><td align="center" valign="middle"><span id="tyhhk" onclick="showboxyhhk();"><img src="../images/bank.gif" alt="银行汇款" style="cursor:pointer;" border="0"/></a></span></td>
</tr>
</table>	</td>
</TR>
</TBODY>
</TABLE>
</div>
<div class="payForm">
  <table width="100%" height="auto">
  <tr>
    <td height="148" colspan="3" align="left" valign="top">
	<FORM name=formbill action="../member/prepareRecharge" method=post target="_blank" onSubmit="return checkMoney();">
	<table width='90%' border='0' cellpadding='2' cellspacing='1' class='x_table'>
  <tr height="24">
    <td height="30" colspan="3" align="middle" bgcolor="#FFFFFF"><b><a href="#" style=" color:#f30; font-size:14px"><span name="paytype"></span>充值</a></b></td>
    </tr>
  <tr height="24">
    <td width="104" height="30" align="middle" bgcolor="#efefef">确认项目</td>
 
    <td colspan="2" align="middle" bgcolor="#efefef"><strong>进行以下操作将使用<span name="paytype"></span>为您的账号进行在线充值。</strong></td>
  </tr>
<tr height="24"><td height="30" align="middle">当前余额:</td><td colspan="2" align="left" bgcolor="#efefef">&nbsp;&nbsp;现金券：￥&nbsp;<strong style="color:red"><fmt:formatNumber value="${student.stuCash}" pattern="#,##0.00" /></strong> 元；</td></tr>	
  <tr bgcolor="#ffffff" height="24">
    <td height="30" align="middle">当前账号</td>
    <td colspan="2" align="left"><input readonly="readOnly" class="lfhre_input" name="Name" type="text" value="${student.stuUsername }" /></td>
  </tr>
<!--   <tr bgcolor="#ffffff" height="24"> 
    <td height="30" align="middle">手机号码</td>
    <td colspan="2" align="left"><input name="Mobile" value="" />
      建议真实填写</td>
  </tr> -->
  <tr bgcolor="#ffffff" height="24">
    <td height="30" align="middle"><span style="color:#CC0000">充值金额</span></td>
 
    <td colspan="2" align="left"><input name="tradeMoney" id="money" type=text value="0" onblur="checkMoney();" class="lfhre_input"> 
    元<span id=EBi></span> <span id="valueInfo">充值最低50元起</span></td>
 
  </tr>
  <tr bgcolor="#ffffff">
    <td height="30" align="middle">操作</td>
    <td colspan="2" align="left">
    <input type="submit" value="开始充值 "><input type="button" style="margin-left:10px" value="其他方式" onclick="$('div.payForm').hide();$('div.pay').show();">
	<input type="hidden" id="payType" name="payment"/>
	</td>
 
  </tr>
</table>
   </FORM></td>
  </tr>
</table>

</div>
    	
        </div>
       </div>
      </div>
    </div>
    
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
