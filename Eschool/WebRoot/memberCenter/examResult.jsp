<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<title>${paper.paperName }</title>
<META HTTP-EQUIV="Window-target" CONTENT="_top">
<style type="text/css"> 
body {background-color: #a1a1a1;margin: 20px 0 20px 0;	font-size: 12px; text-align:center;}
.main{background-color: #FFFFFF;width: 830px;margin: 0 auto}
.contentcenter{padding:0px; margin: 22px 27px 5px 27px; font-size: 12px;line-height: 20px;text-align: center;color: #000000;}
.title {font-family: Arial, Helvetica, sans-serif, "新宋体";font-size: 18px;font-weight: bold;color: #ff0000;line-height: 30px;}
.btn {height:24px; padding:2px 2 0 2; border:1px solid #34a7db; background:url(../images/input_bg3.jpg);  font-size:12px; color:#000; cursor:pointer;}
.btn1 {height:24px; padding:2px 2 0 2; border:1px solid #dea303; background:url(../images/input_bg3_.jpg); font-size:12px;color:#000;cursor:pointer;}
.menu {background-color:#f7f7f7; line-height:22px; text-align:center; padding:5px;position: absolute;width:105px;top:100px;visibility: visible;z-index: 1; border: green 1px solid;}
.SubmitShow{ margin:3px 0 3px 0; padding:3px 0 3px 0;}
.SubmitHidden{ display:none;}
</style>
</head>
<body>
<div class="main">
<div style="width:195px; float:left;margin-top:27px" ><img src="../images/d_1.jpg" width="195" height="92" /></div>
<div style="border-bottom:#000000 solid 1px; height:41px;float:left; width:554px;padding-top:45px; padding-bottom:10px; text-align:center">考试时间：${paper.paperTime } 分钟 &nbsp; 考生：${student.stuUsername }&nbsp; 总分 ：${paper.paperScore } 分 </div>
<div style="height:92px; float:right; width:81px;;margin-top:27px"><img src="../images/d_2.jpg" width="81" height="92" /></div>
<div class="contentcenter">
<span class="title">${paper.paperName }</span><br />
<br />
<br />
<div align="center">
<table width="500" border="0" cellspacing="1" cellpadding="0" style="text-align:center; background-color:#6633FF;">
  <tr bgcolor="#FFFFFF" height="40">
    <td colspan="4"><strong>${student.stuUsername }</strong>最近一次考试情况表</td>
    </tr>
  <tr bgcolor="#FFFFFF" height="30">
    <td width="30%">试卷总分</td>
    <td width="20%">${paper.paperScore }分</td>
    <td width="30%">考生得分</td>
    <td width="20%"><font color="red"><strong>${record.rcdScore }</strong></font> 分</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="30">
    <td>考试时间</td>
    <td>${paper.paperTime }分钟</td>
    <td>考生用时</td>
    <td><font color="red"><strong>${record.useTime }</strong></font> 分钟</td>
  </tr>
 <tr bgcolor="#FFFFFF" height="30">
    <td>参考人数</td>
    <td>${examNumbers }人</td>
    <td>成绩排行</td>
    <td>第 <font color="red"><strong>${rank }</strong></font> 名</td>
  </tr> 
  <tr bgcolor="#FFFFFF" height="30">
    <td colspan="4">各大题得分情况(共&nbsp;${ruleSize }&nbsp;道大题)</td>
  </tr>
  <s:iterator value="ruleList" var="r" status="no">
<tr bgcolor="#ffffff" height="30">
<td align="center" bgcolor="#f3f3f3" colspan="2"> 第${no.index+1}大题：${r.title }</td>
<td align="center" bgcolor="#f3f3f3" colspan="2"><strong>${r.userScore }</strong> 分</td>
</tr>
</s:iterator>
</table>
</div><br />
<div align="center">
<br>
<button onClick="operate('/member/showPaper','withAnswer');" class=btn onMouseOver="this.className = 'btn1';" onMouseOut="this.className = 'btn';">查看试卷详情</button>&nbsp;&nbsp;
<button onClick="operate('/member/showRank','')" class=btn onMouseOver="this.className = 'btn1';" onMouseOut="this.className = 'btn';">查看成绩排行</button>&nbsp;&nbsp;
<button onClick="operate('/member/loadPaper','retry')" class=btn onMouseOver="this.className = 'btn1';" onMouseOut="this.className = 'btn';">重做此卷</button>&nbsp;&nbsp;
<button class=btn1 onClick="window.location='/member/center';" onMouseOver="this.className = 'btn';" onMouseOut="this.className = 'btn1';">返回个人中心</button></div><br />&nbsp;&nbsp;
<br />
<br />
</div>
</div>
</body>
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../artDialog/jquery.artDialog.js?skin=blue"></script>
<script type="text/javascript">
	var paperID = ${paper.paperId};
	function operate(action,actionFlag)
	{
		if(actionFlag=='retry')
		{
			var r = confirm('重做提交后会覆盖以前的记录，是否继续？');
			if(!r)
			{
				return;
			}
		}
		location = action+"?paperId=${paper.encodeId}&actionFlag="+actionFlag;
	}
</script>
</html>
