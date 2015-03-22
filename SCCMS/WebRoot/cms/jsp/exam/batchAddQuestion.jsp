<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
 <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr id="tr_back">
		  <td width=35 align="center" alt="后退" onClick="location='${pageContext.request.contextPath}/paper/paperDetail?paperId=${rule.paperId}'" style="cursor:pointer">后退
		  </td>
		  <td>&nbsp;
<input name="paperId" value="${rule.paperId }" type="hidden">
<input id="ruleId" name="ruleId" value="${rule.ruleId }" type="hidden">
<input name="questType" value="${rule.ruleType}" type="hidden">
</td>
</tr>
</table>
</td>
</tr>
</table>
<table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
	<tr>
		<td colspan="2" align="center"><font color=green>${rule.title },批量加题</font>
		<hr width="100%" size="1">
		</td>
	</tr>
    <tr>
    	<td>添题信息</td>
    	<td>还需要添加<span id="needNum">${rule.ruleQuestionNum-rule.ruleActualAddNum } </span>道题&nbsp;&nbsp;&nbsp;&nbsp;题型：<span id="questionType">${rule.type }</span></td>
    </tr>
    <tr>
    	<td>添加模式</td>
    	<td><label for="fromTxt">读取文件&nbsp;&nbsp;</label><input id="fromTxt" name="addType" type="radio" value="0" checked="checked">&nbsp;
    		<label for="fromEditor">直接编辑&nbsp;&nbsp;</label><input id="fromEditor" name="addType" type="radio" value="1">&nbsp;
    	</td>
    </tr>
    <tr>
    	<td>内容形式</td>
    	<td><label for="betweenQ">一题一答案</label><input id="betweenQ" name="contentType" type="radio" value="0" checked="checked">&nbsp;
    		<label for="afterQ">答案在最后</label><input id="afterQ" name="contentType" type="radio" value="1">&nbsp;
    	</td>
    </tr>
    <tr>
    	<td>选择文件</td>
    	<td>
    	<form id="fileForm" name="questionForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/paper/batchAddQuestion" >
    		<input id="txt_file" type="file" name="mf" accept="test/plain">
    		<input name="paperId" value="${rule.paperId }" type="hidden">
			<input id="ruleId" name="ruleId" value="${rule.ruleId }" type="hidden">
			<input name="questType" value="${rule.ruleType}" type="hidden">
			<input name="startNo" value="${questionNo[0] }" type="hidden">
			<input name="model" value="0" type="hidden"/>
		</form>
    	</td>
    </tr>
    <tr>
        <td width="10%" align="center">
            试题内容：
        </td>
        <td>
        	<form id="editorForm" method="post" action="${pageContext.request.contextPath}/paper/batchAddQuestion2">
            <textarea cols="100" rows="5" class="l-textarea" id="editor1" style="width:651px"  >
题目内容组织形式介绍<br/>
            	1,每题最开始必须有标号且连续,标号从1开始标号与题目有分割符;<br/>
            	2,选项必须用大写的A-Z表示,并且要有分隔符;<br/>
            	3,一题一答案的,答案前顶行标注"[答案]:",解析前顶行标注"[解析]:",解析和答案必须换行;<br/>
            	4,文件暂时只支持TXT文档<br/>
            	5,例子：<br/>
            		1、某新建高速公路路基修筑，判断其路基干湿类型的标准是(    )。<br/>
					A．分界相对含水量<br/>
					B．分界稠度划分<br/>
					C．路基临界高度<br/>
					D．路基土压实度<br/>
					[答案]:A<br/>
					[解析]:这个题目的解析<br/>
<br/>
					2、下列路段中，不宜在雨期施工的是（）<br/>
					A．碎砾石路段<br/>
					B．路堑弃方路段<br/>
					C．膨胀土路段<br/>
					D．丘陵区砂类土路段<br/>
					[答案]:C<br/>
					[解析]:这个题目的解析<br/>
            </textarea>
            <textarea id="questContent" name="questContent" style="display:none"></textarea>
            <input name="paperId" value="${rule.paperId }" type="hidden">
			<input name="ruleId" value="${rule.ruleId }" type="hidden">
			<input name="questType" value="${rule.ruleType}" type="hidden">
			<input name="startNo" value="${questionNo[0] }" type="hidden">
			<input name="model" value="0" type="hidden"/>
            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center" style="border-top:#FF6600 solid 1px;">
           <span id="msg" style="color:red">&nbsp;</span>
        </td>
    </tr>
    <tr>
        <td colspan="2" height="30" align="center">
            <input type="button" name="Submit2" onClick="commit()" value=" 开始添加 ">
        </td>
    </tr>
</table>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/cms/js/jquery-1.4.3.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor.min.js"></script> 
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor_config.js"></script> 
<script type="text/javascript">
	   var editor,initContent;   
        editor = new UE.ui.Editor( { 
        toolbars:[['fullscreen', 'undo', 'redo', '|','bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'removeformat',
            'fontfamily', 'fontsize','forecolor','insertimage']],
        initialContent:"",
        initialFrameWidth:950,
        initialFrameHeight:300,
        focus:true
        ,minFrameHeight:50,
        readonly:true
        //pasteplain:true        //纯文本粘贴
        } );
        editor.render('editor1');
	$(function(){
		$('input:radio').click(function () {
				this.blur();
				this.focus();
		});
		$("input:radio[name='addType']").change(function(){
			if($(this).val()==0)
			{
				//从文件中读，禁用editor
				editor.execCommand("clearDoc");//选中全部
				editor.setContent(initContent);
				editor.disable();
			}else
			{
				editor.enable();
				initContent=editor.getContent();
				editor.execCommand("clearDoc");//清空全部
			}
		});
		$("input:radio[name='contentType']").change(function(){
			$("input[name='model']").val($(this).val());
			if($(this).val()==0)
			{
				editor.setContent("<p>题目内容组织形式介绍<br />1,每题最开始必须有标号且连续,标号从1开始标号与题目有分割符;<br />2,选项必须用大写的A-Z表示,并且要有分隔符;<br />3,一题一答案的,答案前顶行标注&quot;[答案]:&quot;,解析前顶行标注&quot;[解析]:&quot;,解析和答案必须换行;<br />4,文件暂时只支持TXT文档<br />5,例子：<br />1、某新建高速公路路基修筑，判断其路基干湿类型的标准是( &nbsp; &nbsp;)。<br />A．分界相对含水量<br />B．分界稠度划分<br />C．路基临界高度<br />D．路基土压实度<br />[答案]:A<br />[解析]:这个题目的解析<br /><br />2、下列路段中，不宜在雨期施工的是（）<br />A．碎砾石路段<br />B．路堑弃方路段<br />C．膨胀土路段<br />D．丘陵区砂类土路段<br />[答案]:C<br />[解析]:这个题目的解析</p>");
			}else
			{
				editor.setContent("<p>题目内容组织形式介绍<br />1,每题最开始必须有标号且连续,标号从1开始标号与题目有分割符;<br />2,选项必须用大写的A-Z表示,并且要有分隔符;<br />3,答案在最后的，在最后一题后面写&quot;[答案]&quot;,后面跟每题的答案<br />4,文件暂时只支持TXT文档<br />5,例子：<br />1、某新建高速公路路基修筑，判断其路基干湿类型的标准是( &nbsp; &nbsp;)。<br />A．分界相对含水量<br />B．分界稠度划分<br />C．路基临界高度<br />D．路基土压实度<br /><br />2、下列路段中，不宜在雨期施工的是（）<br />A．碎砾石路段<br />B．路堑弃方路段<br />C．膨胀土路段<br />D．丘陵区砂类土路段</p><p>......</p><p><br />[答案]:</p><p>1.A &nbsp; &nbsp;2.C &nbsp; &nbsp;....<br /></p><p><br /><br /></p>");
			}
		});
		
	});

function commit()
{
	if($("input:radio[name='addType']:checked").val()==0)
	{
		//判断文件格式，提交表单
		if(/^[\d\D]+.txt$/.test($("#txt_file").val()))
		{
			$("#fileForm").submit();
		}else
		{
			alert("暂时只支持txt文档");	
			return;	
		}
	}else
	{
		if(!editor.hasContents())
		{
			$("#msg").html("请输入编辑内容");
			return;
		}
		var value=editor.getContent();
		if(!/^<p>1[.．、][\D\d]+[[答案]{2}]:[\D\d]+$/.test(value))
		{
			$("#msg").html("内容不合规矩");
			return;
		}
		$("#questContent").val(editor.getContent());
		$("#editorForm").submit();
	}
}
</script>
</html>
