<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="no-cache" http-equiv="Pragma" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../css/ExamStyle_css.css" rel="stylesheet" type="text/css" />
    <title>自我评分:${paper.paperName}</title>
    <script language="javascript" src="../js/jquery-1.4.3.js"></script>
    <script language="javascript">
	var flag=true;
    </script>
    <style type="text/css">
   body {background-color: #a1a1a1;margin: 20px 0 20px 0;    font-size: 12px; text-align:center;}
    .main,.main1{background-color: #FFFFFF;width: 830px;margin: 0 auto}
    .contentcenter{padding:0px; margin: 22px 27px 5px 27px; font-size: 12px;line-height: 20px;text-align: center;color: #000000; clear:both}
    .title {font-family: Arial, Helvetica, sans-serif, "新宋体";font-size: 18px;font-weight: bold;color: #ff0000;line-height: 30px;}
    .btn {height:24px; padding:2px 2 0 2; border:1px solid #34a7db; background:url(../images/input_bg3.jpg);  font-size:12px; color:#000; cursor:pointer;}
    .btn1 {height:24px; padding:2px 2 0 2; border:1px solid #dea303; background:url(../images/input_bg3_.jpg); font-size:12px;color:#000;cursor:pointer;}
    button:hover{height:24px; padding:2px 2 0 2; border:1px solid #dea303; background:url(../images/input_bg3_.jpg); font-size:12px;color:#000;cursor:pointer;}
    .menu {background-color:#f7f7f7; line-height:22px; text-align:center; padding:5px;position: absolute;width:105px;top:100px;visibility: visible;z-index: 1; border: green 1px solid;}    .SubmitShow{ margin:3px 0 3px 0; padding:3px 0 3px 0;}
    .SubmitHidden{ display:none;}
    /*]]>*/
    </style>
</head>
<body>
    <form action="/member/manualMark" id="examda"
    method="post" name="examda" onsubmit="return flag;">
    	<input type="hidden" name="paperId" value="${paper.paperId }">
    	<input type="hidden" name="recordId" value="${record.id }">
        <div class="main">
<div style="width:195px; float:left;margin-top:27px" ><img src="../images/d_1.jpg" width="195" height="92" /></div>
<div style="border-bottom:#000000 solid 1px; height:41px;float:left; width:554px;padding-top:45px; padding-bottom:10px; text-align:center">考试时间：${paper.paperTime } 分钟 &nbsp; 考生：${student.stuUsername }&nbsp; 总分 ：${paper.paperScore } 分 </div>
<div style="height:92px; float:right; width:81px;;margin-top:27px"><img src="../images/d_2.jpg" width="81" height="92" /></div>
            <div class="contentcenter">
                <span class="title">手工评分</span>
            </div><br />

            <div style="text-align: center">
                <div class="RulesTitle">${paper.paperName }
                </div>
				<s:iterator value="list" var="q" status="no">
                <div class="Problem">
                    <!--题目-->${q.formatString }<br />
                </div>
				<input type="hidden" value="${q.questId }" name="qids[${no.index }]">
				<input type="hidden" value="${q.questRuleId }" name="rids[${no.index }]">
                <div class="Problem">
                    <strong>您的答案:</strong><br />
                    <textarea class="textarea" cols="75" disabled="disabled"
                    name="List_Select187183" rows="8"><s:if test="#q.userAnswer==null||#q.userAnswer.equals('')">空</s:if><s:else>${q.userAnswer }</s:else>
					</textarea>
                </div>

                <div class="Analysis2">
                    <strong>本题分数:</strong>${q.standardScore }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="ss_${q.questId }" type="hidden" value="${q.standardScore }" />
                    <strong>您的得分:</strong>
                    <input id="s_187183" name="scores[${no.index }]" 
                    onblur="if(parseInt(this.value)>parseInt(document.getElementById('ss_${q.questId}').value)){alert('对不起，你给的分数超过题目的分数，请查证！');flag=false;this.value='0';}"
                    onkeypress="if(event.keyCode < 45 || event.keyCode > 57){event.returnValue = false;}"
                    size="5" type="text" value="0" />&nbsp;分<br />
                    <strong>标准答案:</strong>
                    	${q.questAnalysis }
                </div>
                </s:iterator>
            <div class="contentcenter">
                <input class="regbutton4" type="submit" value=
                " 完 成 " />
            </div>
        </div>
        </div>
    </form>
</body>
</html>