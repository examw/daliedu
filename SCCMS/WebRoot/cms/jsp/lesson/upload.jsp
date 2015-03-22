<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<style type="text/css">
body {
	font: 12px/ 16px Arial, Helvetica, sans-serif;
}
#fileQueue {
	width: 400px;
	height: 300px;
	overflow: auto;
	border: 1px solid #E5E5E5;
	margin-bottom: 10px;
}
a{
    background: url("http://x.libdd.com/farm1/90ecce/a28632b4/follow-btn.png") no-repeat scroll 0px 0px transparent;
    display: inline-block;
    height: 30px;
    width: 120px;
    line-height: 30px;
    text-align: center;
    color: rgb(100%,0%,0%);
    text-shadow: none;
}
</style>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>文件上传</title>
		<link href="${pageContext.request.contextPath}/cms/css/uploadify.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/cms/js/swfobject.js"></script>
		<script type="text/javascript"src="${pageContext.request.contextPath}/cms/js/jquery.uploadify.v2.1.4.js"></script>

		<script type="text/javascript">
		function showResult() {//删除显示的上传成功结果   
			$("#result").html("");
		}
		$(document).ready(function() {
			$('#fileInput').uploadify( {
				'uploader' : '${pageContext.request.contextPath}/cms/js/uploadify.swf',
				'script' : '${pageContext.request.contextPath}/grade/uploadFile;jsessionid=<%=session.getId()%>', 
				'folder' : 'upload',
				'cancelImg' : '${pageContext.request.contextPath}/cms/css/images/cancel.png',
				'fileDataName' : 'fileInput', //和input的name属性值保持一致就好，Struts2就能处理了   
				'queueID' : 'fileQueue',
				'auto' : false,//是否选取文件后自动上传   
				'multi' : true,//是否支持多文件上传 
				'simUploadLimit' :5,//一次同步上传的文件数目   
				'fileDesc' : '支持格式:rar/doc/docx/zip/pdf/txt', //如果配置了以下的'fileExt'属性，那么这个属性是必须的 
				'fileExt' : '*.rar;*.doc;*.docx;*.zip;*.pdf;*.txt',//允许的格式 
				'queueSizeLimit':5,
				'sizeLimit' : 5120000, //单位为字节
				'buttonText' : '增加上传文件',//按钮上的文字   
				'displayData' : 'percentage',//有speed和percentage两种，一个显示速度，一个显示完成百分比    
				'onError' : function(event, ID, fileObj, errorObj) {
					if (errorObj.type === "File Size") {
						alert('超过文件上传大小限制,文件会被自动清除！');
						$('#fileInput').uploadifyClearQueue(ID);
					}
				},
				'onQueueFull': function(event,data) {  //清除一个的时候.对应的循序清楚数组中的，后面的向前赋值。
	     					alert("上传数目已满. 最多上传5个文件！");
	    		 },
				'onComplete' : function(event, queueID, fileObj, response, data) {
				   	$("#result").html(response); 					//显示上传成功结果
				    setInterval("showResult()", 4000); 				//两秒后删除显示的上传成功结果 
				}
	
			});
	
		});
	</script>
	</head>
	<body>
		<!--显示结果-->
		<div id="fileQueue"></div>
		<input type="file" name="fileInput" id="fileInput" />
		<BR/>
		<BR/>
		<a  href="javascript:$('#fileInput').uploadifyUpload();" style=" background:#1B3160 url('${pageContext.request.contextPath}/cms/images/index/top.jpg') repeat-x ;');">开始上传</a>
		<a href="javascript:$('#fileInput').uploadifyClearQueue();">取消上传队列</a>
		<br>
		<div id="result"></div>
	</body>
</html>

