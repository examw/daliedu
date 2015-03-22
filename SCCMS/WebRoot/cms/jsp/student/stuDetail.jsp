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
<table width="70%" border="0" cellpadding="0" cellspacing="0" align="center">
 <tr>
    <td valign="top">
		<table width="80%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
		 <tr bgcolor="#FFFFFF"> 
		 	<td height="35" colspan="3" style="color:#000000;font-weight:bold;" bgcolor="#CDE2FC" align="center">详细信息</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="120" height="30"> 
              <div align="center">用户名</div></td>
            <td height="30" colspan="3">${stu.stuUsername }</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">真实姓名</div></td>
            <td height="30" colspan="3"><s:if test="stu.stuName!=null||stu.stuName!=''">${stu.stuName}</s:if><s:else><span style="color:red;">尚未填写</span></s:else></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">手机号码</div></td>
		 <td height="30" colspan="3"><s:if test="stu.stuMobile!=null||stu.stuMobile!=''">${stu.stuMobile}</s:if><s:else><span style="color:red;">尚未填写</span></s:else></td>
          </tr>			
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">用户邮箱</div></td>
            <td height="30" colspan="3">${stu.stuEmail }</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">注册时间</div></td>
            <td height="30" colspan="3"> <fmt:formatDate value="${stu.stuAddTime }" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></td>
          </tr>
           <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">地区</div></td>
            <td height="30" colspan="3">${stu.stuArea }</td>
          </tr>
           <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">考试</div></td>
            <td height="30" colspan="3">${stu.stuExam }</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">上一次登录时间</div></td>
            <td height="30" colspan="3"> <fmt:formatDate value="${stu.stuLastLoginTime }" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></td>
          </tr>                              
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">地址</div></td>
            <td height="30" colspan="3"><s:if test="stu.stuPAddr!=null&&stu.stuPAddr!=''">${stu.stuPAddr}</s:if><s:else><span style="color:red;">尚未填写</span></s:else></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">用户设备号</div></td>
            <td height="30" colspan="3">${stu.deviceIds }</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center">允许登录设备个数</div></td>
            <td height="30" colspan="3">${stu.deviceNum }</td>
          </tr>
           <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center"><strong style="color:#F00">账户信息</strong></div></td>
            <td height="30">现金券: <font color="#FF0000">${stu.stuCash }元</font> </td>
            <td>学习卡: <font color="#FF0000">${stu.stuCard }元</font></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="30"> 
              <div align="center"><strong style="color:#F00">操作</strong></div></td>
            <td height="30"> <a href="${pageContext.request.contextPath}/order/loadForModifyCash?stuId=${stu.stuId }"><strong style="color:#00C">充值现金券</strong></a></td>
            <td ><a href=""><strong style="color:#00C">充值学习卡</strong></a></td>
          </tr>    
       	<tr bgcolor="#FFFFFF" > 
            <td height="30" colspan="3" align="center">
            	<input type="button" value="关闭" onclick="parent.tab.removeTabItem('stuDetail');"/>
            </td>
          </tr>
	  </table>
	</td>
  </tr>
</table>
</body>
</html>
