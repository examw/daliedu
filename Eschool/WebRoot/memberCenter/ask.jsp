<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我要咨询  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.lesson{color:red;}
</style>
<script language="javascript" src="../js/jquery-1.4.3.js"></script>
<script language="javascript">
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
	$("#ask_").addClass("hhover");});
	var acName="";
	function check()
	{
		if($("#ddlLesson").val()==0||$("#ddlTwoLesson").val()==0||$("#ddlThreeLesson").val()==0||$("#ddlClass").val()==0)
		{
			$("span .lesson").show();
			return false;
		}
		acName=$("#ddlTwoLesson").val()+$("#ddlThreeLesson").val()+$("#ddlClass").val();
		$("span .lesson").hide();
		if($("#tscontent").val().length<10||!$.trim($("#tscontent").val()))
		{
			$("#contentInfo").show();
			return false;
		}
		$("#contentInfo").hide();
		return true;
	}
	function add()
	{
		if(check())
		{
			$.ajax({
				async:true,
				type:"POST",
				url:"../member/addAskOrComp",
				data:{"url":window.location.href,"ac.acName":acName,"ac.acContent":$("#tscontent").val(),"ac.acType":0},
				dataType:"json",
				success:function(data){
					if(data)
					{
						alert("提交成功");
						window.location="../member/askList";
					}
				},
				error:function(){
					alert("系统错误,或者登录已经失效");
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
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../member/askList">我的咨询</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我要咨询</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li id=""><a href="../member/askList">我的咨询</a></li>
<li id="xz">我要咨询</li>
</ul>
</span>
</h1>
<div class="ListContent">
<ul id="ts">
<li class="ts_txt">
<ol>
<h3><strong>咨询说明</strong></h3>
<li>1.我要咨询帮您解答您在购买课程或学习中遇到的各种教学、教务问题，如果您有课程知识上的答疑，请在“学习答疑”中提问。</li>
<li>2.咨询时请详细描述你要咨询的考试、课程或班型。</li>
<li>3.所有咨询问题将在24小时内回复，请耐心等候。</li>
</ol>
</li>
<li class="wyts"><h2>我要咨询</h2></li>
<li class="xz_ys">
<table cellspacing="0" cellpadding="0" border="0" width="686">
<tbody>
<tr>
 <td height="30" align="right" width="131">涉及课程：</td>
 <td width="540">
 <select  id="ddlLesson" name="select" style="width: 80px;">
 <option selected="selected" value="0">请选择</option>
 <option value="工程技术类">工程技术类</option>
 <!-- <option value="701">外语类</option>
 <option value="702">财会类</option> -->
 <!-- <option value="703">经贸类</option>
 <option value="730">医卫类</option>
 <option value="922">法律类</option>
 <option value="963">学历其他</option>
 <option value="1234">职业资格</option>
 <option value="2019">升学类</option>
 <option value="2526">公务员类</option>
 <option value="2577">英语网校微课</option>
 <option value="2622">考试宝典</option>
 <option value="2826">工程类微课</option>
 <option value="2833">职业资格微课</option>
 <option value="2836">医卫类微课</option>
 <option value="3017">财经类微课</option>
 <option value="3019">企业内训</option>
 <option value="3102">工程题库软件</option>
 <option value="3212">职称评审</option>
 <option value="3306">财经类题库软件</option>
 <option value="3337">口语一对一</option>
 <option value="3348">人机对话</option>
 <option value="3404">职业资格题库软件</option>
 <option value="3463">在线一对一</option> -->
 </select>
 <select style="width:100px" id="ddlTwoLesson">
 <option selected="selected" value="0">请选择</option>
 <option value="一级建造师">一级建造师</option>
 </select>
 <select style="width:100px" id="ddlThreeLesson">
 <option selected="selected" value="0">请选择</option>
 <option value="建设工程经济">建设工程经济</option>
 </select>
 <select style="width:80px" id="ddlClass">
 <option selected="selected" value="0">请选择</option>
 <option value="精讲班">精讲班</option>
 </select>
 
 <span style="display: none" class="lesson">请选择考试类别</span>
 </td>
 <td width="15">&nbsp;</td>
</tr>
</tbody>
</table>
</li>
<li style="_margin-top:-20px;*+margin-top:-20px;">
<dl>
<dd>请输入咨询内容：</dd>
<dt style="position:relative">
<textarea class="input_03" style="padding-top:5px;" id="tscontent"></textarea>
</dt>
<dd id="contentInfo" style="padding-left:130px;color:red;display:none">请输入咨询内容（至少10个字）</dd>
</dl>
</li>
<li class="pic_2_01 center">
<input type="image" src="../images/pic_29.gif" id="addts" name="add" onclick="add();"/>
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
