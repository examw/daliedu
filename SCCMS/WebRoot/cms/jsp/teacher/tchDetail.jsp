<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容窗口</title>
<style type="text/css"> 
<!--
.Menu {
	font-size: 15px;
	font-style: normal;
	line-height: 1.5;
	color: #052999;
	background:#EFEFEF;
	cursor:auto;
	text-decoration: underline;
}
a:link,a:visited{
 text-decoration:none;  /*超链接无下划线*/
}
a:hover{
 text-decoration:underline;  /*鼠标放上去有下划线*/
}
-->
</style>
</head>
<body topmargin="0" leftmargin="0">
<table width="60%" border="0" cellpadding="0" cellspacing="0" align="center">
 <tr>
    <td valign="top"><br><br>
		<table width="80%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
		 <tr bgcolor="#FFFFFF"> 
		 	<td height="35" colspan="3" style="color:#000000;font-weight:bold;" bgcolor="#CDE2FC" align="center">${stu.stuName }教师详细信息</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="120" height="30"> 
              <div align="center">用户名</div></td>
            <td height="30" colspan="1">${teacher.tchUsername}</td>
            <td rowspan="4" style="width:240px" align="center"><img src="${teacher.tchImgUrl }" alt="暂无相片"></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">用户密码</div></td>
            <td height="30" colspan="1"> ${teacher.tchPassword }</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">真实姓名</div></td>
            <td height="30" colspan="1">${teacher.tchName }</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">手机号码</div></td>
		 <td height="30" colspan="1">${teacher.tchPhone }</td>
          </tr>		
		
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">所教课程</div></td>
            <td height="30" colspan="2">${teacher.tchLessons }</td>
          </tr>
		 
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">注册时间</div></td>
            <td height="30" colspan="2"> <fmt:formatDate value="${teacher.tchAddTime }" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">描述</div></td>
            <td height="30" colspan="2">${teacher.tchDescription }</td>
          </tr>                              
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">状态</div></td>
            <td height="30" colspan="2">${teacher.status } </td>
          </tr>
       	<tr bgcolor="#FFFFFF"> 
            <td height="30" colspan="3" align="center">
            	<input type="button" value="关闭" onclick="parent.closeTab('teacherDetail')"/>
            </td>
          </tr>
	  </table>
	</td>
  </tr>
</table>
</body>
</html>
