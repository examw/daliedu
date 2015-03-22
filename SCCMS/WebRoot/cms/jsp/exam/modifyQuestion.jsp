<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body topmargin="2" leftmargin="2">
<form id="questionForm" name="questionForm" method="post" action="${pageContext.request.contextPath}/paper/updateQuestion">
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
 <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr id="tr_back">
		  <td width=35 align="center" alt="后退" onClick="location='${pageContext.request.contextPath}/paper/paperDetail?paperId=${rule.paperId}'" style="cursor:pointer">后退</td>
		  <td>&nbsp;
<input name="question.questPaperId" value="${rule.paperId }" type="hidden">
<input id="ruleId" name="question.questRuleId" value="${rule.ruleId }" type="hidden">
<input name="question.questType" value="${rule.ruleType}" type="hidden">
<input name="question.questId" value="${question.questId }" type="hidden">
</td>
</tr>
</table>
</td>
</tr>
</table>
<table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
	<tr>
		<td colspan="2" align="center">
			<font color=blue>${paperName }&nbsp;-&nbsp;第${rule.ruleIdInPaper }大题：<span id="ruleTitle"></span>
		<hr width="100%" size="1">
		</td>
	</tr>
    <tr>
    	<td></td>
        <td valign="middle" colspan="2">
            第
            <input name="question.questOrderId" type="text" value="${question.questOrderId }" size="3" maxlength="3" />
            题：&nbsp;&nbsp; &nbsp;&nbsp;
			<%-- <input type="checkbox" name="link_start" id="link_start" value="1"><label id="label_link" for="link_start">连题开始</label>
			<input name="link" type="hidden" value="${link }" id="link">    --%> 
			<s:if test="question.questLinkQuestionId==null||question.questLinkQuestionId.equals('')">
				如果要设置连题,请到试卷详细页去<a href="${pageContext.request.contextPath}/paper/paperDetail?paperId=${question.questPaperId }">设置</a>
			</s:if>  
			<s:else>
				连题ID：<input id="linkedId" disabled="disabled"/> 
			</s:else>     
        </td>
    </tr>
    <tr>
    <tr>
        <td width="10%" align="center">
            试题内容：
        </td>
        <td>
            <textarea name="questContent" cols="100" rows="5" class="l-textarea" id="editor1" style="width:651px"  >${question.questContent }</textarea>
            <textarea name="question.questContent" id="content" style="display:none"></textarea>
        </td>
    </tr>
    <tr>
        <td align="center">
            答案解析：
        </td>
        <td>
            <textarea name="questAnalysis" cols="100" rows="5" class="l-textarea" id="editor2" style="width:651px"  >${question.questAnalysis }</textarea>
            <textarea name="question.questAnalysis" id="analysis" style="display:none"></textarea>
        </td>
    </tr>
    <tr>
        <td colspan="2" bgcolor="#FFFeee" id="optionTD">
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center" style="border-top:#FF6600 solid 1px;">
           <span id="msg" style="color:red">&nbsp;</span>
        </td>
    </tr>
    <tr>
        <td colspan="2" height="30" align="center">
            <input type="button" name="Submit2" onClick="commit()" value=" 保 存 ">
            <input type="button" onClick="location='${pageContext.request.contextPath}/paper/paperDetail?paperId=${rule.paperId}'" value=" 取 消 ">
        </td>
    </tr>
</table>
</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/cms/js/jquery-1.4.3.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor.min.js"></script> 
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor_config.js"></script> 
<script type="text/javascript">

	   var editor,editor2;   
        editor = new UE.ui.Editor( { 
            toolbars:[['fullscreen', 'undo', 'redo', '|','bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'removeformat',
            'fontfamily', 'fontsize','forecolor','insertimage','mydevide']],
            initialContent:"",
             initialFrameWidth:950,
        initialFrameHeight:130,
        focus:true
        ,minFrameHeight:50
        //pasteplain:true        //纯文本粘贴
        } );
        editor2 = new UE.ui.Editor( { 
            toolbars:[['fullscreen', 'undo', 'redo', '|','bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'removeformat',
            'fontfamily', 'fontsize','forecolor','insertimage']],
            initialContent:"",
             initialFrameWidth:950,
        initialFrameHeight:100,
        focus:true
        ,minFrameHeight:50
        //pasteplain:true        //纯文本粘贴
        } );
        editor.render('editor1');
        editor2.render('editor2');
	
	$(function(){
		$('input:checkbox').click(function () {
				this.blur();
				this.focus();
		});
		//初始化所属大题的标题
		$("#ruleTile").html("${rule.ruleTitle}".split("@@@")[0]);
		//初始化选项
		var optionNum = Number("${question.questOptionNum}");
		var optionTD = $("#optionTD");
		if("${question.questType}"==1){
			var optionDiv = $('<div id="List_Div" style="float:left; margin-left:30px">正确答案：</div>');
			for(var j=0;j<optionNum;j++)
			{
				var option=$('<label>&nbsp;'+String.fromCharCode(65+j)+'<input type="radio" name="question.questAnswer" value="'+String.fromCharCode(65+j)+'" /></label>');
				optionDiv.append(option);
			}
			optionTD.append(optionDiv);
			var setSpan=$("<span>&nbsp;本题选项个数：</span><input name='question.questOptionNum' type='text' value='"+${question.questOptionNum}+"' size='5' maxlength='2' id='list_num'/><input type='button' name='List' value='设定' id='setOption' onclick='ChooseSelect($(\"#list_num\").val(),\"radio\")'/><span id='msg1' style='margin-left:10px;color:red'>&nbsp;</span>");
			optionTD.append(setSpan);
		}else if("${question.questType}"==2)
		{
			var optionDiv = $('<div id="List_Div" style="float:left; margin-left:30px">正确答案：</div>');
			for(var j=0;j<optionNum;j++)
			{
				var option=$('<label>&nbsp;'+String.fromCharCode(65+j)+'<input type="checkbox" name="question.questAnswer" value="'+String.fromCharCode(65+j)+'" /></label>');
				optionDiv.append(option);
			}
			optionTD.append(optionDiv);
			var setSpan=$("<span>&nbsp;本题选项个数：</span><input name='question.questOptionNum' type='text' value='"+${question.questOptionNum}+"' size='5' maxlength='2' id='list_num'/><input type='button' name='List' value='设定' id='setOption' onclick='ChooseSelect($(\"#list_num\").val(),\"checkbox\")'/><span id='msg1' style='margin-left:10px;color:red'>&nbsp;</span>");
			optionTD.append(setSpan);
		}else if("${question.questType}"==3)
		{
			var optionDiv=$('<div id="List_Div" style="float:left; margin-left:30px">正确答案： √<input type="radio" name="question.questAnswer" value="T" />×<input type="radio" name="question.questAnswer" value="F" /><input name="question.questOptionNum" value="2" type="hidden"></div>');
			optionTD.append(optionDiv);
		}
		//初始化正确答案
		var answer = "${question.questAnswer}".split(", ");
		for(var i=0;i<answer.length;i++)
		{
			$("input[name='question.questAnswer'][value='"+answer[i]+"']").attr('checked',true);
		}
		//初始化连题设置
		$("#linkedId").val("${question.questLinkQuestionId}".split('_')[0]);
/* 		var q_link = "${question.questLinkQuestionId}";
		if(!q_link){ 
			$("#link_start").val('1');
		}
		else if(q_link.indexOf("_end")!=-1)
		{
			//连题已经结束
			$("#link_start").val('1');
			$("#label_link").html("连题开始");
		}else
		{
			$("#link_start").val(q_link);
			$("#label_link").html("连题结束");
		}
		$("#link_start").change(function(){
			var value = $("#link_start").val();
			if($("#link_start").attr('checked')) //选中
			{
				//改变属性
				if(value==1) $("#link").val('1');
				else $("#link").val(value+'_end');
				alert($("#link").val());
			}else
			{
				if(value==1) $("#link").val('');
				else $("#link").val("${link}");
				alert($("#link").val());
			}
		}); */
	});
	
function checkNull(value,msg)
{
	if(!value||!$.trim(value))
	{
		$("#msg").html(msg+"不能为空");
		return false;
	}
	$("#msg").html("");
	return true;
}
function ChooseSelect(num,type)
{
	if(isNaN(num)){$("#msg1").html("输入数字");return;}
	if(Number(num)<3){ $("#msg1").html("选项不得少于2个");return;}
	if(Number(num)>26){$("#msg1").html("选项也太多了点");return;}
	$("#List_Div").html("正确答案：");//清空内容重新加
	for(var i=0;i<num;i++)
	{
		var $radio = $('<label>&nbsp;'+String.fromCharCode(65+i)+'&nbsp;<input type="'+type+'" name="question.questAnswer" value="'+String.fromCharCode(65+i)+'" /></label>');
		$("#List_Div").append($radio); 
	}
}
function commit()
{
	if(!editor.hasContents())
	{
		$("#msg").html("题目内容不能为空!");
		return;
	}
	if("${rule.ruleType}"!=4)
	{
	if(!$("input[name='question.questAnswer']:checked").val())
	{
		$("#msg").html("没有选择正确答案");
		return;
	}}
	if("${rule.ruleType}"==4&&!editor2.hasContents())
	{
		$("#msg").html("问答题必须要答案解析");
		return;
	}
	$("#content").val(editor.getPlainTxt());
	$("#analysis").val(editor2.getPlainTxt());
	//检测重复
	$.ajax({
		async:false,
		type:"POST",
		url:"${pageContext.request.contextPath}/paper/checkRepeat",
		data:{'content':editor.getPlainTxt(),"ruleId":"${rule.ruleId}","model":1},
		dataType:'json',
		success:function(data)
		{
			if(data)
			{
				$("#questionForm").submit();
			}else
			{
				var r = confirm("监测到重复试题,是否执意修改");
				if(r)
				{
					$("#questionForm").submit();
				}
			}
		},
		error:function()
		{
			alert("系统错误");
		}
	});
	
}
</script>
</html>
