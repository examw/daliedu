<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script> 
     <script src="${pageContext.request.contextPath}/cms/js/ligerui.all.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog2.js" type="text/javascript"></script>
    <style type="text/css">
    	 .l-select{
    	border:1px solid #AECAF0; 
    	background:#DBEBFF url('../../images/controls/bg-trigger.gif') repeat-x left;} 
    </style>
</head>
<body style="padding: 4px; overflow: hidden;">
<div class="l-panel-search" >
 <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search" ltype="select" >
			<option value="all" selected="selected">全部</option>
			<option value="1">成功</option>
			<option value="0">失败</option>
			<option value="today">今天</option>
			<option value="week">近一周</option>
		</select>
    </div>
     <div class="l-panel-search-item">
     	<span style="font-size: 14px; color: green;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;精确搜索:</span>
    </div>
    <div class="l-panel-search-item">
        <input class="l-text" type="text" id="content"  style="height: 16px;"/>
    </div>
     <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search1" ltype="select">
			<option value="admUsername">按用户名</option>
			<option value="broswer" >浏览器</option>
			<option value="ip" >ip</option>		
		</select>
    </div>
    <div class="l-panel-search-item">
        <div id="searchbtn" class="l-btn"  style="width:80px;">搜索<div class="l-btn-l"></div><div class="l-btn-r"></div><span></span></div>
    </div>
    <div class="l-panel-search-item">
        <div id="back" class="l-btn"  style="width:80px;display:none" onclick="f_back()">返回<div class="l-btn-l"></div><div class="l-btn-r"></div><span></span></div>
    </div>
</div>
   	<form id="mainform">
    <div id="maingrid" style="margin: 0; padding: 0 ;float: left;" >
    </div>
    </form>
    <div style="display: none;">
    </div>
</body>
<script type="text/javascript">
     function f_reload()
     {
          grid.loadData();
     }
	 function f_delete()
	 {
	 	 $.ligerDialog.confirm('确定删除十天以前的日志？', function (yes)
                     
                     {
                       
                         if(yes==true){
                         	$.post("${pageContext.request.contextPath}/system/deleteLog",
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('删除成功');
          							f_reload();
          						}else{
          							$.ligerDialog.error('删除失败');
          						}
							},
							"json"
          					);
                         }
                     });
	 }
     var grid;
      var toolbarOptions = { 
        items:
        	[    
            { text: '删除', click: f_delete, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_delete.gif" }
        	]
    	};
     function f_showLog(){
     		grid = $("#maingrid").ligerGrid({
   			columns: [ 
                {display: '用户名', name: 'admUsername', align: 'center', width: '15%' } ,
                {display: '密码', name: 'admPassword', align: 'center', width: '15%', 
                	render:function(record, rowindex, value, column) {
                					if(value!=null) return "<span style='color:red'>"+value+"</span>";
              						else return "--";
                					  
		
                } } ,
                {display: '状态', name: 'operatetype', width: '12%', align: 'center' ,
                 render:function(record, rowindex, value, column) {
                					if(value==1) return "<span style='color:green'>成功</span>"; 
              						else return "<span style='color:red'>失败</span>";
                }},
                { display: '浏览器', name: 'broswer', width: '12%', align: 'center' },
                { display: '时间', name: 'operatetime', width: '18%', align: 'center',type:'date'},
                { display: 'Ip', name: 'ip', width: '18%', align: 'center' }
                ], url:"${pageContext.request.contextPath}/system/selectLog?date="+$("#search").val(), pageSize: 10, sortName: 'operatetime',
                width: '98%', height: '98%', rownumbers:true,dataAction:"server",sortOrder:'desc',
               	enabledEdit: true, clickToEdit: false,fixedCellHeight: true, rowHeight: 25,checkbox: false,toolbar: toolbarOptions
    	});
     	}
     	$(function(){
     		 $("#searchbtn").click( function ()
            {
               f_search();
            }); 
     	});
     	$(function(){
       		f_showLog();
        	$("#search").change(function(){
        		$("#content").val("");
        		grid.set({newPage:1});
        		f_showLog();
        	});
        })
     	function f_search()
        {
        	//如果搜索框为空，提示
        	if(!$.trim($("#content").val()))
        	{
        		alert("请输入搜索内容！");
        		return;
        	}
        	//显示返回按钮
            $("#back").show();
            //加载搜索结果
            var str = escape(escape($("#content").val()));
            $("#search").val("all");
            grid.set({url:"${pageContext.request.contextPath}/system/searchLog?str="+str+"&searchName="+$("#search1").val(),newPage:1});
        }
     	
     	function f_back()
        {
        	$("#back").hide();
        	grid.set({url:"${pageContext.request.contextPath}/system/selectLog?date="+$("#search").val(),newPage:1});
        }
    </script>
</body>
</html>
