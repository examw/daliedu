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
		 	<td height="35" colspan="4" style="color:#000000;font-weight:bold;" bgcolor="#CDE2FC" align="center">试题详情</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">所属试卷名称</div></td>
            <td height="30" colspan="3">${paperName }</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">所属大题名称</div></td>
            <td height="30" colspan="3">${rule.title }</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">题型</div></td>
            <td height="30">${question.type }</td>
            <td height="30"> 
              	添加时间</td>
            <td height="30"><fmt:formatDate value="${question.questAddTime }" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30" colspan="4"> 
              <div align="center">问题内容</div></td>
           </tr>  
            <tr bgcolor="#FFFFFF"> 
            <td height="30" colspan="4"> 
              <div align="left" style="margin:5px 15px">${question.formatString }</div></td>
           </tr>                              
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">正确答案</div></td>
            <td height="30" colspan="3">${question.questAnswer } </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center"><strong style="color:#F00">答案解析</strong></div></td>
            <td height="30"  colspan="3">${question.questAnalysis } </td>
          </tr>
       	<tr bgcolor="#FFFFFF"> 
            <td height="30" colspan="4" align="center">
            	<input type="button" value="关闭" onclick="parent.closeTab('questDetail')"/>
            </td>
          </tr>
	  </table>
	</td>
  </tr>
</table>
</body>
</html>
