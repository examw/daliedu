<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我要提问  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<link rel="stylesheet" type="text/css" href="../ueditor/themes/default/css/ueditor.css" />
<script type="text/javascript">window.UEDITOR_HOME_URL= "../ueditor/"</script>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript" src="../ueditor/editor_config.js"></script>
<script type="text/javascript" src="../ueditor/editor_all.js"></script>
<style type="text/css">	
#liLesson, #liRelate {
	margin-top: 15px;
    width: 250px;
}
ol li{float:left;margin-left: 16px;}
ol li select {
	 margin-top: 6px;
    width: 200px;
}
#liClass, #liType {
    padding-left: 0;
    margin-top: 15px;
    text-align: right;
    width: 270px;
}
.bt {
    clear:both;
    padding-top: 22px;
}
.span_txt {
    color: #F25500;
    padding-left: 100px;
    padding-top: 7px;
}
.ms {
    padding-left: 40px;
    padding-top: 22px;
    width:520px;
}
.pic_4 {
    float: left;
    margin-left: 216px;
    margin-top: -25px;
    width: 67px;
}
.sea_02 {
    clear: both;
    color: #7F7F7F;
}
.sea_03 {
    background: url("../images/x_pic_05.gif") repeat-x scroll 0 0 transparent;
    border: 1px solid #999999;
    height: 21px;
}
.errText{border:1px solid red!important;background:#fff7f7!important}
.valiErr{position:absolute;background:url(../images/tip_01.gif) no-repeat right 0;height:40px;line-height:40px;padding-right:10px;width:auto}
.valiErr span{padding-left:10px;display:inline-block;background:url(../images/tip_01.gif) no-repeat left 0;color:Gray;}
.valiErr2{position:absolute;height:18px;padding-right:20px;text-align:right;background:url(../images/err.gif) no-repeat right center;color:Gray;padding-top:1px}
</style>
<script language="javascript" src="../js/jquery-1.4.3.js"></script>
<script language="javascript">
	$(function(){$("#question_").addClass("hhover")});
 	var gradeId,examId,classId;
 	$(function(){
 		var cId="${classId}";
 		var gId ="${gradeId}";
		var eId ="${examId}";
		 if(gId.length<=0||gId==""){
		 	gradeId=0;
		 }else{
		 	gradeId=parseInt(gId);
		 }
		 if(eId.length<=0||eId==""){
		 	examId=0;
		 }else{
		 	examId=parseInt(eId);
		 }  
		  if(cId.length<=0||cId==""){
		 	examId=0;
		 }else{
		 	classId=parseInt(cId);
		 }  
 	});
		
	$(function(){
		var $s1=$("#ddlLesson");
		var $s2=$("#ddlClass");
		var $s3=$("#ddlRelate");
		$.ajax({
			async:true,
			type:"POST",
			url:"../member/getExam",
			success:function(data){
				for(var i=0;i<data.length;i++)
				{
					if(data[i].examId==examId){
						$option = $('<option value="'+data[i].examId+'" selected="selected" >'+data[i].examName+'</option>');
						$("#ddlLesson").append($option);
					}else{	
						$option = $('<option value="'+data[i].examId+'">'+data[i].examName+'</option>');
						$("#ddlLesson").append($option);
					}
					
				}
			},
			error:function(){}
		});
		
		$("#ddlLesson").change(function(){
			$("#ddlClass").html("<option value='0'>请选择</option>");
			$s3.html("<option value='0'>请选择</option>");
			var s1_curr_val = this.options[this.selectedIndex].value;
			getGrade(s1_curr_val);	
		});
		$s2.change(function(){
			$s3.html(" <option value='0'>请选择</option> ");
			var s1_curr_val = $s1[0].options[$s1[0].selectedIndex].value;
			if(this.selectedIndex==-1) return;
			var s2_curr_val = this.options[this.selectedIndex].value;
			getClassDetail(s2_curr_val);
			
		});
		getGrade(examId);
	});
	function getGrade(examId){
		$.ajax({
			async:true,
			type:"POST",
			data:{"examId":examId},
			url:"../member/getGrade",
			success:function(data){
				for(var i=0;i<data.length;i++)
				{
					if(data[i].gradeId==gradeId){
						$option = $('<option value="'+data[i].gradeId+'" selected="selected" >'+data[i].name+'</option>');
						$("#ddlClass").append($option);
					}else{
						$option = $('<option value="'+data[i].gradeId+'">'+data[i].name+'</option>');
						$("#ddlClass").append($option);
					}
					
				}
				$("#ddlClass").change();
			},
			error:function(){}
		});
	}
	function getClassDetail(gradeId){
		$.ajax({
			async:true,
			type:"POST",
			data:{"gradeId":gradeId},
			url:"../member/getClassDetail",
			success:function(data){
				for(var i=0;i<data.length;i++)
				{
					if(data[i].classId==classId){
						$option = $('<option value="'+data[i].classId+'" selected="selected" >'+data[i].classTitle+'</option>');
						$("#ddlRelate").append($option);
					}else{
						$option = $('<option value="'+data[i].classId+'">'+data[i].classTitle+'</option>');
						$("#ddlRelate").append($option);
					}
					
				}
			},
			error:function(){}
		});
	}
	
	function vali(){
        var err="";
        var b = true;
        if($("#ddlLesson").val()=="0") {
            b = false;
            vali_showerr("ddlLesson", "请选择考试类型", "");
        }
        if($("#ddlClass").val()=="0") {
            b = false;
            vali_showerr("ddlClass", "请选择科目", "");
        }
        if($("#ddlRelate").val()=="0") {
            b = false;
            vali_showerr("ddlRelate", "请选择讲", "");
        }
        if($("#ddlQuestionType").val()=="0") {
            b = false;
             vali_showerr("ddlQuestionType", "请选择问题类型", "");
        }
        if (!checkStr("txtTitle", true, 5, 100)){
            vali_showerr("txtTitle", "不能为空,且必须为5~100个字符", "inside");b = false;}
        if (editor.getContentTxt().length<10 || editor.getContentTxt().length>1000){
            vali_showerr("liContent", "详细描述必须是10-1000个字符", "");b = false;}
        else {
            vali_hideerr("liContent");
        }
        /* if(b && setLesson() && vali_isPass("from"))
        {
            $("#emma").show();
            return true;
        } */
        //alert(b);
        //$("#examId").val($("#ddlLesson").val());
        //$("#gradeId").val($("#ddlClass").val());
        //$("#classId").val($("#ddlRelate").val());
        //$("#source").val($("#ddlQuestionType").val());
        if(b){
        var pathStr = $("#ddlLesson option:selected").text()+" > "
        			+$("#ddlClass option:selected").text()+" > "
        			+$("#ddlRelate option:selected").text()+" > "
        			+$("#ddlQuestionType option:selected").text();
        var data1 = {"examId":$("#ddlLesson").val(),"gradeId":$("#ddlClass").val(),
        			"classId":$("#ddlRelate").val(),"questionSource":$("#ddlQuestionType").val(),
        			"questionTitle":$("#txtTitle").val(),"questionContent":editor.getContent(),"questionPath":pathStr
        			};
        $.ajax({
        async:true,
        url:"../member/addQuestion",
        type:"POST",
        data:data1,
        success:function(data){
        	if(data)
        	{
        		alert("提交成功");
        		window.location="../member/myQuestion";
        	}
        	},
        error:function(){ alert("系统错误");}
        });}
        return b;
    }
    function vali_showerr(id, txt, mode) {
    var object = $("#" + id);
    if (object.length == 0)
        return;
    if (object.attr("valiErr") == "true")
        return;
    object.addClass("errText");
    object.attr("valiErr", "true");
    if (mode != "inside") {
        $("body").append("<div class=\"valiErr\" id=\"vali" + id + "\"><span>" + txt + "</span></div>");
        var xy = getxy(object.get(0));
        var errDiv = $("#vali" + id);
        errDiv.css("left", xy[1] + xy[2]-errDiv.width()-10 + "px");
        errDiv.css("top", xy[0] + xy[3] + "px");
        errDiv.show();
    }
    else {
        $("body").append("<div class=\"valiErr2\" id=\"vali" + id + "\">" + txt + "</div>");
        var xy = getxy(object.get(0));
        var errDiv = $("#vali" + id);
        if (object.is("select"))
            errDiv.css("left", xy[1] + xy[2] + 10 + "px");
        else
            errDiv.css("left", xy[1] + xy[2] - errDiv.width() - 25 + "px");
        errDiv.css("top", xy[0] + "px");
        errDiv.css("height", xy[3] + "px");
        errDiv.css("line-height", xy[3] + "px");
        errDiv.show();
    }
    $("#vali" + id).click(function () {
        vali_hideerr(id);
        $("#" + id).focus();
    });
    object.focus(function () {
        vali_hideerr(id);
    });
}
function checkStr(id, must, minL, maxL) {
    var s = $("#" + id).val();
    if (must && isEmpty(id)) {
        return false;
    }
    else if ($.trim(s) != "") {
        if (s.length < minL || s.length > maxL) {
            return false;
        }
    }
    return true;
}

function isEmpty(id) {
    var s = $("#" + id).val();
    if ($.trim(s) == "") {
        return true;
    }
    return false;
}
function getxy(e) {
    var a = new Array()
    var t = e.offsetTop;
    var l = e.offsetLeft;
    var w = e.offsetWidth;
    var h = e.offsetHeight;
    while (e = e.offsetParent) {
        t += e.offsetTop;
        l += e.offsetLeft;
    }
    a[0] = t; a[1] = l; a[2] = w; a[3] = h;
    return a;
}
function vali_hideerr(id) {
    var object = $("#" + id);
    $("#vali" + id).remove();
    object.removeClass("errText");
    object.attr("valiErr", "");
}
</script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../member/myQuestion">学习答疑</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我要提问</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li ><a href="../member/allQuestion">最新问题</a></li>
<li id="xz">我的答疑</li>
<li><a href="../member/myQuestionCollect">答疑收藏</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
 <div class="" id='listContent'>
  
  <ul class="info">
  <li class="lfhre_sp">
  <ol>
  <li ><a href="../member/myQuestion">我的答疑</a></li>
  <li class="infoxz">我要提问</li>
  </ol>
  </li>
  <li class="ctt_lfhre"><h1>我要提问：</h1></li>
  <li class="sea_02">
  		<ol>
                    <li id="liLesson">
                        <select id="ddlLesson" onchange="">
                        	 <option value="0">请选择</option> 
                        </select>
                        	
                        <span></span>
                    </li>
                    <li id="liClass">
                        <select id="ddlClass" >
                        	<option value="0">请选择</option> 
                        </select>
                        <span></span>
                    </li>
                    <li id="liRelate">
                        <select id="ddlRelate" >
	<option value="0">请选择</option>
</select>
                        <span></span>
                    </li>
                    <li id="liType">
                        <select id="ddlQuestionType">
	<option value="0">请选择</option>
	<option value="1">视频讲座</option>
	<option value="2">在线作业</option>
	<option value="3">历年真题</option>
	<option value="4">教务安排</option>

</select>
                        <span>
                        </span>
                    </li>
                </ol>                           
                </li>
                <li class="bt"><span style="float:left; margin-left: 40px;_margin-top:8px;">问题标题:</span><input name="question.questionTitle" type="text" id="txtTitle" class="sea_03" style="width:455px;" /><p class="span_txt">不少于20个汉字.如：关于营养师精讲班第17讲的录音讲座问题</p></li>
                <li class="ms"><dl><dd style="float:none;_margin-bottom:0;">详细描述:</dd><dd id="liContent">
                <textarea name="question.questionContent" rows="2" cols="20" id="txtContent" style="width:500px;">
</textarea></dd>
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
             initialFrameWidth:510,
        initialFrameHeight:380,
        focus:true
        //pasteplain:true        //纯文本粘贴
        } );
        editor.render('txtContent');
</script> 
                </dl> 
                <dl style="height:20px;width:500px;margin-top: 5px;_margin-top:0;display: inline-block;">
<!--                 <dd><span style="_float:left;_margin-top:7px;">验证码:</span></dd><dd style="width:400px"><input name="ctl00$cp1$txtCode" type="text" id="txtCode" class="sea_03" style="height:16px;width:50px;margin-right:6px;" /> <img id="ctl00_cp1_Image1" src="../../checkcode.aspx" /></dd>
 -->                 </dl>
                <span class="pic_4" style="position: relative;"> </form>
                   <em id="emma" style="display: none;"></em> <input type="image"  id="ctl00_cp1_btnAdd" src="../images/pic_009.gif" onclick="return vali();" />
                    
                    <input type="hidden" id="hfLesson" /></span></li>  
  </ul>

</div>
</div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</body>
</html>
