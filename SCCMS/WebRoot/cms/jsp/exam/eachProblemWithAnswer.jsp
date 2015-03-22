<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
/* 	/* $(function(){
		$divs = $(".SelectAnswer");
		for(var i=0;i<$divs.length;i++)
		{	
			var num = Number($($divs[i]).attr('num'));
			if(!$($divs[i]).html()||!$.trim($($divs[i]).html()))
			{
				$($divs[i]).html(" 选择答案：");
				for(var j=0;j<num;j++)
				{
				var type=$($divs[i]).attr('qtype');
				var qid = $($divs[i]).attr('qid');
				if(type==1) //单选题
				{
					$label='<label class="input_select" for="List_Select'+qid+'['+(j+1)+']">'+String.fromCharCode(65+j)+'<input id="List_Select'+qid+'['+(j+1)+']" name="List_Select'+qid+'" onclick="SaveAnswer('+qid+');" type="radio" value="'+String.fromCharCode(65+j)+'"></label>&nbsp;&nbsp;&nbsp;&nbsp;';
				}else if(type==2)//多选题
				{
					$label='<label class="input_select" for="List_Select'+qid+'['+(j+1)+']">'+String.fromCharCode(65+j)+'<input id="List_Select'+qid+'['+(j+1)+']" name="List_Select'+qid+'" onclick="SaveAnswer('+qid+');" type="checkbox" value="'+String.fromCharCode(65+j)+'"></label>&nbsp;&nbsp;&nbsp;&nbsp;';
				}				
				$($divs[i]).append($label);
				}
			}
		}
	}); 
	function set_Cookie(K, V)
{
	var expdate = new Date();
	expdate.setTime (expdate.getTime() + (365 * 24 * 60 * 60 * 1000));	//365죺һʱ䣬(λ)
	document.cookie = K + "=" + V + "; expires=" + expdate.toGMTString() +  ";path=/;";
}	
//ݼַȡCOOKIEֵ
function get_Cookie_Val(E)
{
var arr = document.cookie.match(new RegExp("(^| )"+E+"=([^;]*)(;|$)"));
     if(arr != null) return unescape(arr[2]); else return false;
}

function EditCookies(CookieName,Key,Value){
	var ListStr,sarray,KeyStr,s = get_Cookie_Val(CookieName);
	if (s == false){
		set_Cookie(CookieName,'CookiesState&'+Key+'-'+Value);
	}
	else{
		var l = s.search(''+Key+'-');		//ҵʼλ
		var s1 = s.substr(l,s.length-l),leftstr=s.substr(0,l-1);   //ȡַ
		var r = s1.search('&'),rightstr='';				//һλÿʼ
		if (l > 0) {
			l += Key.length;
			if (r > 0){
				vlen = r - Key.length - 2;
				rightstr=s1.substr(r,s1.length);
			}
			else
				vlen = s.length - l;
			s = leftstr + '&'+Key+'-'+Value+rightstr;
			set_Cookie(CookieName,s);
		}
		else
			set_Cookie(CookieName,s+'&'+Key+'-'+Value);
	}
}
//----保存答案函数只适合选择题
function SaveAnswer(ExamID){	
	var SelObj = $("input[name='List_Select"+ExamID+"']:checked");
	var Value ='';
	for(var j=0;j<SelObj.length;j++){
		if (Value == '')
			Value = $(SelObj[j]).val();
		else
			Value = Value +', '+ $(SelObj[j]).val();
	}
	EditCookies("UserAnswer",ExamID,Value);
} */
</script>
<s:iterator value="list" var="q" status="no">
            <div class="Problem">
                <strong>第 ${no.index+1} 题</strong>
                ${q.formatString }
            </div>
            <s:if test="#q.questType==4">
            	<div class="Problem">
                    <strong>您的答案:</strong><br />
                    <textarea class="textarea" cols="75" disabled="disabled"
                    name="List_Select187183" rows="8"><s:if test="#q.userAnswer==null||#q.userAnswer.equals('')">空</s:if><s:else>${q.userAnswer }</s:else>
					</textarea>
                </div>
                <div class="Analysis2">
                	<strong>标准答案:</strong>
                    	${q.questAnalysis }
                </div>
            </s:if>
            <s:else>
            	<div class="Analysis1" style="margin: auto auto 5px;">
        			<strong>【您的答案】</strong>：<s:if test="#q.userAnswer==null||#q.userAnswer.equals('')">空</s:if><s:else>${q.userAnswer }</s:else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>【正确答案】</strong>：
        					${q.questAnswer }&nbsp;&nbsp;&nbsp;&nbsp;<br>
        		<strong>【参考解析】</strong>： ${q.questAnalysis }
    		</div>
            </s:else>
             <!-- <label class="input_select" for="List_Select412504[1]">A
                <input id="List_Select412504[1]" name="List_Select412504"
                onclick="SaveAnswer(412504,4);" type="radio" value=
                "A"></label>&nbsp;&nbsp;&nbsp;&nbsp;<label class="input_select"
                for="List_Select412504[2]">B <input id="List_Select412504[2]"
                name="List_Select412504" onclick="SaveAnswer(412504,4);" type=
                "radio" value="B"></label>&nbsp;&nbsp;&nbsp;&nbsp;<label class=
                "input_select" for="List_Select412504[3]">C <input id=
                "List_Select412504[3]" name="List_Select412504" onclick=
                "SaveAnswer(412504,4);" type="radio" value=
                "C"></label>&nbsp;&nbsp;&nbsp;&nbsp;<label class="input_select"
                for="List_Select412504[4]">D <input id="List_Select412504[4]"
                name="List_Select412504" onclick="SaveAnswer(412504,4);" type=
                "radio" value="D"></label>&nbsp;&nbsp;&nbsp;&nbsp; -->
            </s:iterator>
            <input id="allQuestionId${ruleId }" type="hidden" value='<s:iterator value="list" var="q" status="no"><s:if test="#q.questType==4">${q.questId }#</s:if></s:iterator>'>
