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
<script type="text/javascript">
	if("${rule.ruleQuestionNum-rule.ruleActualAddNum }"==0)
	{
		alert("添加成功,该大题已经加满!");
		location = "${pageContext.request.contextPath}/paper/paperDetail?paperId=${rule.paperId}";
	}else{
	if("${actionFlag}"=="add")
	{
		var r = confirm("添加成功,是否继续添加");
		if(r)
		{
			
		}else
		{
			location = "${pageContext.request.contextPath}/paper/paperDetail?paperId=${rule.paperId}";
		}
	}}
</script>

<form id="questionForm" name="questionForm" method="post" action="${pageContext.request.contextPath}/paper/addQuestion">
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
 <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr id="tr_back">
		  <td width=35 align="center" alt="后退" onClick="location='${pageContext.request.contextPath}/paper/paperDetail?paperId=${rule.paperId}'" style="cursor:pointer">后退
		  </td>
		  <td>&nbsp;
<input name="question.questPaperId" value="${rule.paperId }" type="hidden">
<input id="ruleId" name="question.questRuleId" value="${rule.ruleId }" type="hidden">
<input name="question.questType" value="${rule.ruleType}" type="hidden">
</td>
</tr>
</table>
</td>
</tr>
</table>
<table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
	<tr>
		<td colspan="2" align="center"><font color=green>当前大题还需添加：<font color=red><strong>${rule.ruleQuestionNum-rule.ruleActualAddNum } </strong></font>道试题</font>
		<hr width="100%" size="1">
		</td>
	</tr>
    <tr>
    	<td></td>
        <td valign="middle" colspan="2">
            第
            <input name="question.questOrderId" type="text" value="${questionNo[0] }" size="3" maxlength="3" />
            题：&nbsp;&nbsp; &nbsp;&nbsp;
			<input type="checkbox" name="link_start" id="link_start" value="1"><label id="label_link" for="link_start">连题开始</label>
			<input name="link" type="hidden" value="${link }" id="link">            
        </td>
    </tr>
    <tr>
    <tr>
        <td width="10%" align="center">
            试题内容：
        </td>
        <td>
            <textarea name="questContent" cols="100" rows="5" class="l-textarea" id="editor1" style="width:651px"  ></textarea>
            <textarea name="question.questContent" id="content" style="display:none"></textarea>
        </td>
    </tr>
    <tr>
        <td align="center">
            答案解析：
        </td>
        <td>
            <textarea name="questAnalysis" cols="100" rows="5" class="l-textarea" id="editor2" style="width:651px"  ></textarea>
            <textarea name="question.questAnalysis" id="analysis" style="display:none"></textarea>
        </td>
    </tr>
    <tr>
        <td colspan="2"bgcolor="#FFFeee">
        	<s:if test="rule.ruleType==1">
        		 <div id="List_Div" style="float:left; margin-left:30px">
                正确答案： A
                <input type="radio" name="question.questAnswer" value="A" />
                B
                <input type="radio" name="question.questAnswer" value="B" />
                C
                <input type="radio" name="question.questAnswer" value="C" />
                D
                <input type="radio" name="question.questAnswer" value="D" />
            </div>
            &nbsp;本题选项个数：
            <input name="question.questOptionNum" type="text" value="4" size="5" maxlength="2" id="list_num"/>
            <input type="button" name="List" value="设定" onClick="ChooseSelect($('#list_num').val(),'radio');"
            /><span id="msg1" style="margin-left:10px;color:red">&nbsp;</span>
        	</s:if>
        	<s:elseif test="rule.ruleType==2">
        		 <div id="List_Div" style="float:left; margin-left:30px">
                正确答案： A
                <input type="checkbox" name="question.questAnswer" value="A" />
                B
                <input type="checkbox" name="question.questAnswer" value="B" />
                C
                <input type="checkbox" name="question.questAnswer" value="C" />
                D
                <input type="checkbox" name="question.questAnswer" value="D" />
            </div>
            &nbsp;本题选项个数：
            <input name="question.questOptionNum" type="text" value="4" size="5" maxlength="2" id="list_num"/>
            <input type="button" name="List" value="设定" onClick="ChooseSelect($('#list_num').val(),'checkbox');"
            /><span id="msg1" style="margin-left:10px;color:red">&nbsp;</span>
        	</s:elseif>
        	<s:elseif test="rule.ruleType==3">
        		<div id="List_Div" style="float:left; margin-left:30px">
                正确答案： √
                <input type="radio" name="question.questAnswer" value="T" />
                ×
                <input type="radio" name="question.questAnswer" value="F" />
                <input name="question.questOptionNum" value="2" type="hidden">
            </div>
        	</s:elseif>
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
            'fontfamily', 'fontsize','forecolor','insertimage']],
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
        	initialFrameHeight:100
        	,minFrameHeight:50
        //pasteplain:true        //纯文本粘贴
        } );
        editor.render('editor1');
        editor2.render('editor2');
	
	//初始化连题设置
	$(function(){
		$('input:checkbox').click(function () {
				this.blur();
				this.focus();
		});
		var q_link = "${link}";
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
				else $("#link").val(value+'end');
				alert($("#link").val());
			}else
			{
				if(value==1) $("#link").val('');
				else $("#link").val("${link}");
				alert($("#link").val());
			}
		});
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
		var $radio = $('<label>&nbsp;'+String.fromCharCode(65+i)+'&nbsp;<input type="'+type+'" name="question.questAnswer" value="'+String.fromCharCode(66+i)+'" /></label>');
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
	}
	}
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
		data:{'content':editor.getPlainTxt(),"ruleId":"${rule.ruleId}"},
		dataType:'json',
		success:function(data)
		{
			if(data)
			{
				$("#questionForm").submit();
			}else
			{
				var r = confirm("监测到重复试题,是否继续添加");
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
