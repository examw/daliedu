<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的投诉  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<style type="text/css">	
.List .tishi_b {
    background: none repeat scroll 0 0 #FFFFE9;
    border: 1px solid #FEDA99;
    margin-bottom: 10px;
    margin-top: 10px;
    padding: 10px;
    font-size: 14px;
}

.wzgk_two {
    line-height: 22px;
    padding-bottom: 15px;
    padding-top: 15px;
    width: 650px;
}
.center {
    margin-left: auto;
    margin-right: auto;
}
.ts_02 {
    color: #F25500;
    display: block;
    font-weight: bold;
}
.tsnr {
    line-height: 18px;
    margin: 10px 0;
}

.wzgk_two .tsnr_01 {
    color: #A2A2A2;
    font-size: 12px;
}
.wzgk_oneb {
    background: none repeat scroll 0 0 #FAFAFA;
    border: 1px solid #DFDFDF;
    clear: both;
    line-height: 24px;
    margin-bottom: 15px;
    padding: 10px;
    position: relative;
}
.back{
    float: right;
    height: auto;
    margin-top: 5px;
    width: 100%;
}
 .btn-go {
    background: none repeat scroll 0 0 #F66D19;
    color: #FFFFFF;
    float: right;
    font-weight: bold;
    height: 21px;
    line-height: 21px;
    margin-top: 2px;
    text-align: center;
    width: 100px;
    cursor: pointer;
}
</style>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript">
	$(function(){$("#complain_").addClass("hhover")});
</script>
</head>

<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../member/complainList">我的投诉</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的投诉</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li id="xz">我的投诉</li>
<li><a href="#">我要投诉</a></li>
</ul>
</span>
</h1>
 <div class="ctt_nrbox">
    <div class="xxzx_two center">
                            <div class="tishi_b">
                            	<ul>
                                	<li>·涉及课程：${ac.acName }</li>     
                                </ul>        
 
                            </div>


    <table  width="500" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td width="500" height="24" align="left" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>详细信息：</strong></td>
    <td width="168" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a">&nbsp;</td>
  </tr>
                      <tr>
    <td colspan="2" class="xxzx_ber_c font_14">

    	<div class="wzgk_two center">
            <span class="ts_02" style="word-break: break-all">投诉内容：</span><p class="tsnr">${ac.acContent }</p>
            <em class="tsnr_01">提交时间:${ac.acAddTime }</em></div>
            <div>
        

            <div class="wzgk_oneb">
			<s:if test="ac.tbReplies.size()!=0">
				<s:iterator value="ac.tbReplies" var="reply">
				<em></em>   <span class="ts_02">网校回复</span>
				 <p class="tsnr_01" style="word-break: break-all">${reply.replyContent }</p>
            	<span class="time_one">提交时间：${reply.replyAddTime }</span>
            	</s:iterator>
			</s:if>
          	<s:else>
          		<span class="">Sorry,暂时没有回复</span>
          	</s:else>
            
            </div>
                       
            
        </div>                   
         </td>
            </tr>
    </table>    
    <div class="back">
         <a class="btn-go" onclick="location='../member/complainList';">返回</a>
    </div>
    <div>
</div>
</div>
</div>
</div>
</div>
</div>

<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
