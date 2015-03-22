<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>讲义</title>
<link href="../css/lessonplay.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
</head>
<body onkeydown="if (event.ctrlKey||event.altKey||event.shiftKey){event.keyCode=37;event.returnValue=false;}" onSelectStart="return(false)" oncontextmenu="return(false)" oncopy="return false;" oncut="return false;">
<div id="conten">
<div id="ArticleCnt" style="font-size:14px;">
<s:iterator value="lectureList" var="lect">
<a name="part${lect.lectId}"></a>
<div id="part_${lect.lectId}"  class="conU" style="tskclass;cursor:pointer;border:1px solid white;" title="双击跳到本段播放" onmouseover="nodeShow('knowledge_${lect.lectId}');this.style.backgroundColor=parent.getColor()" onmouseout="nodeHidden('knowledge_${lect.lectId}');this.style.backgroundColor=''" onDblClick="parent.mdDbClick(${lect.lectId},${lect.lectTimePoint});//parent.mdJumpPlay(0)">
<div>
<table width="100%" border="0">
	<tr>
		<td width="98%"><h4>${lect.lectTitle}</h4></td>
		<td align="right" width="1%"><img id="doing_${lect.lectId}" src="../images/wait.gif" width="85" height="25" /></td>
		<td width="1%">
			<div id="knowledge_${lect.lectId}" class="cNote">
				<a href="/member/addNewQuestion?examId=${examId}&gradeId=${gradeId}&classId=${classId}" target="_blank"><img src="../images/question.gif" width="123" height="25" /></a>
			</div>
		</td>
	</tr>
</table>
</div>
</div>
	${lect.lectContent}
<div>
</div>
</s:iterator>	
</div>
</div>
</body>
</html>

