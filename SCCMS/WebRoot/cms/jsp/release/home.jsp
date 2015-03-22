<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>发布首页</title>   
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog2.js" type="text/javascript"></script>
    <style type="text/css">
    .l-panel td.l-grid-row-cell-editing { padding-bottom: 2px;padding-top: 2px;}
        .l-table-edit {margin-top:180px}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
</head>
<body style="padding:2px;text-align:center;">
    <center>
   	<table cellpadding="0" cellspacing="0" class="l-table-edit">
   		<tr>
            	<td><input type="button" value="发布" onclick="f_release()" class="l-button l-button-reset"/></td>
            	<td><input type="button" value="预览" id="Button1" class="l-button l-button-submit" onclick="f_preview()"/></td>
        </tr>  
   	</table>
    </center>
<script type="text/javascript">
    //预览
    function f_preview(){
    	 window.loginWin=$.ligerDialog.open({ 
	          	  	url: "http://vps.chuji8.com/?date="+new Date(),
	          	    title:'预览',
	          	    isHidden: false,
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 500,width:900
	          	    });	       
    }   
    
    function f_release(){
    	$.post("${pageContext.request.contextPath}/system/release",
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('发布成功');
          						}else{
          							$.ligerDialog.error('发布失败');
          						}
							},
							"json"
          					);
    }
 </script>
</body>
</html>
