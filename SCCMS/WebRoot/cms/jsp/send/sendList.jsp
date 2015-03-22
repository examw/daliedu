<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	 <link href="../../css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="../../js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../../js/base.js" type="text/javascript"></script> 
    <script src="../../js/ligerGrid.js" type="text/javascript"></script>
    <script src="../../js/ligerResizable.js" type="text/javascript"></script>
    <script src="../../js/ligerDrag.js" type="text/javascript"></script>
    <script src="../../js/CustomersData.js" type="text/javascript"></script>
    <script src="../../js/ligerToolBar.js" type="text/javascript"></script>
    <script src="../../js/ligerButton.js" type="text/javascript"></script>
    <script src="../../js/ligerDialog.js" type="text/javascript"></script>
    <script src="../../js/ligerMenu.js" type="text/javascript"></script>
    <style type="text/css">
    	.l-select{
    	border:1px solid #AECAF0; 
    	background:#DBEBFF url('../../images/controls/bg-trigger.gif') repeat-x left;}
    </style>
    <script type="text/javascript">
    	 $.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	return value.toString().substring(0,value.toString().indexOf("T"));
    	 };
        var g,manager;
        $(function(){
        	f_showOrder();
        	$("#search").change(function(){
        		g.set({url:"${pageContext.request.contextPath}/send/sendList?status="+$("#search").val()});
        	});
        });
        function f_showOrder()
        {
        	//　　订单号、用户名、价格、订单时间、订单状态、姓名、手机号、处理时间
                g = $("#maingrid4").ligerGrid({
            	height:'100%',
                columns: [ 
                {display: '编号' ,name:'sendId',isAllowHide:true,hide:0},
                {display: '订单编号' ,name:'orderNo',isAllowHide:true,hide:0},
                {display: '寄送物品[或发票抬头]', name: 'sendContent', width: 200 } ,
                {display: '寄送类型', name:'type',width:80},
                {display: '寄送状态', name: 'status', width: 100, render: function (record, rowindex, value, column) {
                					if(value=="未送") return "<span style='color:red'>"+value+"</span>"; 
               						if(value=="送货中") return "<span style='color:blue'>" + value + "</span>";
               						return "<span style='color:#404040; text-decoration:line-through;'>"+value+"</span>";                   
                } },
                {display:'收货人',name:'sendReceiveName',width:100},
                {display:'联系电话',name:'sendMobile',width:100},
                {display:'收获地址',name:'sendFullAddress',width:100},
                {display: '寄送时间',name:'sendTime',minWidth:125 ,type:'mydate' },
                {display: '确认时间',name:'sendConfirmTime',minWidth:125 ,type:'mydate' },
                {display: '寄送人', name: 'sendPerson', width: 100 }
                ], url:"${pageContext.request.contextPath}/send/sendList?status="+$("#search").val(), frozen:false,page:1,pagesize:20,sortName:'sendId',sortOrder:'desc',rowHeight: 25,headerRowHeight:30,
					pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                	showTitle: false,width:'100%',
                	//detail: { onShowDetail: f_showItems },
               		onError: function (a, b)
                	{ 
                	},
                	 toolbar:{ items: [
                { text: '修改', click: f_modify, img: '../../images/icon/modify.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '../../images/icon/refresh.gif' },
                { line: true },
                { text: '查看详情(可以双击行)', click: f_showDetail, img: '../../images/icon/refresh.gif' }
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
            manager.bind("dblClickRow",
            			function(rowdata, rowindex, rowDomElement){
            				parent.addTab('sendDetail','${pageContext.request.contextPath}/send/sendDetail?sendId='+rowdata.sendId,'寄送详情');
            });
            $("#pageloading").hide();
        }
        //显示详细列表
        function f_showItems(row, detailPanel,callback)
        {
             var grid = document.createElement('div'); 
             //manager.select(row);
            $(detailPanel).append(grid);
            $(grid).css('margin',10).ligerGrid({
            	columns:[{display:"订单详细",
                columns:
                            [
                            { display: '条目编号', name: 'itemId', totalSummary:{type:'count'}},
                            { display: '名称', name: 'itemName', width: 200 },                           
                            { display: '原价', name: 'itemOPrice' },
                            { display: '优惠价', name: 'itemRPrice',totalSummary:{type:'sum'} }
                            ]}], isScroll: false, showToggleColBtn: false, width: '100%',
                url: '${pageContext.request.contextPath}/order/itemList?orderId='+row.orderId ,
               // data:row.tbItemses, 
                showTitle: false, columnWidth: 100
                 , onAfterShowData: callback,frozen:false
                
            });  
        }
        //修改
        function f_modify()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            if (row.sendStauts==2){alert('不能再修改了');return;}
            parent.addTab("modifySend","${pageContext.request.contextPath}/send/loadSend?sendId=" + row.sendId,'修改');
        }
        //刷新
        function f_reload()
        {
            manager.loadData();
        }
        function f_closeWindow()
        {
        	add.close();
        	manager.loadData();
        }
        var alert = function (content)
        {
            $.ligerDialog.alert(content);
        };
        //查看详情
        function f_showDetail()
        {
        	var row = manager.getSelectedRow();
            if (!row) { alert('请选择行或直接双击该行'); return; }
            parent.addTab("sendDetail","${pageContext.request.contextPath}/send/sendDetail?sendId=" + row.sendId,'寄送详情');
        }
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<!-- 选择下拉框 -->
<div class="l-panel-search" >
 <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search" ltype="select">
			<option value="all" selected="selected">所有寄送单</option>
			<option value="notsend">未送</option>
			<option value="sending">正送</option>
			<option value="sent">已送</option>
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
</body>
</html>
