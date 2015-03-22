<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">

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
                <div class="Analysis1" style="margin: auto auto 5px;">
                	<strong>【本题分数】</strong>：${q.standardScore }&nbsp;&nbsp;&nbsp;&nbsp;<strong style="color:#EE0000">【您的自评分】</strong>：${q.userScore }
                </div>
                <div class="Analysis2">
                	<strong>标准答案:</strong>
                    	${q.questAnalysis }
                </div>
            </s:if>
            <s:else>
            	<div class="Analysis1" style="margin: auto auto 5px;">
        			<strong style="color:#EE0000">【正确答案】</strong>：
        					${q.questAnswer }&nbsp;&nbsp;&nbsp;&nbsp;<strong>【您的答案】</strong>：<s:if test="#q.userAnswer==null||#q.userAnswer.equals('')">空</s:if><s:else>${q.userAnswer }</s:else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        					<s:if test="#q.userAnswer.equals(#q.questAnswer)"><span style="color:red">√</span></s:if>
        					<s:else><span style="color:red">×</span></s:else>
        					&nbsp;&nbsp;&nbsp;&nbsp;<strong>【本题分数】</strong>：${q.standardScore }&nbsp;&nbsp;&nbsp;&nbsp;<strong style="color:#EE0000">【您的得分】</strong>：${q.userScore }
        					<br>
        		<strong>【参考解析】</strong>： ${q.questAnalysis }
    		</div>
            </s:else>
            </s:iterator>
            <input id="allQuestionId${ruleId }" type="hidden" value='<s:iterator value="list" var="q" status="no"><s:if test="#q.questType==4">${q.questId }#</s:if></s:iterator>'>
            <input type="hidden" id="count${ruleId }" value="${count }">
