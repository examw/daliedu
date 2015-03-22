<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改头像  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript">
	$(function(){
	$("#info_").addClass("hhover");});
	function commit()
	{
		var value = $("#ctl00_cp1_File1").val();
		if(!value)
		{
			alert("请选择图片文件");
			return;
		}
		if(/^[\d\D]+.jpg$/.test(value)||/^[\d\D]+.png$/.test(value))
		{
			$("#fileForm").submit();
			return;
		}
		else
		{
			alert("文件类型限制,只能是jpg或png");
			return;
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/info.jsp">个人信息</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">头像照片</a></p>
<div class="List">
  <div class="ListContent TopBorder">
  <ul class="info">
  <li class="ctt_lfhre"><h1>个人资料：</h1></li>
  <li class="lfhre_sp">
  <ol>
  <li><a href="../memberCenter/info.jsp">个人资料</a></li>
  <li class="infoxz"><a href="#">头像照片</a></li>
  <li><a href="../memberCenter/modifyPwd.jsp">密码修改</a></li>
  <li><a href="../member/addressList">收货地址</a></li>
  </ol>
  </li>
  <li id="con2">
  <div class="midtext3">
  <div class="facetop">当前头像</div>
  <div class="intrF">
  <div class="photo_big"><img id="imgFace" style="height:100px;width:100px;" src="${student.stuImgUrl }"></div>
  </div>
  </div>
  <div class="midtext3" style="float:right">
  <div class="facetop">更新头像</div>
    <form method="post" enctype="multipart/form-data" action="../member/upload" id="fileForm">  
  <div class="intrF">
  <div class="depict"> 请选择新的照片文件,文件需小于2.0MB,格式为jpg或png </div>
  <div>
  <div class="bb"><input id="ctl00_cp1_File1" type="file" style="width:300px;height:25px" name="mf" accept="image/png, image/jpeg"></div>
  </div>
  <div class="btn" style="clear:both"><input id="ctl00_cp1_btnUpload" class="btn2" type="button" value="上传" name="ctl00$cp1$btnUpload" onclick="commit();"></div>
  </div>
  <s:fielderror/>
  </form>
  </div>
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
