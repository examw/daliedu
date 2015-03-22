<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	$(function(){
		$divs = $(".SelectAnswer");
		for(var i=0;i<$divs.length;i++)
		{	
			var num = Number($($divs[i]).attr('num'));
			if(!$($divs[i]).html()||!$.trim($($divs[i]).html()))
			{
				$($divs[i]).html("<div style='float:left;padding-top:5px;'>选择答案：</div>");
				for(var j=0;j<num;j++)
				{
				var type=$($divs[i]).attr('qtype');
				var qid = $($divs[i]).attr('qid');
				var canshu = $($divs[i]).attr('qrid')+","+$($divs[i]).attr('qid');
				if(type==1) //单选题
				{
					$label='<label class="input_select" for="List_Select'+qid+'['+(j+1)+']">'+String.fromCharCode(65+j)+'<input id="List_Select'+qid+'['+(j+1)+']" name="List_Select'+qid+'" onclick="SaveAnswer('+canshu+');" type="radio" value="'+String.fromCharCode(65+j)+'"></label>&nbsp;&nbsp;&nbsp;&nbsp;';
				}else if(type==2)//多选题
				{
					$label='<label class="input_select" for="List_Select'+qid+'['+(j+1)+']">'+String.fromCharCode(65+j)+'<input id="List_Select'+qid+'['+(j+1)+']" name="List_Select'+qid+'" onclick="SaveAnswer('+canshu+');" type="checkbox" value="'+String.fromCharCode(65+j)+'"></label>&nbsp;&nbsp;&nbsp;&nbsp;';
				}				
				$($divs[i]).append($label);
				}
				$mark = $('<span  class="input_select right" ><a name="a_mark" href="javascript:;">暂不确定</a></span>');
				$($divs[i]).append($mark);
			}
		}
		//修改点击选中后的样式
		$("input[type=radio]").change(function(){
			$(this).blur();
			$(this).parent().addClass('input_select1');
			$(this).parent().siblings().removeClass('input_select1');
		});
		$("input[type=checkbox]").change(function(){
			$(this).blur();
			if($(this).attr('checked'))
			{
				$(this).parent().addClass('input_select1');
			}else
			{
				$(this).parent().removeClass('input_select1');
			}
		});
		//控制标记样式
		$("a[name='a_mark']").toggle(function(){
			$(this).parent().parent().parent().addClass("mark");
			markCount++; $("#MarkedNum").html(markCount);
			$(this).html("取消标记");
		},function(){
			$(this).parent().parent().parent().removeClass("mark");
			markCount--;$("#MarkedNum").html(markCount);
			$(this).html("暂不确定");
		});
		//控制每个问题样式
		$(".question").hover(
			function(){
				if($(this).find("a[name='a_mark']").html()=="暂不确定")
				{
					$(this).addClass('questionhover');
				}
			},
			function(){
				$(this).removeClass('questionhover');
			}
		);
		//控制选项的样式
		$("label").hover(function(){
			if(!$(this).find("input").attr('checked'))
			{
				$(this).addClass("labelhover");
			}
		},function(){$(this).removeClass("labelhover");});
		//纠错弹出框
		$(".Correction").live("click",function(){
			ExamID =  $(this).attr("eid");
			$.get("../memberCenter/findQuestionError.html",function(html){
				FrameDialog=art.dialog({id:"FrameDialog",title:"错题举报",content:html,lock:true,opacity:0.5,padding:0});
			});	
		});
	});
//----保存答案函数只适合选择题
function SaveAnswer(RuleId,ExamID){	
	var SelObj = $("input[name='List_Select"+ExamID+"']:checked");
	var Value ='';
	for(var j=0;j<SelObj.length;j++){
		if (Value == '')
			Value = $(SelObj[j]).val();
		else
			Value = Value +','+ $(SelObj[j]).val();
	}
	editAnswer(RuleId+"-"+ExamID,Value);
}
function checkContent(obj)
{
	var value = $(obj).val();
	var rid = $(obj).attr('qrid');
	var qid = $(obj).attr('qid');
	if(!value||!$.trim(value))	//为空
	{
		//没填任何内容
		if($(obj).attr('isAnswer')==0) 
		{
		
		}else
		{
			$("#dnum"+rid).html(Number($("#dnum"+rid).html())-1);
			//总题数
			$("#MyExamNum").html(Number($("#MyExamNum").html())-1);
			$("#ElseExamNum").html(Number($("#totalNum").html())-Number($("#MyExamNum").html()));
			editAnswer2(rid+"-"+qid,'');
			$(obj).attr('isAnswer',0);
		}
	}else
	{
		$(obj).attr('isAnswer',1);	
		$("#dnum"+rid).html(Number($("#dnum"+rid).html())+1);
		$("#MyExamNum").html(Number($("#MyExamNum").html())+1);
		$("#ElseExamNum").html(Number($("#totalNum").html())-Number($("#MyExamNum").html()));
		editAnswer2(rid+"-"+qid,value.replace(/[\s]+/g," "));
	}
}	
</script>
<s:iterator value="list" var="q" status="no">
			<div class="question"  onmouseover="javascript:$(this).find('.Correction').show();" onmouseout="javascript:$(this).find('.Correction').hide();">
            <div class="Problem" style="position:relative">
                <strong>第  ${no.index+1+qNum} 题</strong>
                ${q.formatString }
                <a class="Correction" eid="${q.questId }" style="display:none" href="javascript:;">纠错</a>
            </div>
            <s:if test="#q.questType==3">
            	<div class="SelectAnswer" id="Sel${q.questId }" num="${q.questOptionNum }" 	qid="${q.questId }" qtype="${q.questType }">
            	<div style="float:left; padding-top:5px;">选择答案：</div>
              <label for="List_Select${q.questId }[1]" class="input_select">√ <input id="List_Select${q.questId }[1]" type="radio" name="List_Select${q.questId }" value="T" onclick="SaveAnswer(${q.questRuleId},${q.questId});" /></label>&nbsp;&nbsp;&nbsp;&nbsp;
                <label for="List_Select${q.questId }[2]" class="input_select">× <input id="List_Select${q.questId }[2]" type="radio" name="List_Select${q.questId }" value="F" onclick="SaveAnswer(${q.questRuleId},${q.questId });" /></label>&nbsp;&nbsp;&nbsp;&nbsp;
               <span  class="input_select right" ><a name="a_mark" href="javascript:;">暂不确定</a></span>
                </div>
            </s:if>
            <s:elseif test="#q.questType==4">
            	<div class="Problem2"><strong>答题区:</strong><br><textarea name="textarea[${no.index+textareaNum }]" qid="${q.questId }" qtype="${q.questType }" qrid="${q.questRuleId }" class="textarea" cols="75" rows="8" onblur="checkContent(this);" isAnswer=0></textarea>
            	<input type="hidden" name="qids[${no.index+textareaNum }]" value="${q.questId }">
            	 <div style='float:right;font-family:Arial;font-weight:normal;font-size:13px'>&nbsp;<a name='a_mark' href='javascript:;' >暂不确定</a>
                </div></div>
            </s:elseif>
            <s:else>
            	<div class="SelectAnswer" id="Sel${q.questId }" num="${q.questOptionNum }" 	qid="${q.questId }" qtype="${q.questType }" qrid="${q.questRuleId }">
               
                </div>
            </s:else>
             </div>
            </s:iterator>
            <input id="allQuestionId${ruleId }" type="hidden" value='<s:iterator value="list" var="q" status="no"><s:if test="#q.questType==4">${q.questId }#</s:if></s:iterator>'>
