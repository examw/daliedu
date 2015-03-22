<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <link href="../../css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="../../js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../../js/base.js" type="text/javascript"></script> 
    <script src="../../js/ligerGrid.js" type="text/javascript"></script>
    <script src="../../js/ligerResizable.js" type="text/javascript"></script>
    <script src="../../js/ligerDrag.js" type="text/javascript"></script>
    <script src="../../js/ligerTab.js" type="text/javascript"></script>
    <script src="../../js/ligerToolBar.js" type="text/javascript"></script>
    <script src="../../js/CustomersData.js" type="text/javascript"></script>
    <script src="../../js/ligerButton.js" type="text/javascript"></script>
    <script src="../../js/ligerDialog.js" type="text/javascript"></script>
    <script src="../../js/ligerMenu.js" type="text/javascript"></script>
    <style type="text/css">
    	.l-select{
    	border:1px solid #AECAF0; 
    	background:#DBEBFF url('../../images/controls/bg-trigger.gif') repeat-x left;}
    </style>
    <script type="text/javascript">
        var g,manager;
        $(function ()
        {
            g = $("#maingrid4").ligerGrid({
                columns: [ 
                {display:'编号' ,name:'acId',isAllowHide:true,hide:1},
                {display: '名称', name: 'acName', width: 120 } ,
                { display: '添加时间', name: 'acAddTime',type:'date', minWidth: 200 },
                { display: '类型', name: 'type', width: 100 },
                { display: '状态', name: 'status', width: 100, render: function (record, rowindex, value, column) {
                					if(value=="未解决") return "<span style='color:red'>"+value+"</span>"; 
               						return "<span style='color:green;'>"+value+"</span>";                   
                } },
                { display: '内容', name: 'acContent', width: 500  }
                ], 
                url:"${pageContext.request.contextPath}/complain/complainList", 
                pageSize: 20, sortName: 'acAddTime',sortOrder:'desc',method:"post",
                width: '98%', height: '98%', rownumbers:true,dateFormat:"yyyy-MM-dd",dataAction:"server",
                rowHeight: 25,headerRowHeight:30,
                toolbar: { items: [
                { text: '回复', click: f_add, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '../../images/icon/refresh.gif' }
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
            //绑定双击事件
             manager.bind("dblClickRow",
            			function(rowdata, rowindex, rowDomElement){
            				if(rowdata.status=="未解决") return;
            				$.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/complain/loadReply?acId="+rowdata.acId, height: 300,width: 660,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false});});
            $("#pageloading").hide();
  			$("#search").change(function(){
        		g.set({url:"${pageContext.request.contextPath}/complain/complainList?type="+$("#search").val()});
        	});
        });
        //回复
        function f_add()
        {
        	var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
        	parent.addTab("reply",'${pageContext.request.contextPath}/complain/load?acId='+row.acId,'回复');
        }
        //刷新
        function f_reload()
        {
            manager.loadData();
        }
        //封装alert方法
        var alert = function (content)
        {
            $.ligerDialog.alert(content);
        };
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<div id="navtab1" style="width: 100%;overflow:hidden; border:1px solid #A3C0E8; ">
<div tabid="home" title="交易列表" lselected="true"  style="height:100%" >
<a class="l-button" id="back" style="width:60px; float:left; margin-left:10px; display:none;" onclick="f_back()">h返回</a>
<!-- 选择下拉框 -->
<div class="l-panel-search" >
 <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search" ltype="select">
			<option value="0" selected="selected">所有</option>
			<option value="1">未解决的咨询</option>
			<option value="2">未回复的投诉</option>
		</select>
    </div>
</div>

<!--表格 ---------------------------------------- -->
    <div class="l-loading" style="display: block" id="pageloading">
    </div> 
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
</div>
</div>
</body>
</html>
