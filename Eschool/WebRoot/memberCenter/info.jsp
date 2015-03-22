<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>个人资料   我的首页</title>
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
<script type="text/javascript" src="../js/citys.js"></script>
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
		$("#info_").addClass("hhover");
		var addr = "${student.stuAddr}";
		if(!addr)
		{
			$("#addr_exist").hide();
			$("#div_select").show();
		}
		var prov = $("#ddlProvince");
		for(var i=0;i<cities.length;i++)
		{
			var p = cities[i];
			var $option = $("<option value="+p[1]+">"+p[1]+"</option>");
			prov.append($option);
		}
	});
	function changeProvince()
	{
		var index = $("#ddlProvince")[0].selectedIndex;
		var province = cities[index];//获取选定的省份数据
	  	var citys = province[2];//获取省份的城市信息
	  	var cityList = $("#ddlCity");//获取城市列表控件
      	cityList.html("");//清空城市列表
      	//将每个城市作为选项 加入城市列表
	  	for(var i=0; i<citys.length; i++){
	    	var city=citys[i];
	    	var $option = $("<option value="+city+">"+city+"</option>");
	    	cityList.append($option);
	  }
	}
	function checkName(input,span)
{
	var name = input.val();
	//alert(name);
	if(!name||!$.trim(name)) {span.html("请输入真实姓名");return false;}//可以不填
	var reg=/^[\u4E00-\u9FA5]{2,12}$/;
	if(!reg.test(name)||name.length>12||name.length<2)
	{
		span.html("请输入真实姓名");
		return false;
	}else
	{
		//alert(name);
		span.html("<img src='../images/bingo.gif'/>");
		return true;
	}
	
}
function checkPhone(input,span)
{
	
	var phone = input.val();
	if(!phone||!$.trim(phone)) {span.html("请输入电话号码");return false;}
	var reg1 =/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;//���(0��ͷ)
	var reg2 =/^1[3458]\d{9}$/;//�ֻ�(13,15,18)
	if(!reg1.test(phone)&&!reg2.test(phone))
	{
		span.html("电话号码不合法");
		return false;
	}else
	{
		span.html("<img src='../images/bingo.gif'/>");
		return true;
	}
}
function checkEmail(input,span) {
	//input,span为jquery对象�
	var flag = false;
	if (!input.val() || !$.trim(input.val())) {
		span.html("Email不能为空");
		return false;
	} else {
		var reg = /[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+/;
		if (!reg.test(input.val())) {
			span.html("Email不合法");
			return false;
		} else
		{
			if(input.val()!="${student.stuEmail}")
			{
				$.ajax({
					async : false,
					url : '../user/checkEmail',
					type : "post",
					data : "email=" + input.val(),
					success : function(data) {
					if (data) {
						span.html("该Email已经被占用");
						flag = false;
					} else {
						span.html("<img src='../images/bingo.gif'/>");
						flag = true;
					}
				}
				});
			}else{
				span.html("<img src='../images/bingo.gif'/>");
				flag =true;
			}
			return flag;
		}
	}
}
	function getAddr()
	{
		var prov_val = $("#ddlProvince").val()+"省(市)";
		var city_val = $("#ddlCity").val();
		if(prov_val=="请选择省(市)")
		{
			prov_val="";
		}
		if(city_val=="请选择省份")
		{
			city_val="";
		}
		return prov_val+city_val;
	}
	function checkAll()
	{
		return checkName($('#stuName'),$('#nameInfo'))&checkEmail($('#txtEmail'),$('#emailInfo'))&checkPhone($('#txtMobile'),$('#mobileInfo'));
	}
	function modify()
	{
		if(checkAll())
		{
			$.ajax({
				async:true,
				type:"POST",
				url:"../member/modifyBaseInfo",
				data:{"url":window.location.href,"student.stuName":$("#stuName").val(),"student.stuEmail":$("#txtEmail").val(),"student.stuMobile":$("#txtMobile").val(),"student.stuSex":$("input[name='student.stuSex']:checked").val(),
								"student.stuAddr":getAddr(),"student.stuPAddr":$.trim($("#txtAddress").val()),"student.stuPhone":$.trim($("#txtTel").val()),"student.stuPostcal":$.trim($("#txtPost").val())},
				dataType:'json',
				success:function(data){
					if(data)
					{
						$("#listContent").html('<ul class="info"><li class="succ">修改成功</li><li class="link"><a href="javascript:;" onclick="window.location.reload();">点击返回</a></li><li class="link"><a href="../memberCenter/member.jsp">返回首页</a></li></ul>');
					}else
					{
						$("#listContent").html('<ul class="info"><li class="succ">没做修改</li><li class="link"><a href="javascript:;" onclick="window.location.reload();">点击返回</a></li><li class="link"><a href="../memberCenter/member.jsp">返回首页</a></li></ul>');
					}
				},
				error:function(){
					alert("系统错误,或者登录已失效");
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/info.jsp">个人信息

</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">个人资料</a></p>
<div class="List">
  <div class="ListContent TopBorder" id='listContent'>
  <ul class="info">
  <li class="ctt_lfhre"><h1>个人资料：</h1></li>
  <li class="lfhre_sp">
  <ol>
  <li class="infoxz">个人资料</li>
  <li><a href="../memberCenter/face.jsp">头像照片</a></li>
  <li><a href="../memberCenter/modifyPwd.jsp">密码修改</a></li>
  <li><a href="../member/addressList">收货地址</a></li>
  </ol>
  </li>
  <li class="lfhre_li">
  <table cellspacing="0" cellpadding="0" border="0" width="688" id="form">
  <tbody>
  <tr>
    <td height="40" align="right"><em>*</em>&nbsp; 姓名：&nbsp;</td>
    <td width="232"><input type="text" class="lfhre_k" id="stuName" name="student.stuName" value="${student.stuName}" onblur="checkName($('#stuName'),$('#nameInfo'));"></td>
    <td width="342" ><span id='nameInfo' style="color:red;">&nbsp;</span></td>
  </tr>
  <tr>
    <td height="40" align="right" width="114"><em>*</em>&nbsp; 性别：&nbsp;</td>
    <td><span id="ctl00_cp1_rblSex">
    <input type="radio" checked="checked" value="男" name="student.stuSex" id="ctl00_cp1_rblSex_0"><label for="ctl00_cp1_rblSex_0">男</label>
    <input type="radio" value="女" name="student.stuSex" id="ctl00_cp1_rblSex_1"><label for="ctl00_cp1_rblSex_1">女</label></span>
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="40" align="right">&nbsp; 目前所在地：&nbsp;</td>
    <td>
    	<div id="addr_exist">${student.stuAddr }<span style="margin-left:10px" onclick="$('#addr_exist').hide()">修改</span></div>
    	<div id="div_select" style="display:none">
        <select onchange="changeProvince();" id="ddlProvince" name="ctl00$cp1$ddlProvince">
		</select>
        <select onchange="changeCity()" id="ddlCity">
          <option></option>
      </select><input type="hidden" id="hfCity" name="ctl00$cp1$hfCity">
      	</div>
    </td>
      
    <td><em></em></td>
  </tr>
  
  <tr>
    <td height="40" align="right"><em>*</em>手机：&nbsp;</td>
    <td><input type="text" class="lfhre_k" id="txtMobile" value="${student.stuMobile }" name="student.stuMobile" onblur="checkPhone($('#txtMobile'),$('#mobileInfo'));" disabled="disabled"></td>
    <td><span id='mobileInfo' style="color:red;">&nbsp;</span></td>
  </tr>
  <tr>
    <td height="40" align="right">座机：&nbsp;</td>
    <td><input type="text" class="lfhre_k" id="txtTel" name="student.stuPhone"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="40" align="right"><em>*</em>邮箱：&nbsp;</td>
    <td><input type="text" class="lfhre_k" id="txtEmail" name="student.stuEmail"  disabled="disabled" value="${student.stuEmail }" onblur="checkEmail($('#txtEmail'),$('#emailInfo'));"></td>
    <td><span id='emailInfo' style="color:red;">&nbsp;</span></td>
  </tr>
  <tr>
    <td height="40" align="right">通信地址：&nbsp;</td>
    <td><input type="text" class="lfhre_k" id="txtAddress" name="student.stuPAddr"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="40" align="right">邮编：&nbsp;</td>
    <td><input type="text" class="lfhre_k" id="txtPost" name="student.stuPostcal"></td>
    <td>&nbsp;</td>
  </tr>
</tbody>
</table>
  </li>
  </ul>
  <span class="lfhre_spa"><input id="ctl00_cp1_btnModify" type="image" onclick="modify();" src="../images/pic_005.gif" name="ctl00$cp1$btnModify"></span>
  </div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
