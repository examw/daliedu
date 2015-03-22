<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学习计划  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">
	.pageclass{cursor:pointer}
</style>
<script language="javascript" src="../js/jquery-1.4.3.js"></script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="#">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">学习计划</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li ><a href="./StudyPlan.jsp">学习计划</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
<table width="685" border="0" cellspacing="0" cellpadding="0" class="text_tb">
            <tr>
                <td width="411" height="24" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a">
                    <strong>学习计划</strong>
                </td>
                <td width="105" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a">
                    <strong>评分</strong>
                </td>
                <td width="153" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a">
                    <strong>发布时间</strong>
                </td>
                <td width="109" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a">
                    <strong>评价</strong>
                </td>
            </tr>
            
        </table>
 <div class="fy"><div class="emptyDiv2"><span class="no"></span></div></div> 

</div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
