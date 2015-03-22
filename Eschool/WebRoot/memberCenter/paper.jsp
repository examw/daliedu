<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>${paper.paperName }</title>
    <meta content="_top" http-equiv="Window-target">
    <link href="../css/ExamStyle_css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
	body {background-color: #a1a1a1;margin: 20px 0 20px 0;    font-size: 12px; text-align:center;}
    .main,.main1{background-color: #FFFFFF;width: 830px;margin: 0 auto;zoom:1}
    .contentcenter{padding:0px; margin: 22px 27px 5px 27px; font-size: 12px;line-height: 20px;text-align: center;color: #000000; clear:both}
    .title {font-family: Arial, Helvetica, sans-serif, "新宋体";font-size: 18px;font-weight: bold;color: #ff0000;line-height: 30px;}
    .btn {height:24px; padding:2px 2 0 2; border:1px solid #34a7db; background:url(../images/input_bg3.jpg);  font-size:12px; color:#000; cursor:pointer;}
    .btn1 {height:24px; padding:2px 2 0 2; border:1px solid #dea303; background:url(../images/input_bg3_.jpg); font-size:12px;color:#000;cursor:pointer;}
    button:hover{height:24px; padding:2px 2 0 2; border:1px solid #dea303; background:url(../images/input_bg3_.jpg); font-size:12px;color:#000;cursor:pointer;}
    .menu {background-color:#f7f7f7; line-height:22px; text-align:center; padding:5px;position: absolute;width:105px;top:100px;visibility: visible;z-index: 1; border: green 1px solid;}
    .SubmitShow{ margin:3px 0 3px 0; padding:3px 0 3px 0;}
    .SubmitHidden{ display:none;}
    .cRed{color:red}
	.Ttimex1{margin:0 auto;background-color:#DDF1FA;padding:10px;align:center;width: 810px; position:relative;position:fixed;z-index:999;}    
    </style>
    <script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
     <script language="javascript" src="../js/dateformat.js"></script>
    <script type="text/javascript" src="../artDialog/jquery.artDialog.js?skin=blue"></script>
    <script type="text/javascript">
    var answerStr='answers',textareaStr='';
    </script>
</head>
<body>
<script type="text/javascript">
if(!"${paper}")
{
	alert("请重新发送请求");
	location="/member/center";
}
var tempAnswer = "${tempAnswer}";
if(tempAnswer)
{
	var r1 = confirm('检测到以前未提交的答案，确定沿用此答案？取消为不沿用');
	if(r1)
	{
		answerStr = tempAnswer.split("   ")[0];
		textareaStr = "   "+tempAnswer.substring(tempAnswer.indexOf("   ")+3, tempAnswer.length);
		if(!$.trim(textareaStr)) textareaStr='';
	}
}	
</script>
	<!-- ie 用这个 -->
   	 <div class="Ttimex1" id="ie_head" style="display:none"><span>全卷已做 <strong id="MyExamNum" class="cRed">0</strong> 题 / 共 <span id="totalNum">${totalNum }</span> 题&nbsp;&nbsp;剩余 <strong id="ElseExamNum" class="cRed">${totalNum }</strong> 题未作答&nbsp;&nbsp;
        	全卷标记&nbsp;<strong id="MarkedNum" class="cRed">0</strong>&nbsp;个</span>
        <span style="position:absolute; right:10px">
        <s:if test="rcdId!=0"><a href="javascript:;" onclick="history.back(-1)">返回</a></s:if>
        <s:else><a href="javascript:;" onclick="saveAnswers(2)" style="margin-right:10px;">保存答案</a></s:else>
        </span>
    </div>
    <div class="main">
    <!-- 其他用这个 -->
	<div class="Ttimex1" id="fie_head" style="display:none"><span>全卷已做 <strong id="MyExamNum" class="cRed">0</strong> 题 / 共 <span id="totalNum">${totalNum }</span> 题&nbsp;&nbsp;剩余 <strong id="ElseExamNum" class="cRed">${totalNum }</strong> 题未作答&nbsp;&nbsp;
        	全卷标记&nbsp;<strong id="MarkedNum" class="cRed">0</strong>&nbsp;个</span>
        <span style="position:absolute; right:10px">
        <s:if test="rcdId!=0"><a href="javascript:;" onclick="history.back(-1)">返回</a></s:if>
        <s:else><a href="javascript:;" onclick="saveAnswers(2)" style="margin-right:10px;">保存答案</a></s:else>
        </span>
    </div>
<div style="width:195px; float:left;margin-top:27px" ><img src="../images/d_1.jpg" width="195" height="92" /></div>
<div style="border-bottom:#000000 solid 1px; height:41px;float:left; width:554px;padding-top:45px; padding-bottom:10px; text-align:center">考试时间：${paper.paperTime } 分钟 &nbsp; 考生：${student.stuUsername }&nbsp; 总分 ：${paper.paperScore } 分 </div>
<div style="height:92px; float:right; width:81px;;margin-top:27px"><img src="../images/d_2.jpg" width="81" height="92" /></div>
       <div class="contentcenter">
            <span class="title">${paper.paperName }</span>

<%--             <div style="text-align: center">
                试题提供：中华考试网&nbsp;&nbsp;2012-12-14 16:57:05 已经有 4 人做过此试卷
            </div>${ruleList.size() } --%>
        </div><input id="selectid" type="hidden" value="${ruleList[0].ruleId }"><input id=
        "StateTF" type="hidden" value="1"><input id="LastTime" name="LastTime"
        type="hidden" value="${paper.paperTime }">
        <div style="height:28px;margin-bottom:5px;">
        	<s:iterator value="ruleList" var="rule" status="no">
        	<input type="hidden" id="input_${rule.ruleId }" value="${rule.ruleId }">
        	<input type="hidden" id="input_title${rule.ruleId }" value="${rule.fullTitle }">
        	<input type="hidden" id="input_score${rule.ruleId }" value="${rule.userScore }">
        	<s:if test="#no.index==0">
        	<input type="hidden" id="qnum_${no.index}" name="qnum_${no.index}" value="${rule.ruleQuestionNum }">
        	<button class="btn1" id="c${rule.ruleId }" onclick="changeDiv(${rule.ruleId},${no.index })"
            onmouseout="MouseEvent(0,this,1)" onmouseover=
            "MouseEvent(1,this,1)">${rule.title }(<span id="dnum${rule.ruleId }">0</span>|${rule.ruleActualAddNum })</button>&nbsp;
            </s:if>
            <s:else>
            <input type="hidden" id="qnum_${no.index}" name="qnum_${no.index }" value="${rule.ruleQuestionNum }">
            <button class="btn" id="c${rule.ruleId }" onclick=
            "changeDiv(${rule.ruleId },${no.index })"
            onmouseout="MouseEvent(0,this,1)" onmouseover=
            "MouseEvent(1,this,1)">${rule.title }(<span id="dnum${rule.ruleId }">0</span>|${rule.ruleActualAddNum })</button>&nbsp;
            </s:else>
        	</s:iterator>
        </div>
        <!-- <iframe frameborder="0" height="700" id="content" name="content"
        onload="javascript:{dyniframesize('content');}" scrolling="no" src=
        "Content1.asp?PaperID=7753&amp;RulesID=31167&amp;StateTF=1" width=
        "100%"></iframe> -->
		    <form action="/member/submitPaper" id="examda" method="post" name="examda">
		    <input type="hidden" name="paperId" value="${paper.paperId }">
		    <input type="hidden" name="rcdId" value="${rcdId }">
			<input type="hidden" id="startTime" name="startTime">
			<input type="hidden" id="endTime" name="endTime">
			<textarea style="display:none" id="answers" name="answers"></textarea>
		<div id="bigTi">
        <div class="main1" id="ruleDiv${ruleList[0].ruleId }">
            <div class="RulesTitle">
                ${ruleList[0].fullTitle } 
            </div>
            <s:if test="rcdId!=0">
            <div class="RulesTitle" style="text-align:center">本大题总得分 <strong style="color:#e00">${ruleList[0].userScore }</strong> 分</div>
            </s:if>
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
			<s:if test="rcdId!=0">
				<div class="SubmitShow" id="ExamPause">
                <input class="btn1" name="submit" onclick="location='/member/loadPaper?paperId=${paper.encodeId}'" input_status="1"
                style="CURSOR: hand" type="submit" value="查看成绩">
                </div>
				<div class="SubmitShow" id="ExamSubmit2">
                <input class="btn1" name="submit1" onclick="location='/member/center'"
                style="CURSOR: hand" type="submit" value="个人中心">
            </div>
			</s:if>
			<s:else>
				<div class="SubmitShow" id="ExamPause">
                <input class="btn1" name="submit" onclick="examPause()" input_status="1"
                style="CURSOR: hand" type="submit" value="暂停">
            </div>
				<div class="SubmitShow" id="ExamSubmit2">
                <input class="btn1" name="submit1" onclick="paperSubmit(2);"
                style="CURSOR: hand" type="submit" value="完成答卷">
            </div>
			</s:else>
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

        <div style="height:28px;margin-top:10px;margin-bottom:5px;">
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
    var timer,startTime,keepConnectTimer;markCount=0;
    var PaperID=${paper.paperId};
var examTimer=Number($("#LastTime").val())*60;
var lastSecond,lastMinute;
if("${rcdId}"==0)
{
	timer=setInterval("showtime()",1000);
	keepConnectTimer = setInterval("keepConnect()",1000*60*15-1); //每隔十五分钟发一次
}
function examPause()
{
	//销毁timer
	clearInterval(timer);
	$("#endTime").val(new Date().toLocaleString());
	saveAnswers(1);
	MyDialog = art.dialog({id:"MyDialog",lock:true,cancel:false,content:"您已暂停作答",width:400,button:[{name:"继续作答",callback: function () {
			timer=setInterval("showtime()",1000);
	}}]});
}
function showtime(){  
	examTimer--;
	if (examTimer<=0){
  		$("#lastTime").html("0：00");
		clearInterval(timer);clearInterval(keepConnectTimer);
		//时间到了交卷
		var endTime = new Date().setTime(startTime.getTime()+120*60*1000);
		$("#endTime").val(endTime.toLocaleString());
		$("#answers").val(answerStr);
		$("#examda").submit();
	}
	else{
		lastSecond=examTimer % 60;
		lastMinute=(examTimer-lastSecond)/60;
		$("#lastTime").html(lastMinute + "：" + (lastSecond<10?"0"+lastSecond:lastSecond));
	}
}
function keepConnect()
{
	/* $.ajax({
		async:true,
		url:"../member/keepConnection",
		dataType:'json',
		success:function(data){},
		error:function(){}
	}); */
	saveAnswers(1);
}
    	$(function(){
    		if ($.browser.msie) {
    			$("#ie_head").show();$("#fie_head").remove();
				$('input:checkbox').click(function () {
				this.blur();
				});
				$('input:radio').click(function () {
				this.blur();
				});
			}else{$("#fie_head").show();$("#ie_head").remove();}
    		startTime = new Date();
    		$("#startTime").val(startTime.format("yyyy-MM-dd hh:mm:ss"));
    		$("#selectid").val("${ruleList[0].ruleId }");
    		var answers1 = answerStr.split("&");	//以前的答案
    		var answers2 = textareaStr.split("   ");
			//初始化已做题目数量
			$("#MyExamNum").html(answers1.length-1+answers2.length-1);
			$("#ElseExamNum").html(Number("${totalNum}")-Number($("#MyExamNum").html()));
    		if("${rcdId}"==0)
			$("#problems${ruleList[0].ruleId }").load("/member/qListOfRule?ruleId="+Number($("#selectid").val()),function(){
			//以前做过的题目，初始化选项【问答题除外】
			for(var k=1;k<answers1.length;k++)
			{
				var a = answers1[k].split("-");
				var b = a[2].split(",");
				$("#dnum"+a[0]).html(Number($("#dnum"+a[0]).html())+1);//每大题实际完成数
				for(var p=0;p<b.length;p++)
				{
					var e = $("input[name='List_Select"+a[1]+"'][value='"+b[p]+"']");
					e.attr("checked",true);
					e.parent().addClass('input_select1');
				}
			}
			for(var k=1;k<answers2.length;k++)	//简答题
			{
				var a = answers2[k].split("-");
				$("#dnum"+a[0]).html(Number($("#dnum"+a[0]).html())+1);//每大题实际完成数
				$("textarea[qid="+a[1]+"]").val(a[2]);
			}
			});
			else
			$("#problems${ruleList[0].ruleId }").load("/member/qListOfRule2?rcdId=${rcdId}&ruleId="+Number($("#selectid").val()),function(){
				$("#dnum${ruleList[0].ruleId }").html($("#count${ruleList[0].ruleId }").val());
			});
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
		$("#endTime").val(new Date().format("yyyy-MM-dd hh:mm:ss"));
		$("#answers").val(answerStr);
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
		if("${rcdId}"!=0)//包含答案的
		{
			$div = $('<div class="main1" id="ruleDiv'+rid+'"><div class="RulesTitle">'+$("#input_title"+rid).val()+'</div><div class="RulesTitle" style="text-align:center">本大题总得分 <strong style="color:#e00">'+$("#input_score"+rid).val()+'</strong> 分</div><div id="problems'+rid+'"></div></div>');
		}else
		{
			$div = $('<div class="main1" id="ruleDiv'+rid+'"><div class="RulesTitle">'+$("#input_title"+rid).val()+'</div><div id="problems'+rid+'"></div></div>');
		}
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
		var textareanum = $("textarea").length-1;
		if("${rcdId}"==0)
		$("#problems"+rid).load("/member/qListOfRule?ruleId="+rid+"&qNum="+pnum+"&textareaNum="+textareanum,function(){
			var answers1 = answerStr.split("&");	//以前的答案
    		var answers2 = textareaStr.split("   ");
			//以前做过的题目，初始化选项【问答题除外】
			for(var k=1;k<answers1.length;k++)
			{
				var a = answers1[k].split("-");
				var b = a[2].split(",");
				for(var p=0;p<b.length;p++)
				{
					var e = $("input[name='List_Select"+a[1]+"'][value='"+b[p]+"']");
					e.attr("checked",true);
					e.parent().addClass('input_select1');
				}
			}
			for(var k=1;k<answers2.length;k++)	//简答题
			{
				var a = answers2[k].split("-");
				$("textarea[qid="+a[1]+"]").val(a[2]);
			}
		});
		else
		$("#problems"+rid).load("/member/qListOfRule2?rcdId=${rcdId}&ruleId="+rid+"&qNum="+pnum+"&textareaNum="+textareanum,function(){
				$("#dnum"+rid).html($("#count"+rid).val());
			});
	}
}
//手动保存答案
function saveAnswers(end)
{
	if(answerStr=='answers'&&textareaStr=='')	//没答案
	{
		if(end==2)
		{
			notice("您还没有开始做",2);
		}
		return;
	}
	if((answerStr.split("&").length)%6==0||(end>0))
	{
		$.ajax({
				type: "POST",
				url: "../member/saveAnswer",
				data: {"optionAnswer":answerStr,"contentAnswer":textareaStr,"paperId":PaperID},
				dataType: 'json',
				success: function (result) {
					if(result){
						if(end==2){notice("保存成功",1);	}
					}
				},
				error: function (e) {if(end==2){notice("保存失败，稍后再试",1);}}	,
				async:true,
				cache:false
			});	
	}
}
//editoranswer
function editAnswer(Key,Value)	//key=1001-1001 value=A%2CB
{
	var rid = Key.split("-");//拆分这个key.前面是ruleId,后面是qid
	var l = answerStr.search(''+Key+'-');		//位置
	var s1 = answerStr.substr(l,answerStr.length-l),leftstr=answerStr.substr(0,l-1);   //
	var r = s1.search('&'),rightstr='';				//
	if(l > 0) {							//以前有
		l += Key.length;
		if (r > 0){
			vlen = r - Key.length - 2;
			rightstr=s1.substr(r,s1.length);
		}else
			vlen = answerStr.length - l;
			if(Value=='')	//没答案
			{
				answerStr=leftstr+rightstr;
				$("#MyExamNum").html(Number($("#MyExamNum").html())-1);
				$("#ElseExamNum").html(Number("${totalNum}")-Number($("#MyExamNum").html()));
				$("#dnum"+rid[0]).html(Number($("#dnum"+rid[0]).html())-1);//每大题实际完成数
			}else{
				answerStr = leftstr + '&'+Key+'-'+Value+rightstr;
			}
	}else{	//以前没有
			answerStr = answerStr+ '&'+Key+'-'+Value;//.replace(/%2C/g,"%252C");
			$("#MyExamNum").html(Number($("#MyExamNum").html())+1);
			$("#ElseExamNum").html(Number("${totalNum}")-Number($("#MyExamNum").html()));
			$("#dnum"+rid[0]).html(Number($("#dnum"+rid[0]).html())+1);//每大题实际完成数
		}
	saveAnswers(0);
}
function editAnswer2(Key,Value)
{
	var rid = Key.split("-");//拆分这个key.前面是ruleId,后面是qid
	var l = textareaStr.search(''+Key+'-');		//位置
	var s1 = textareaStr.substr(l,textareaStr.length-l),leftstr=textareaStr.substr(0,l-1);   //
	var r = s1.search('   '),rightstr='';				//
	if(l > 0) {							//以前有
		l += Key.length;
		if (r > 0){
			vlen = r - Key.length - 2;
			rightstr=s1.substr(r,s1.length);
		}else
			vlen = textareaStr.length - l;
			if(Value=='')	//没答案
			{
				textareaStr=leftstr+rightstr;
			}else{
				textareaStr = leftstr + '   '+Key+'-'+Value+rightstr;
			}
	}else{	//以前没有
			if(textareaStr=='')
				textareaStr = Key+'-'+Value;
			else
				textareaStr = textareaStr+ '   '+Key+'-'+Value;
		}
}
function notice(content,t){//提示框
		dianotice = art.dialog({id:"notice",content:content,icon:"warning",lock:true,opacity:0.1,time:t,title: false,fixed:true});
	}
function succeed(content,t){
		artdialog = art.dialog({id:"artdialog",content:content,icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true,title: false});
	}
</script>
</body>
</html>