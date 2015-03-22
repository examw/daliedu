<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容窗口</title>
<link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.x_table,.x_table2 {
	border-top: solid 1px #ccc;
	border-left: solid 1px #ccc;
	margin-top: 20px;
	margin-left: 30px;
}
.x_table2 td {
	border-bottom: solid 1px #ccc;
	border-right: solid 1px #ccc;
	font-size: 12px;
	line-height: 22px;
}
.x_table .xtr {
	font-weight: bold;
	background: url(bg_list01_th.gif) repeat-x bottom;
	height: 26px;
	line-height: 26px;
	text-align: center;
}

.x_table .xtr02 {
	font-weight: bold;
	background: url(bg_list01_th.gif) repeat-x bottom;
	text-align: left;
	font-size: 14px;
	line-height: 30px;
}

.x_table td {
	border-bottom: solid 1px #ccc;
	border-right: solid 1px #ccc;
	padding: 0 5px;
	font-size: 12px;
	line-height: 22px;
	width:50px;
}

.x_table .tdbg {
	background: #fff;
}

.x_table .tdbgmouseover {
	background: #f4f4f4;
}

.red {
	color: #F00;
	font: bold
}
a{cursor:pointer;color:blue}
.address{display:none}
.l-text-wrapper{position: relative;width:160px}
</style>
<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$("#tradeTime").ligerDateEditor({
			showTime : true
		});
		//设置下拉框
        $("#paperType").ligerComboBox({  
        data: [
          { text: ' 练习卷', id: '1' },
          { text: ' 模拟卷', id: '2' },
          { text: ' 真题卷', id: '3' },
          { text: ' 题库', id: '4' }
         ], valueFieldID: 'paper.paperType',initValue:"${paper.paperType}",width:200,selectBoxWidth :200
        }); 
       	//初始化大题的属性
       	var $tr = $("#ruleTable tr[name='rule']");
       	for(var i=0;i<$tr.length;i++)
       	{
       		var rule_type = $("#rule_type"+i).val();//题型
       		var title = $("#ruleTitle"+i).val();//大题题干
       		var scoreSet = $("#ruleSorceSet"+i).val();//评分规则
       		//初始化题目框
       		$("#title_a"+i).val(title.split("@@@")[0]);
       		$("#title_b"+i).val(title.split("@@@")[1]);
       		//初始化题型选择框
       		$("#ruleType"+i+" option[value="+rule_type+"]").attr('selected',true);
       		//初始化评分选择框
       		$("#sorceSetModel"+i+" option[value="+scoreSet.split('|')[0]+"]").attr('selected',true);
       		if(scoreSet.split('|')[0]!=0)
       		{
       			$("#sorceSet"+i).val(scoreSet.split("|")[1]);
       		}
       	}
        $("#link_selectGrade").change(function(){
        	LinkLecture(this.value);
        });
	});
</script>
</head>
<body topmargin="2" leftmargin="2">
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
  <tr bgcolor="#EEEEEE"> 
    <td height="26" colspan="5" valign="middle">
      <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr id="tr_back">
		  <td width=35 align="center" alt="后退" onClick="history.back();" style="cursor:pointer">后退</td>
		  <td>&nbsp; </td>
        </tr>
      </table>
 
	  </td>
  </tr>
</table>	
	<table width="80%" height="421" align="center">
		<tr>
			<td height="211" valign="top">
				<table width='80%' border='0' cellpadding='0' cellspacing='0'
					align="center">
					<tr>
						<td width="100%">
							<form id="form1" name="form1" method="post"
								action="${pageContext.request.contextPath}/paper/updatePaper">
								<table width="100%" height="200" border='0' cellpadding='2'
									cellspacing='1' class='x_table'>
									<tr>
										<td height="36" colspan="2" align="center" bgcolor="#F4F4F4"><strong
											style="font-size:14px; color:#F00">修改试卷</strong>
										</td>
										<!-- 全手动开通，需要寄送的情况，要添加寄送，选择 -->
									</tr>
									<tr>
										<td height="36" align="right"><strong>试卷名称：</strong>
										<input type="hidden"  name="paper.paperExamId" value="${paper.paperExamId }" id="examId"/>
										<input type="hidden"  name="paper.paperId" value="${paper.paperId }" id="paperId"/>
										</td>
										<td>&nbsp;<input id="paperName" type="text" name="paper.paperName" class="l-text" style="width:400px;" value="${paper.paperName }" onblur="checkPaperName(this,$('#paperNameInfo'));">
												  <input id="paperNameCopy" type="hidden" value="${paper.paperName }">
										&nbsp;<span id="paperNameInfo" style="color:red;margin-left:4px">*</span>
										</td>
									</tr>
									<tr>
										<td width="35%" height="36" align="right"><strong>试卷总分：</strong>
										</td>
										<td>&nbsp;<input id="paperSorce" type="text" name="paper.paperScore" class="l-text" style="width:200px;" value="${paper.paperScore }" onblur="checkNumber($('#paperSorce').val(),0,$('#paperSorceInfo'))">分
										&nbsp;<span id="paperSorceInfo" style="color:red;margin-left:4px">*</span>
										</td>
									</tr>
									<tr>
										<td width="35%" height="36" align="right"><strong>考试时间：</strong>
										</td>
										<td>
										 &nbsp;<input id="paperTime" type="text" name="paper.paperTime" class="l-text" style="width:200px;" value="${paper.paperTime }" onblur="checkNumber($('#paperTime').val(),0,$('#paperTimeInfo'))">分钟
										&nbsp;<span id="paperTimeInfo" style="color:red;margin-left:4px">*</span>
									</tr>
									<tr>
										<td height="36" align="right"><strong>试卷类型：</strong>
										</td>
										<td><input type="text" id="paperType" style="width:100px;">
											<!-- <select id="paper.paperType" class="l-select" ltype="select">
												<option value="1" selected="selected">练习卷</option>
												<option value="2">模拟卷</option>
												<option value="3">真题卷</option>
												<option value="4">题库</option>
											</select> -->
										</td>
									</tr>
									<tr>
										<td height="36" align="right"><strong>关联课程：</strong>
										</td>
										<td id="linkGrade">
											<span id="linkName" flag="1">
											<input type="hidden" name="paper.paperLinkName" id="paperLinkName" value="${paper.paperLinkName }"/>
											<s:if test="paper.paperLinkName!=null&&!paper.paperLinkName.equals('')">
											<input type="text" id="paperLinkName1" value="${paper.paperLinkName }" class="l-text" style="width:200px;">
											</s:if>
											<s:else>
												&nbsp;暂无关联&nbsp;&nbsp;
											</s:else>
											</span>
											<select id="link_selectGrade"  style="display:none" name="paper.paperEGradeId">
												<option selected="selected" value="">选择班级</option>
											</select>
											<select id="link_selectClass" style="display:none" name="paper.paperEGCheaterId">
												<option selected="selected" value="">选择章节</option>
											</select>
											<span id="link_a">&nbsp;<a onclick="setLink()">设置关联</a></span>
										</td>
									</tr>
									<tr>
										<td height="36" align="right"><strong>大题数目：</strong>
										</td>
										<td>&nbsp;<input id="paperRuleNum" type="text" name="paperRuleNum"
											class="l-text" style="width:180px;" value="${ruleSize }">
											<!-- <input type="button" value="设置" onclick="setRules($('#paperRuleNum').val());">-->
										&nbsp;<span id="setInfo" style="color:red;margin-left:4px">*</span>
										</td>
									</tr>
								</table>
								<table id="ruleTable" width="100%" border="0" cellpadding="2" cellspacing="2" class='x_table2' >
												<tr><td align="center">设置大题属性</td></tr>
												<s:iterator value="ruleList" var="rule" status="status">
												<s:if test="#rule!=null">
													<tr name="rule" no="${status.index }" id="ruleTr${status.index }">
    <td>
    	<input type=hidden value="${rule.ruleId }" name="rules[${status.index }].ruleId">
        <table border="0" width="100%">
            <tbody>
                <tr>
                    <td rowspan="2" align="center">第<span id="ruleNo${status.index }"><input name="rules[${status.index }].ruleIdInPaper" id="txtRuleNo${status.index }" value="${status.index+1 }" size="2" type="text"></span>大题</td>
                    <td height="30px">&nbsp;标题:<input id="title_a${status.index }" onblur="checkNull(this,$('#ruleInfo'))" type="text">&nbsp;说明:<input id="title_b${status.index }" style="width:400px" onblur="checkNull(this,$('#ruleInfo'))" type="text"><input name="rules[${status.index }].ruleTitle" id="ruleTitle${status.index }" type="hidden" value="${rule.ruleTitle }"></td>
                    <td style="width:40px" rowspan="2" align="center"><a onclick="delExistRuleTr(${rule.ruleId },${status.index },${rule.ruleActualAddNum })">删除</a></td>                        
                </tr>
                <tr>
                    <td height="30px"><span style="margin-left:15px">共&nbsp;<input name="rules[${status.index }].ruleQuestionNum" id="questionNum${status.index }" size="3" type="text" value="${rule.ruleQuestionNum }">题&nbsp;每题：<input value="${rule.ruleScoreForEach }" size="3" id="questionSorce${status.index }" name="rules[${status.index }].ruleScoreForEach" type="text">分</span><span style="margin-left:20px">&nbsp;题型：<input id="rule_type${status.index }" value="${rule.ruleType }" type="hidden">
                    <s:if test="#rule.ruleActualNum!=0">
                    <select name="rules[${status.index }].ruleType" id="ruleType${status.index }" disabled="disabled"><option value="1">单选题</option><option value="2">多选题</option><option value="3">判断题</option><option value="4">问答题</option></select>
                    </s:if>
                    <s:else>
                    <select name="rules[${status.index }].ruleType" id="ruleType${status.index }" ><option value="1">单选题</option><option value="2">多选题</option><option value="3">判断题</option><option value="4">问答题</option></select>
                    </s:else>
                    &nbsp;评分规则：<select id="sorceSetModel${status.index }"><option value="0" selected="selected">无</option><option value="1">少选得分</option><option value="2">答错扣分</option></select><input id="sorceSet${status.index }" value="" size="3" type="text">分<input id="ruleSorceSet${status.index }" name="rules[${status.index }].ruleScoreSet" type="hidden" value="${rule.ruleScoreSet }"></span></td>
                </tr>
            </tbody>
        </table>    
    </td>        
</tr></s:if>
												</s:iterator>
												<tr id="ruleTableBottom"><td align="center"><a onclick="addRule()">继续添加大题</a></td></tr>
												
											</table>
							</form>
					<tr><td align="center">&nbsp;<span id="ruleInfo" class="red"></span></td></tr>
					<tr>
						<td height="36" colspan="2" align="center"><input
								name="button" type="button" value=" 确 定 " class="btn" onclick="commit();">
							<input id="btn_back" type="button" value="取消"  onclick="history.back()">
										</td>
									</tr>
					
				</table></td>
		</tr>

	</table>
	<!-- 列表出会员的修改订单的价格-->
</body>
<script type="text/javascript">
	function checkNull(dom,$span)
	{
		var value = $(dom).val();
		if(!value||!$.trim(value))
		{
			$span.html("不能为空");
			return false;
		}
		$span.html("*");
		return true;
	}
	function checkNumber(value,fixed,$span)
	{
		if(fixed==0) //必须为整数
		{
			if(/^[0-9]+$/.test(value))
			{
				if(Number(value)==0)
				{
					$span.html("填大于0的数");
					return false;
				}
				$span.html("");
				return true;
			}
			$span.html("填大于0的数");
			return false;
		}else
		{
			if(/^[0-9]+[.]?[0-9]{0,2}$/.test(value))
			{
				if(Number(value)==0)
				{
					$span.html("填大于0的数");
					return false;
				}
				$span.html("");
				return true;
			}
			$span.html("填大于0的数");
			return false;
		}
	}
	//checkPaperName 以前没改的名字不需要检测
	function checkPaperName(dom,$span)
	{
		var flag = false;
		if(checkNull(dom,$span))
		{
			if($("#paperNameCopy").val()==$.trim($(dom).val()))
			{
				return true;
			}
			$.ajax({
			async:false,
			type:"POST",
			url:"${pageContext.request.contextPath}/paper/checkPaperName",
			data:{"paperName":$.trim($(dom).val())},
			dataType:"json",
			success:function(data){
				if(data)
				{
					flag=true;
				}else
				{
					$span.html("试卷名称已存在");
				}
			}
			});		
		}
		return flag;
	}
	//设置大题数
	function setRules(num)
	{
		if(!num) return;
		var $table = $("#ruleTable");
		$("#ruleTable tr[name='rule']").remove();
		var $bottom = $("#ruleTableBottom");//底部元素
		$bottom.remove();
		for(var i=1;i<=num;i++)
		{
			$tr=$("<tr name='rule' no='"+i+"' id='ruleTr"+i+"'><td><table width='100%' border='0'><tr ><td rowspan='2'align='center'>第<span id='ruleNo"+i+"'>"+i+"</span>大题<input type='hidden' name='rules["+(i-1)+"].ruleIdInPaper' id='txtRuleNo"+i+"' value='"+i+"'></td><td height='30px'>&nbsp;标题:<input type='text' id='title_a"+i+"' onblur='checkNull(this,$(\"#ruleInfo\"))'>&nbsp;说明:<input type='text'id='title_b"+i+"' style='width:400px' onblur='checkNull(this,$(\"#ruleInfo\"))'><input type='hidden' name='rules["+(i-1)+"].ruleTitle' id='ruleTitle"+i+"'></td><td style='width:40px'align='center'rowspan='2'><a onclick='delRuleTr("+i+")'>删除</a></td></tr><tr><td height='30px'><span style='margin-left:15px'>共&nbsp;<input name='rules["+(i-1)+"].ruleQuestionNum' id='questionNum"+i+"' type='text'size='3'>题&nbsp;每题：<input type='text'value=1 size='3' id='questionSorce"+i+"' name='rules["+(i-1)+"].ruleScoreForEach'>分</span><span style='margin-left:20px'>&nbsp;题型：<select name='rules["+(i-1)+"].ruleType' id='ruleType"+i+"'><option value=1>单选题</option><option value=2>多选题</option><option value=3>判断题</option><option value=4>问答题</option></select>&nbsp;评分规则：<select id='sorceSetModel"+i+"'><option value=0 selected='selected'>无</option><option value=1>少选得分</option><option value=2>答错扣分</option></select><input id='sorceSet"+i+"' type='text'value=''size='3'>分<input type='hidden' id='ruleSorceSet"+i+"' name='rules["+(i-1)+"].ruleScoreSet'></span></td></tr></table></td></tr>");
			$table.append($tr);
		}
		$table.append($bottom);
		$table.show();
	}
	//继续添加大题
	function addRule()
	{
		var $tr = $("#ruleTable tr[name='rule']");
		var i = $tr.length; //这里与添加页面不同，添加页面的标号是从1开始，这里从0开始
		var	$tr_add=$("<tr name='rule' no='"+i+"' id='ruleTr"+i+"'><td><table width='100%' border='0'><tr ><td rowspan='2'align='center'>第<input type='text' name='rules["+(i)+"].ruleIdInPaper' id='txtRuleNo"+i+"' size='2' value='"+(i+1)+"'>大题</td><td height='30px'>&nbsp;标题:<input type='text' id='title_a"+i+"' onblur='checkNull(this,$(\"#ruleInfo\"))'>&nbsp;说明:<input type='text'id='title_b"+i+"' style='width:400px' onblur='checkNull(this,$(\"#ruleInfo\"))'><input type='hidden' name='rules["+(i)+"].ruleTitle' id='ruleTitle"+i+"'></td><td style='width:40px'align='center'rowspan='2'><a onclick='delRuleTr("+i+")'>删除</a></td></tr><tr><td height='30px'><span style='margin-left:15px'>共&nbsp;<input name='rules["+(i)+"].ruleQuestionNum' id='questionNum"+i+"' type='text'size='3'>题&nbsp;每题：<input type='text'value=1 size='3' id='questionSorce"+i+"' name='rules["+(i)+"].ruleScoreForEach'>分</span><span style='margin-left:20px'>&nbsp;题型：&nbsp;<select name='rules["+(i)+"].ruleType' id='ruleType"+i+"'><option value=1>单选题</option><option value=2>多选题</option><option value=3>判断题</option><option value=4>问答题</option></select>&nbsp;评分规则：<select id='sorceSetModel"+i+"'><option value=0 selected='selected'>无</option><option value=1>少选得分</option><option value=2>答错扣分</option></select><input id='sorceSet"+i+"' type='text'value=''size='3'>分<input type='hidden' id='ruleSorceSet"+i+"' name='rules["+(i)+"].ruleScoreSet'></span></td></tr></table></td></tr>");
		var $bottom = $("#ruleTableBottom");//底部元素
		$bottom.remove();
		$("#ruleTable").append($tr_add);
		$("#ruleTable").append($bottom);
		$("#paperRuleNum").val(Number($("#paperRuleNum").val())+1);
	}
	//删除大题
	function delRuleTr(num)
	{
		var $tr = $("#ruleTable tr[name='rule']");
		if($tr.length==1)
		{
			alert("再删就没题了!");
			return ;			
		}
		//alert($("#ruleTr"+num).html());
		$("#ruleTr"+num).remove();
		//改变其他行的属性
		if(num<$tr.length)
		{
			for(var i=0;i<$tr.length-num;i++)
			{
				$("#ruleNo"+(num+1+i)).html(num+i);//大题题号，第几大题
				$("#txtRuleNo"+(num+1+i)).val(num+i);//大题题号
			}
		}
		$("#paperRuleNum").val(Number($("#paperRuleNum").val())-1);
	}
	//删除已经存在的大题
	function delExistRuleTr(id,no,num)
	{
		if(num>0)
		{
			var r=confirm("该大题中已经添加了题目，\n删除该大题会删除大题下所有小题,\n确定要删除吗？");
			if (r==true)
  			{
  				f_delRule(id,no);
  			}
		}else
		{
			f_delRule(id,no);
		}
	}
	function f_delRule(id,no)
	{
		$.ajax({
            			async:true,
            			type:"POST",
            			url:"${pageContext.request.contextPath}/paper/deleteRule",
            			data:{"ruleId":id},
            			dataType:"json",
            			success:function(data)
            			{
            				if(data)
            				{
            					alert("删除成功！");
            					//该大题的总分
            					var score = Number($("#questionNum"+no).val())*Number($("#questionScore"+no).val());
            					$("#ruleTr"+no).remove();//从列表中移除
            					if(no<$tr.length-1)
								{
									for(var i=0;i<$tr.length-no-1;i++)
									{
										$("#ruleNo"+(no+1+i)).html(no+i);//大题题号，第几大题
										$("#txtRuleNo"+(no+1+i)).val(no+i);//大题题号
									}
								}
								$("#paperRuleNum").val(Number($("#paperRuleNum").val())-1);
								$("#paperScore").val(Number($("#paperScore").val())-score );
            				}else
            				{
            					alert("删除失败，该大题已不存在");
            					//刷新该页面
            					window.location.reload();
            				}
            			},
            			error:function()
            			{
            				alert("系统错误");
            			}
            		});
	}
	//设置关联
	function setLink()
	{
		$("#linkName").attr('flag',0);
		$("#linkName").hide();
		$("#link_selectGrade").show();
		$("#link_selectClass").show();
		if($("#link_selectGrade option").length>1){
			$("#link_a").html("<a onclick='cancelLink()'>取消关联</a>");
			return;
		}
		 //设置下拉框选班级
        $.ajax({
			async:true,
			type:"POST",
			url:'${pageContext.request.contextPath}/exam/gradeList',
			data:{"id":$("#examId").val(),"type":1},	//等下修改这个id值为$("#examId").val()
			dataType:"json",
			success:function(data){
				for(var i=0;i<data.length;i++)
				{
					$option=$("<option value="+data[i].gradeId+">"+data[i].name+"</option>");
					$("#link_selectGrade").append($option);
				}
				$("#link_a").html("<a onclick='cancelLink()'>取消关联</a>");
			}
		});
	}
	//取消关联
	function cancelLink()
	{
		$("#paperLinkName1").val("${paper.paperLinkName}");
		$("#linkName").attr('flag',1);
		$("#linkName").show();
		$("#link_selectGrade").hide();
		$("#link_selectClass").hide();
		$("#link_a").html("设置关联");
		$("#link_a").html("<a onclick='setLink()'>设置关联</a>");
	}
	//设置级联
	function LinkLecture(gradeId)
	{
		$.ajax({
			async:true,
			url:"${pageContext.request.contextPath}/grade/classDetailNum",
			type:"POST",
			data:{"id":gradeId},
			dataType:"json",
			success:function(data)
			{
				$("#link_selectClass option").remove();
				if(data==0){
					$option=$("<option value=0>暂无章节</option>");
					$("#link_selectClass").append($option);
					return;
				}
				for(var i=1;i<=data;i++)
				{
					$option=$("<option value="+(i)+">第"+i+"讲</option>");
					$("#link_selectClass").append($option); 
				}
			}
		});
	}
	//提交表单
	function checkAll(){
		var flag =  checkPaperName($('#paperName')[0],$('#paperNameInfo'))&checkNumber($('#paperSorce').val(),0,$('#paperSorceInfo'))&
				checkNumber($('#paperTime').val(),0,$('#paperTimeInfo'));
		if(flag==0){ return false;}
		$tr = $("#ruleTable tr[name='rule']");
		if($tr.length==0) {$("#setInfo").html("请设置大题");return false;}
		var total = 0;var txtRuleNo="";
		for(var i=0;i<$tr.length;i++)
		{
			var no = $($tr[i]).attr('no');
			txtRuleNo = txtRuleNo+$("#txtRuleNo"+no).val()+",";
			var title_a = $("#title_a"+no).val();//标题
			var title_b = $("#title_b"+no).val();//说明
			var questionNum = $("#questionNum"+no).val();//共多少题
			var questionSorce = $("#questionSorce"+no).val();//每题多少分
			var sorceSet = $("#sorceSet"+no).val();//答错扣多少分，少选得多少分
			alert(no+";"+title_a+";"+title_b+";"+questionNum+";"+questionSorce+";"+sorceSet)
			if($("#sorceSetModel"+no).val()==0)	//普通的评分规则
			{
				sorceSet = 1;
			}
			if(isNaN($("#txtRuleNo"+no).val())||(!title_a||!$.trim(title_a))||(!title_b||!$.trim(title_b))||!checkNumber(questionNum,0,$("#asdf"))||!checkNumber(questionSorce,2,$("#asdf"))||!checkNumber(sorceSet,2,$("#asdf")))
			{
				$("#ruleInfo").html("请认真填写");
				return false;
			}
			total = total + Number(questionNum)*Number(questionSorce);//累加每题总分
			//设置大题标题
			$("#ruleTitle"+no).val(title_a+"@@@"+title_b);
			//设置评分规则 
			$("#ruleSorceSet"+no).val(""+$("#sorceSetModel"+no).val()+"|"+sorceSet);
		}
		if(flag==1)
		{	
			//计算总分与各题设置是否一致
			if(total!=Number($("#paperSorce").val()))
			{
				$("#ruleInfo").html("试卷总分和每大题的设置不一致");
				return false;
			}
			if($("#linkName").attr('flag')==0)
			{
				if($("#link_selectGrade").val())
				{
					$("#paperLinkName").val($("#link_selectGrade option[value="+$("#link_selectGrade").val()+"]").html());
				}
				if($("#link_selectClass").val())
				{
					$("#paperLinkName").val($("#paperLinkName").val()+$("#link_selectClass option[value="+$("#link_selectClass").val()+"]").html());
				}
			}
			return true;
		}else
		{
			return false;
		}
		
	}
	function commit()
	{
		//设置title,设置sorceSet评分规则
		if(checkAll())
		{
			$("#form1").submit();
		}
	}
</script>

</html>
