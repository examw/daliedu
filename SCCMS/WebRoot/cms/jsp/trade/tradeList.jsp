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
    	a:link,a:visited{
 			text-decoration:none;  /*超链接无下划线*/
		}
		a:hover{
 			text-decoration:underline;  /*鼠标放上去有下划线*/
 			color:red;
		}
    </style>
    <script type="text/javascript">
    	 $.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	//return value.toString().substring(0,value.toString().indexOf("T"));
    	 	return value.toString().replace("T","  ");
    	 	};
    	 $.ligerDefaults.Grid.formatters['mymoney'] = function (value, column) {
    	 	if(!value) return "0.0";
    	 	//return value.toString().substring(0,value.toString().indexOf("T"));
    	 	return Number(value).toFixed(2);
    	 	};
        var g,manager;
        $(function ()
        {
            g = $("#maingrid4").ligerGrid({
                columns: [ 
                {display:'交易号' ,name:'tradeId',isAllowHide:true},
                {display: '交易金额', name: 'tradeMoney', width: 120 ,render: function (record, rowindex, value, column) {
                		if(value==0) return "<span>"+value+"</span>";
                		else if(value<0) return "<span style='font-size:20px;color:red'>-</span><span style='font-size:20px;color:red'>"+Math.abs(value)+"</span>";
                		else return "<span style='font-size:20px;color:red'>+</span><span style='font-size:20px;color:red'>"+value+"</span>";
                	}} ,
                {display:'学员ID',name:'stuId',width:100,render:function(record, rowindex, value, column){
                		return "<a href='${pageContext.request.contextPath}/order/loadStu?stuId="+value+"'>"+value+"</a>";
                }},
                {display:'即时现金券',name:'tradeCashBalance',width:80,type:'mymoney'},
                { display: '交易时间', name: 'tradeTime',type:'mydate', minWidth: 200 },
                { display: '订单号', name: 'tradeOrderNo', width: 150 },
                { display: '交易类型', name: 'type', width: 100  },
                { display: '交易备注', name: 'tradeNote', width: 300 }
                ], 
                url:"${pageContext.request.contextPath}/trade/tradeList?criteria=all", 
                pageSize: 10, sortName: 'tradeTime',sortOrder:'desc',method:"post",
                width: '98%', height: '98%', rownumbers:true,dateFormat:"yyyy-MM-dd",dataAction:"server",rowHeight: 25,headerRowHeight:30,
                  toolbar: { items: [
                { text: '刷新', click: f_reload, img: '../../images/icon/refresh.gif' }
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
            //绑定双击事件
/*             manager.bind("dblClickRow",
            			function(rowdata, rowindex, rowDomElement){
            				$.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/user/loadTeacher?id="+rowdata.tchId, height: 200,width: 660,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
  */           $("#pageloading").hide();
  			$("#search").change(function(){
        		g.set({url:"${pageContext.request.contextPath}/trade/tradeList?criteria="+$("#search").val(),newPage:1});
        	});
        });
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
            g.set({url:"${pageContext.request.contextPath}/trade/searchTrade?str="+str+"&searchName="+$("#search2").val(),newPage:1});
        }
        //返回
        function f_back()
        {
        	$("#back").hide();
        	$("#content").val('');
        	g.set({url:"${pageContext.request.contextPath}/trade/tradeList?criteria="+$("#search").val(),newPage:1});
        }
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<div id="navtab1" style="width: 100%;overflow:hidden; border:1px solid #A3C0E8; ">
<div tabid="home" title="交易列表" lselected="true"  style="height:100%" >
<!-- 选择下拉框 -->
<div class="l-panel-search" >
 <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search" ltype="select">
			<option value="all" selected="selected">所有</option>
			<option value="recharge">充值</option>
			<option value="buyclass">购买课程</option>
			<option value="other">其他</option>
		</select>
    </div>
    <div class="l-panel-search-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 搜索： 
    </div>
    <div class="l-panel-search-item">
        <input class="l-text" type="text" id="content" />
    </div>
     <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search2" ltype="select">
			<option value="stuUsername" selected="selected">按用户名</option>
			<option value="orderNo">按订单号</option>
		</select>
    </div>
    <div class="l-panel-search-item">
        <div id="searchbtn" class="l-btn"  style="width:80px;" onclick="f_search()">搜索<div class="l-btn-l"></div><div class="l-btn-r"></div><span></span></div>
    </div>
    <div class="l-panel-search-item">
        <div id="back" class="l-btn"  style="width:80px;display:none" onclick="f_back()">返回<div class="l-btn-l"></div><div class="l-btn-r"></div><span></span></div>
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
