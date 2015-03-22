<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${paper.paperName }</title>
    <meta content="_top" http-equiv="Window-target">
    <link href="${pageContext.request.contextPath}/cms/css/ExamStyle_css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
	body {background-color: #a1a1a1;margin: 20px 0 20px 0;    font-size: 12px; text-align:center;}
    .main,.main1{background-color: #FFFFFF;width: 830px;margin: 0 auto}
    .contentcenter{padding:0px; margin: 22px 27px 5px 27px; font-size: 12px;line-height: 20px;text-align: center;color: #000000; clear:both}
    .title {font-family: Arial, Helvetica, sans-serif, "新宋体";font-size: 18px;font-weight: bold;color: #ff0000;line-height: 30px;}
    .btn {height:24px; padding:2px 2 0 2; border:1px solid #34a7db; background:url(${pageContext.request.contextPath}/cms/images/paper/input_bg3.jpg);  font-size:12px; color:#000; cursor:pointer;}
    .btn1 {height:24px; padding:2px 2 0 2; border:1px solid #dea303; background:url(${pageContext.request.contextPath}/cms/images/paper/input_bg3_.jpg); font-size:12px;color:#000;cursor:pointer;}
    .menu {background-color:#f7f7f7; line-height:22px; text-align:center; padding:5px;position: absolute;width:105px;top:100px;visibility: visible;z-index: 1; border: green 1px solid;}
    .SubmitShow{ margin:3px 0 3px 0; padding:3px 0 3px 0;}
    .SubmitHidden{ display:none;}
    </style>
    <script language="javascript" src="${pageContext.request.contextPath}/cms/js/jquery-1.4.3.js"></script>
</head>
<body>
    <div class="main">
        <div style="width:195px; float:left;margin-top:27px"><img height="92" src=
        "${pageContext.request.contextPath}/cms/images/paper/d_1.jpg" width="195"></div>

        <div style=
        "border-bottom:#000000 solid 1px; height:41px; width:554px;float:left; padding-top:45px; padding-bottom:10px; text-align:center">
        考试时间：${paper.paperTime } 分钟 &nbsp; 考生：username&nbsp; 总分 ：${paper.paperScore } 分
        </div>

        <div style="height:92px; float:right;margin-top:27px; width:81px;"><img height="92"
        src="${pageContext.request.contextPath}/cms/images/paper/d_2.jpg" width="81"></div>

        <div class="contentcenter">
            <span class="title">${paper.paperName }</span>

            <div style="text-align: center">
                试题提供：中华考试网&nbsp;&nbsp;2012-12-14 16:57:05 已经有 4 人做过此试卷
            </div>${ruleList.size() }
        </div><input id="selectid" type="hidden" value="${ruleList[0].ruleId }"><input id=
        "StateTF" type="hidden" value="1"><input id="LastTime" name="LastTime"
        type="hidden" value="${paper.paperTime }">
        <div style="height:28px;margin-bottom:5px;">
        	<s:iterator value="ruleList" var="rule" status="no">
        	<input type="hidden" id="input_${rule.ruleId }" value="${rule.ruleId }">
        	<input type="hidden" id="input_title${rule.ruleId }" value="${rule.fullTitle }">
        	<s:if test="#no.index==0">
        	<input type="hidden" id="qnum_${no.index}" name="qnum_${no.index}" value="${rule.ruleQuestionNum }">
        	<button class="btn1" id="c${rule.ruleId }" onclick="changeDiv(${rule.ruleId},${no.index })"
            onmouseout="MouseEvent(0,this,1)" onmouseover=
            "MouseEvent(1,this,1)">${rule.title }</button>&nbsp;
            </s:if>
            <s:else>
            <input type="hidden" id="qnum_${rule.ruleId }" name="qnum_${no.index }" value="${rule.ruleQuestionNum }">
            <button class="btn" id="c${rule.ruleId }" onclick=
            "changeDiv(${rule.ruleId },${no.index })"
            onmouseout="MouseEvent(0,this,1)" onmouseover=
            "MouseEvent(1,this,1)">${rule.title }</button>&nbsp;
            </s:else>
        	</s:iterator>
        </div>
        <!-- <iframe frameborder="0" height="700" id="content" name="content"
        onload="javascript:{dyniframesize('content');}" scrolling="no" src=
        "Content1.asp?PaperID=7753&amp;RulesID=31167&amp;StateTF=1" width=
        "100%"></iframe> -->
		    <form action="${pageContext.request.contextPath}/paper/submitPaper" id="examda" method="post" name="examda">
		    <input type="hidden" name="paperId" value="${paper.paperId }">
			<input type="hidden" id="startTime" name="startTime">
			<input type="hidden" id="endTime" name="endTime">
			<input type="hidden" id="endTime" name="endTime">
		<div id="bigTi">
        <div class="main1" id="ruleDiv${ruleList[0].ruleId }">
            <div class="RulesTitle">
                ${ruleList[0].fullTitle } 
            </div>
            <div id="problems${ruleList[0].ruleId }"></div>
		</div>
		</div>
		</form>
        <div class="menu" id="mymenu" style="position: fixed; right: 100px; cursor: pointer;">
            答题剩余时间

            <div id="lastTime" style=
            " background-color:#FFCC00;HEIGHT: 20px; text-align:center; color:red; font-size:14px;">
            120:00
            </div>

            <div class="SubmitShow" id="ExamSubmit2">
                <input class="btn1" name="submit1" onclick=""
                style="CURSOR: hand" type="submit" value="完成答卷">
            </div>

            <div class="SubmitHidden" id="ExamSubmit3">
                <input class="btn1" name="submit2" onclick="ExamSubmit(3);"
                style="CURSOR:pointer;" type="submit" value="确认交卷">
            </div>

            <div class="SubmitHidden" id="ExamSubmit4">
                <input class="btn1" name="submit3" onclick=
                "document.frames['content'].SearchScore();" style="width:70px;"
                type="submit" value="查看分数表">
            </div>
        </div>

        <div style="height:28px;margin-bottom:5px;">
        	<s:iterator value="ruleList" var="rule" status="no">
        	<s:if test="#no.index==0">
        	<button class="btn1" id="s${rule.ruleId }" onclick="changeDiv(${rule.ruleId})"
            onmouseout="MouseEvent(0,this,0)" onmouseover=
            "MouseEvent(1,this,0)">${rule.title }</button>&nbsp;
            </s:if>
            <s:else>
            <button class="btn" id="s${rule.ruleId }" onclick=
            "changeDiv(${rule.ruleId })"
            onmouseout="MouseEvent(0,this,0)" onmouseover=
            "MouseEvent(1,this,0)">${rule.title }</button>&nbsp;
            </s:else>
        	</s:iterator>
        </div>
    </div>
    <script language="javascript">
    var timer,startTime;
var examTimer=Number($("#LastTime").val())*60;
var lastSecond,lastMinute;
if("${rcdId}"==0)
{
	timer=setInterval("showtime()",1000);
}
function showtime(){  
	examTimer--;
	if (examTimer<=0){
  		document.getElementById('lastTime').innerHTML="0：00";
		clearInterval(timer);
		//时间到了交卷
		var endTime = new Date().setTime(startTime.getTime()+120*60*1000);
		$("#endTime").val(endTime.toLocaleString());
		$("#examda").submit();
	}
	else{
		lastSecond=examTimer % 60;
		lastMinute=(examTimer-lastSecond)/60;
		
		document.getElementById('lastTime').innerHTML=lastMinute + "：" + (lastSecond<10?"0"+lastSecond:lastSecond);
	}
}
    	$(function(){
    		startTime = new Date();
    		$("#startTime").val(startTime.toLocaleString());
    		$("#selectid").val("${ruleList[0].ruleId }");
    		if("${rcdId}"==0)
			$("#problems${ruleList[0].ruleId }").load("${pageContext.request.contextPath}/paper/qListOfRule?ruleId="+Number($("#selectid").val()));
			else
			$("#problems${ruleList[0].ruleId }").load("${pageContext.request.contextPath}/paper/qListOfRule2?rcdId=${rcdId}&ruleId="+Number($("#selectid").val()));
    	});
function MouseEvent(N,Obj,up){
	var sid = document.getElementById('selectid').value;
	if(up==1){
	if (N == 1){
			$(Obj).addClass('btn1');
		}
	else{
			$(Obj).removeClass('btn1');
			$(Obj).addClass('btn');
			document.getElementById("c"+sid).className = 'btn1';
		}
	}else
	{
		if (N == 1){
			Obj.className = 'btn1';
		}
		else{
			Obj.className = 'btn';
			document.getElementById("s"+sid).className = 'btn1';
		}
	}
}
function paperSubmit()
{
	var r = confirm("确认交卷?");
	if(r)
	{
		$("#endTime").val(new Date().toLocaleString());
		$("#examda").submit();
	}
}
function changeDiv(rid,no)
{
	//1,切换样式，2添加并切换内容
	//1
	$("#selectid").val(rid);
	$("button").siblings(".btn1").removeClass('btn1');
	$("button").addClass("btn");
	$("#c"+rid).addClass('btn1');
	$("#s"+rid).addClass('btn1');
	//2
	if($("#ruleDiv"+rid).html())//表示存在
	{
		$("div .main1").hide();
		$("#ruleDiv"+rid).show();
	}else
	{
		$div = $('<div class="main1" id="ruleDiv'+rid+'"><div class="RulesTitle">'+$("#input_title"+rid).val()+'</div><div id="problems'+rid+'"></div></div>');
		$("div .main1").hide();
		$("#bigTi").append($div);
		var pnum = 0;
		if(no>0)
		{
			for(var i =0;i<no;i++)
			{
				pnum = pnum+Number($("#qnum_"+i).val());
			}
		}
		var textareanum = $("textarea").length;
		$("#problems"+rid).load("${pageContext.request.contextPath}/paper/qListOfRule?ruleId="+rid+"&qNum="+pnum+"&textareaNum="+textareanum);
	}
}
</script>
</body>
</html>
