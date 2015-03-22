<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>密码修改   我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.info .succ {
    border-bottom: 1px solid #CCCCCC;
    color: #00AA13;
    float: left;
    font-size: 14px;
    font-weight: bold;
    line-height: 22px;
    padding: 0 0 10px;
    width: 400px;
}
	.info  .link {
	clear:both;
    float: left;
    line-height: 22px;
    margin: 5px 0;
}
</style>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
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
//检查原密码
function checkNull(input,$info)
{
	if(!input.val()||!$.trim(input.val()))
	{
		$info.html('请输入原密码');
		return false;
	}else
	{
		$info.html("");
		return true;
	}
}
//检查密码
function checkPassword(input,$pwdInfo) {
	var pwd = input.val();
	//
	var reg = /^[0-9a-zA-Z_]+$/;
	if (pwd.length < 6 || pwd.length > 20
			|| !reg.test(pwd)
			) {
		$pwdInfo.html("<p class='error'>密码不合法</p>");
		return false;
	} else {
		$pwdInfo.html("");
		return true;
	}
}
//检查重复密码
function checkRepeatPwd(input1,input2,$pwd1Info) {
	if(!checkPassword(input1,$pwd1Info))
	{
		$pwd1Info.html("<p class='error'>您输入的密码不合法</p>");
		return false;
	}
	var pwd = input1.val();
	var pwd1 = input2.val();
	if (pwd1 && (!pwd1.indexOf(pwd) && pwd.length == pwd1.length)) {
		$pwd1Info.html("<img src='../images/bingo.gif'/>");
		return true;
	} else {

		$pwd1Info.html("<p class='error'>两次密码不一致，请重新输入</p>");
		return false;
	}

}
function checkAll()
{
	return checkNull($('#txtOldPwd'),$('#oldInfo'))&checkPassword($('#txtNewPwd'),$('#newInfo'))&checkRepeatPwd($('#txtNewPwd'),$('#txtNewPwd2'),$('#repInfo'));
}
function modifyPwd()
{
	if(checkAll())
	{
		$.ajax({
			async:true,
			type:"POST",
			url:"../member/modifyPwd",
			data:{"oldPwd":$('#txtOldPwd').val(),"newPwd":$('#txtNewPwd').val(),"url":window.location.href},
			success:function(data){
			if(data)
			{
				$("#listContent").html('<ul class="info"><li class="succ">修改成功</li><li class="link"><a href="javascript:;" onclick="window.location.reload();">点击返回</a></li><li class="link"><a href="../memberCenter/member.jsp">返回首页</a></li></ul>');
			}else
			{
				$("ul .info").html('<ul class="info"><li class="succ">原密码错误</li><li class="link"><a href="javascript:;" onclick="window.location.reload();">点击返回</a></li><li class="link"><a href="../memberCenter/member.jsp">返回首页</a></li><ul>');
			}
			},
			error:function(){
				alert("系统错误,或者您的登录已失效!");
				window.location.reload();
			}
		});
		
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/info.jsp">个人信息</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">密码修改</a></p>
<div class="List">
  <div class="ListContent TopBorder" id="listContent">
  <ul class="info">
  <li class="ctt_lfhre"><h1>个人资料：</h1></li>
  <li class="lfhre_sp">
  <ol>
  <li><a href="../memberCenter/info.jsp">个人资料</a></li>
  <li><a href="../memberCenter/face.jsp">头像照片</a></li>
  <li class="infoxz">密码修改</li>
  <li><a href="../member/addressList">收货地址</a></li>
  </ol>
  </li>
  <li class="lfhre_li">
  <table cellspacing="0" cellpadding="0" border="0" width="688" id="from">
<tbody>
<tr>
 <td height="40" align="right">当前密码：&nbsp;</td>
 <td width="232">
 <input type="password" style="padding-left:5px;" class="lfhre_input" id="txtOldPwd" onblur="checkNull($('#txtOldPwd'),$('#oldInfo'));" maxlength="40" name="ctl00$cp1$txtOldPwd">&nbsp;<span style="color:Red;visibility:hidden;" id="ctl00_cp1_RequiredFieldValidator1">*</span></td>
 <td width="342"><span id="oldInfo" style="color:red"></span> </td>
</tr>
<tr>
 <td height="40" align="right" width="114">新密码：&nbsp;</td>
 <td>
 <input type="password" style="padding-left:5px;" class="lfhre_input" id="txtNewPwd" onblur="checkPassword($('#txtNewPwd'),$('#newInfo'));" maxlength="40" name="ctl00$cp1$txtNewPwd">&nbsp;<span style="color:Red;visibility:hidden;" id="ctl00_cp1_RequiredFieldValidator2">*</span><span style="color:Red;visibility:hidden;" id="ctl00_cp1_CompareValidator1"></span>
 </td>
 <td><span id="newInfo" style="color:red"></span></td>
</tr>
<tr>
 <td height="40" align="right">确认新密码：&nbsp;</td>
 <td><input type="password" style="padding-left:5px;" class="lfhre_input" id="txtNewPwd2" onblur="checkRepeatPwd($('#txtNewPwd'),$('#txtNewPwd2'),$('#repInfo'))"maxlength="40" name="ctl00$cp1$txtNewPwd2">&nbsp;<span style="color:Red;visibility:hidden;" id="ctl00_cp1_RequiredFieldValidator3">*</span> </td>
  <td><span id="repInfo" style="color:red"></span></td>
</tr>
</tbody>
</table>
  </li>
  </ul>
  <span class="lfhre_spa"><input id="ctl00_cp1_btnModify" type="image" onclick="modifyPwd();" src="../images/pic_006.gif" name="ctl00$cp1$btnModify"></span>
  </div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
