<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>回答问题   答疑室</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<link rel="stylesheet" type="text/css" href="../ueditor/themes/default/css/ueditor.css" />
<script type="text/javascript">window.UEDITOR_HOME_URL= "/ueditor/"</script>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript" src="../ueditor/editor_config.js"></script>
<script type="text/javascript" src="../ueditor/editor_all.js"></script>
<style type="text/css">
	.link{cursor: pointer;}
	.qingwen_a {
    border: 1px solid #C6DBEB;
    color: #166AA1;
}
.qw_sp {
    background: none repeat scroll 0 0 #ECF7FE;
    display: block;
    height: 30px;
    padding-top: 12px;
}
.qw_sp dl dt {
    float: left;    text-indent: 17px;    width: 42px;
}
.qw_sp dl dd {
    float: left;
}
.ddq_1 {
    font-size: 14px;
    width: 533px;
}
.qw_wt {
    background: url("../images/pic_16.gif") repeat-x scroll 0 bottom transparent;
    line-height: 21px;
    padding-bottom: 5px;
    padding-left: 33px;
    padding-top: 10px;
}
.qw_xx {
    color: #525252;
    display: block;
    height: 38px;
    line-height: 38px;
}
.qw_xx dl dd {
    float: left;
    text-indent: 20px;
    width: 166px;
}
.qingwen_b {
    background: none repeat scroll 0 0 #FFFFEA;
    border: 1px solid #FEDC9C;
    margin-top: 20px;
    position: relative;
}
.qw_bsp {
    background: url("../images/pic_16.gif") repeat-x scroll 0 bottom transparent;
    display: block;
    height: 30px;
    padding-top: 15px;
}
.qw_bsp dl dd {
    color: #000000;
    float: left;
    font-size: 14px;
}
.qw_bsp dl dt {
    float: left;
    text-align: center;
    width: 30px;
}
.qw_bsp em {
    background: url("../images/pic_22.gif") no-repeat scroll 0 0 transparent;
    display: block;
    height: 9px;
    left: 0;
    margin-left: 33px;
    margin-top: -9px;
    position: absolute;
    top: 0;
    width: 17px;
}
.qw_hd {
    background: url("../images/pic_16.gif") repeat-x scroll 0 bottom transparent;
    color: #000000;
    line-height: 21px;
    padding-bottom: 10px;
    padding-left: 10px;
    padding-top: 10px;
}
.qw_hd p {
    color: #E62000;
}
.qw_bbsp {
    display: block;
    height: 69px;
    padding-left: 3px;
    width: 650px;
}
</style>
<script language="javascript">
function commit()
{
	var content = editor.getContentTxt();
	var questionId = "${questionId}";
	if(!$.trim(content)||content.length<10)
	{
		$("#info").html("请认真回答！");
		return;
	}
	$("#info").html("");
	var r = confirm("确定提交么,交了就不能改了!");
	if(r)
	{
	$.ajax({
		async:true,
		type:"POST",
		url:"../question/answer",
		data:{"answer.questionId":questionId,"answer.answerContent":content},
		dataType:"json",
		success:function(data){
			if(data)
			{
				alert("提交成功");
				window.location="../question/questionList";
			}		
		},
		error:function(){alert("系统错误");}
	});
	}
}
</script>
</head>
<body>
<div class="center_nav nav_main center">
        <ul class="nav_chn">
            <li id="logo"><a href="#"><img height="36" src="../images/wxzx1.gif"
            width="155"></a></li>

<!--             <li class="nhover"><a href=
            "/memberCenter/member.jsp">我的首页</a></li>

            <li><a href="#">报名中心</a></li>

            <li><a href="#">学习答疑</a></li>

            <li><a href="#">网校首页</a></li> -->
        </ul>
        <div class="nav_right">
            <div class="login">
                欢迎您 &nbsp;${teacher.tchUsername }&nbsp;| <a href=
                "../question/teacherLogout">退出</a>
            </div>

            <div class="search">
                <span>搜索:</span>
                <h2><input name="Keyword" type="text"> <img src=
                "../images/search.gif"></h2>
            </div>
        </div>
    </div>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<div class="RightList" style="width:900px">
<p class="weizhi">问题路径：${question.questionPath }</p>
<div class="List" style="width:900px">
<div class="List" style="border-top:1px solid #C6DBEB"> 
<div class="ListContent" style="width:870px">
 <div class="" id='listContent' >
  <ul class="info" style="width:870px">
  <li class="">
  	    <div class="qingwen_a">
                <span class="qw_sp">
                    <dl>
                        <dt><img src="../images/answer0.gif" width="16" height="16" /></dt>
                        <dd class="ddq_1"><strong>标题：</strong><span style="color:black;">${question.questionTitle}</span></dd>
                    </dl>
                </span>
                <div class="qw_wt center" id="qcon">
						${question.questionContent }
                </div>
                <span class="qw_xx center">
                <dl><dd>提问人：${question.student.stuUsername }</dd><dd  style="width:200px;">问题类型：${question.questionSource }</dd><dd style="width:200px;">提问时间：<fmt:formatDate value="${question.questionAddTime }" type="both" pattern="yyyy-MM-dd HH:mm" /></dd></dl></span>             
                </div>
                <s:if test="question.tbAnswers.size()!=0">
                <s:iterator value="question.tbAnswers" var="answer">
				<div class="qingwen_b">
                    <span class="qw_bsp center">
                    <em></em>
                    <dl>
                        <dt><img src="../images/answer1.gif" width="16" height="16" /></dt>
                        <dd><strong>回答：</strong></dd>
                    </dl>
                    </span>
                <div class="qw_hd center">
                      	<p>学员您好：</p>
                      	<p>${answer.answerContent }</p>
                      	<p>祝您学习愉快！</p>
                </div>
                    <span id="reStar" class="qw_bbsp center">
                        <span>解答团队： | 解答时间：<fmt:formatDate value="${answer.answerTime }" type="both" pattern="yyyy-MM-dd HH:mm" /></span></span>
                </div> 
                </s:iterator>
                </s:if>
                <s:else>
               <div class="qingwen_b">
                    <span class="qw_bsp center">
                    <em></em>
                    <dl>
                        <dt><img src="../images/answer1.gif" width="16" height="16" /></dt>
                        <dd><strong>回答：</strong></dd>
                    </dl>
                    </span>
                <div class="qw_hd center">
                      	<textarea style="width:850px" rows="6" id="txtContent"></textarea>
                      	<script type="text/javascript">
						/*     var editor = new UE.ui.Editor();
    							editor.render("myEditor"); */
    							//1.2.4以后可以使用一下代码实例化编辑器
    							//UE.getEditor('myEditor')
   						 var editor;
        				editor = new UE.ui.Editor( { 
           				toolbars:[['fullscreen', 'undo', 'redo', '|','bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'removeformat',
            			'fontfamily', 'fontsize','forecolor','insertimage']],
            			initialContent:"",
             			initialFrameWidth:850,
        				initialFrameHeight:380,
        				focus:true
        				//pasteplain:true        //纯文本粘贴
        				} );
        				editor.render('txtContent');
						</script> 
                </div> 
                <div class="qw_hd center">
                	<input type="button" value="提交" onclick="commit();"/>
                	<span style="margin-left:20px;color:red" id="info"></span>
                </div>                   
                </div> 
                </s:else>
  </li>
  <li class="lfhre_li">
  </li>
  </ul>
</div>
</div>
</div>
</div>
</div>
<div id="foot">
<p><a href="#">中华考试网</a>|<a href="#">网站导航</a>|<a href="#">认证服务</a>|<a href="#">支付帮助</a>|<a href="#">意见反馈</a></p>
<p>Copyright &copy;	 2007-2012 中华考试网(www.youeclass.com) All Rights Reserved</p>
</div>
</div>
</body>
</html>
