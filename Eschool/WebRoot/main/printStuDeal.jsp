<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>中华考试网2013年${stuDeal.deal.dealName}条款</title>
<style type="text/css">
<!--
body{
	font-size: 12px;
	line-height:1.8em;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.biaoti {
	font-size: 16px;
	text-align:center;
	font-weight: bold;
  }
.text{
    border-bottom:1px #000 solid;
}
.text14{
    font-size:14px;
}
-->
</style>
<script language="javascript">
var HKEY_Root,HKEY_Path,HKEY_Key;
HKEY_Root="HKEY_CURRENT_USER";
HKEY_Path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";

//设置网页打印的页眉页脚为空
function PageSetup_Null()
{
	try
	{
		var Wsh=new ActiveXObject("WScript.Shell");
		HKEY_Key="header";
		Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"");
		HKEY_Key="footer";
		Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"");
	}
	catch(e){}
}

//设置网页打印的页眉页脚为默认值
function PageSetup_Default()
{
	try
	{
		var Wsh=new ActiveXObject("WScript.Shell");
		HKEY_Key="header";
		Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&w&b页码,&p/&P");
		HKEY_Key="footer";
		Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&u&b&d");
	}
	catch(e){}
} 
</script>
</head>

<body>

<table width="640" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="20" colspan="3" align="right">协议编号：wx_examw_${stuDeal.stuDealId}</td>
  </tr>
  <tr>
    <td height="40" colspan="3" class="biaoti">2013年${stuDeal.deal.dealName}条款</td>
  </tr>
  <tr>
    <td colspan="3">      甲方：${stuDeal.stuName}<br />
        乙方：长沙畅亨信息技术有限责任公司（中华考试网网校）<br />
     <p align="left">　${stuDeal.deal.dealContent } </p>     
     <p>　　　　　　　　　　本合同自<span class="text"> ${stuDeal.stuDealTime}</span>日签署生效，结束日期为 <span class="text"> ${stuDeal.deal.dealLastDate}</span> <br />
          <br />
          乙 方：长沙畅亨信息技术有限责任公司（中华考试网网校　　　　　　　　　甲 方：${stuDeal.stuName}　 </p></td>
  </tr>
  <tr>
    <td width="64">盖 章：</td>
    <td width="219"><img src="../images/zhang.jpg" width="167" height="142" /></td>
    <td width="417" align="left">网校用户名：${stuDeal.stuUsername}<br />
      身份证号：${stuDeal.stuCards}<br />
      联系地址：${stuDeal.stuAddress}<br />
      联系电话：${stuDeal.stuPhone}<br />
     电子邮件：${stuDeal.stuEmail}<br />
      交费方式：${stuDeal.paytype}</td>
  </tr>
</table>

</body>
</html>
<script language="javascript">PageSetup_Null();window.print();</script>