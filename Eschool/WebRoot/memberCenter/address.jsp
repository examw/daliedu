<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>收货地址   我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.warn{border:1px solid #FF3333;}	
</style>
<script type="text/javascript" src='../js/jquery-1.4.3.js'></script>
<script type="text/javascript">
$(function(){
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
$("#info_").addClass("hhover");});
function checkName(input)
{
	var name = input.val();
	if(!name||!$.trim(name)) {input.addClass("warn").val("请输入收货人姓名");return false;}//
	var reg=/^[\u4E00-\u9FA5]{2,12}$/;
	if(!reg.test(name))
	{
		input.addClass("warn").val("姓名不合法请重试");
		return false;
	}else
	{
		//alert(name);
		input.removeClass("warn");
		return true;
	}
}
function checkMobile(input)
{
	
	var phone = input.val();
	if(!phone||!$.trim(phone)) {input.addClass("warn").val("请输入手机号码");return false;}
	//var reg1 =/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;//���(0��ͷ)
	var reg2 =/^1[3458]\d{9}$/;//�ֻ�(13,15,18)
	if(!reg2.test(phone))
	{
		input.addClass("warn").val("号码不合法");
		return false;
	}else
	{
		input.removeClass("warn");
		return true;
	}
}
function checkPhone(input)
{
	
	var phone = input.val();
	if(!phone||!$.trim(phone)) {input.removeClass("warn");return true;}
	var reg1 =/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;//���(0��ͷ)
	//var reg2 =/^1[3458]\d{9}$/;//�ֻ�(13,15,18)
	if(!reg1.test(phone))
	{
		input.addClass("warn").val("号码不合法");
		return false;
	}else
	{
		input.removeClass("warn");
		return true;
	}
}
function checkAddr(input)
{
	if(!input.val()||!$.trim(input.val()))
	{
		input.addClass("warn").val("请输入详细地址");
		return false;
	}else
	{
		input.removeClass("warn");
		return true;
	}
}
function checkEmail(input) {
	if (!input.val() || !$.trim(input.val())) {
		input.removeClass("warn");
		return true;
	} else {
		var reg = /[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+/;
		if (!reg.test(input.val())) {
			input.addClass("warn").val("Email不合法");
			return false;
		} else
		{
			input.removeClass("warn");
			return true;
		}
	}
}
function checkPostCode(input) {
	if (!input.val() || !$.trim(input.val())) {
		input.removeClass("warn");
		return true;
	} else {
		var reg = /^[0-9]{6}$/;
		if (!reg.test(input.val())) {
			input.addClass("warn").val("邮编不合法");
			return false;
		} else
		{
			input.removeClass("warn");
			return true;
		}
	}
}
function checkAll()
{
	return checkName($("#txtName"))&checkAddr($("#txtAddress"))&checkMobile($("#txtMobile"))&checkPhone($("#txtTel"))&checkEmail($("#txtEmail"))&checkPostCode($("#txtPost"));
}
function addOrUpdate()
{
	var aid = ($('#addrId').val()?Number($('#addrId').val()):0);
	var addrNum = $(".myclass").length;
	if(aid==0&&addrNum>=5)
	{
		alert("地址最多不超过5个,您可以选择一个进行更改!");
		return;
	}
	if(checkAll())
	{
	$.ajax({
		async:true,
		type:"POST",
		url:"../member/addressList?aid="+aid,
		data:{"url":window.location.href,"addr.addrId":$('#addrId').val(),"addr.addrReceiveName":$("#txtName").val(),"addr.addrFullAddress":$("#txtAddress").val(),"addr.addrMobile":$("#txtMobile").val(),"addr.addrPhone":$.trim($("#txtTel").val()),"addr.addrPostalCode":$.trim($("#txtPost").val()),"addr.addrEmail":$.trim($("#txtEmail").val())},
		dataType:'json',
		success:function(data)
		{
			if(data)
			{
				window.location.reload();
			}else
			{
				alert("没做修改！");
			}
		},
		error:function(){
			alert("系统错误,请重试");
			window.location.reload();
		}
	});
	}
}
function setDefault(obj)
{
	var id = $(obj).val();
	$.ajax({
		async:true,
		url:"../member/setDefaultAddr",
		type:"POST",
		data:{"aid":id},
		dataType:"json",
		success:function(data){
			if(data)
			{
				$(obj).attr("checked","checked");
			}
		},
		error:function(){
			alert("系统错误");
			window.location.reload();
		}
	});
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/info.jsp">个人信息</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">收货地址</a></p>
<div class="List">
  <div class="ListContent TopBorder">
  <ul class="info">
  <li class="ctt_lfhre"><h1>个人资料：</h1></li>
  <li class="lfhre_sp">
  <ol>
  <li><a href="../memberCenter/info.jsp">个人资料</a></li>
  <li><a href="../memberCenter/face.jsp">头像照片</a></li>
  <li><a href="../memberCenter/modifyPwd.jsp">密码修改</a></li>
  <li class="infoxz">收货地址</li>
  </ol>
  </li>
  <s:if test="addrList!=null">
  <li class="lfhre_li">
  <h2>已添加的收货地址：</h2>
  <table cellspacing="0" cellpadding="0" border="0" width="688" id="address" class="table_a">
  <tbody>
  <s:iterator value="addrList" var="address">
  <tr class="myclass">
   <td height="35" width="611"><strong>&nbsp;<a href="?aid=${address.addrId }">${address.addrFullAddress }</a></strong></td>
  <%--  <td width="20">
   <input type="radio" id="radio${address.addrId}" value="${address.addrId }" name="radio" onclick="setDefault(this);"><label for="radio"></label>
   <script type="text/javascript">
   		var flag = "${address.addrIsDefault}";
   		var aid = "${address.addrId}";
   		if(flag==1)
   		{
   			$("#radio"+aid).attr('checked','checked');
   		}
   </script>
   </td>
   <td width="57">设为默认</td> --%>
  </tr>
  </s:iterator>
  </tbody>
  </table>
  <br />
  </s:if>
  <li class="lhe_two">
  <table cellspacing="0" cellpadding="0" border="0" width="686" id="from">
  <tbody>
  <tr style="display:none">
	<td><input id="addrId" type="hidden" value="${addr.addrId }" ></td>  	
  </tr>
  <tr>
    <td height="30" align="right" width="103"><em>*</em> 收货人姓名：</td>
    <td width="583"><label for="textfield"></label><input type="text" class="lfhre_input" id="txtName" name="addr.addrReceiveName"  value="${addr.addrReceiveName}" onfocus="this.select();" onblur="checkName($('#txtName'));"></td>
  </tr>
  <!-- <tr>
     <td height="30" align="right">
     <em>*</em> 省 份：<input type="hidden" id="hfCity" name="ctl00$cp1$hfCity"><input type="hidden" id="hfCity2" name="ctl00$cp1$hfCity2">
     </td>
     <td id="tdCity" valierr=""><select name="select"><option value="0">请选择</option></select></td>
  </tr> -->
  <tr>
     <td height="30" align="right"><em>*</em> 详细地 址：</td>
     <td><input type="text" style="width:400px;" class="lfhre_input" id="txtAddress" name="addr.addrFullAddress" value="${addr.addrFullAddress}" onfocus="this.select();" onblur="checkAddr($('#txtAddress'));">&nbsp;<em></em></td>
  </tr>
  <tr>
     <td height="30" align="right"><em>*</em> 手机号码：</td>
     <td><input type="text" style="width:136px;" class="lfhre_input" id="txtMobile" name="addr.addrMobile" value="${addr.addrMobile }" onfocus="this.select();" onblur="checkMobile($('#txtMobile'));"> 或者固定电话：<input type="text" style="width:136px;" class="lfhre_input" id="txtTel" name="addr.addrPhone" value="${addr.addrPhone }" onfocus="this.select();" onblur="checkPhone($('#txtTel'));"> 
     用于接收发货通知短信及送货前确认</td>
  </tr>
  <tr>
     <td height="30" align="right">电子邮件：</td>
     <td><input type="text" style="width:136px;" class="lfhre_input" id="txtEmail" name="addr.addrEmail" value="${addr.addrEmail }" onfocus="this.select();" onblur="checkEmail($('#txtEmail'));"> 
     用来接收订单提醒邮件，便于您及时了解订单状态</td>
  </tr>
  <tr>
     <td height="30" align="right">邮政编码：</td>
     <td><input type="text" style="width:100px;" class="lfhre_input" id="txtPost" name="addr.addrPostalCode" value="${addr.addrPostalCode }" onfocus="this.select();" onblur="checkPostCode($('#txtPost'));"> 
     有助于快速确定送货地址</td>
  </tr>
  <tr>
    <td height="30" align="right">&nbsp;</td>
    <td></td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
    <td><a href="javascript:;" onclick="addOrUpdate()"><input type="image" src="../images/pic_008.gif" id="ctl00_cp1_btnSave" name="ctl00$cp1$btnSave" ></a></td>
  </tr>
  </tbody>
  </table>
  </li>
  </li>
  </ul>
  </div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
