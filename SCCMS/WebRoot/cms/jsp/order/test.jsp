<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title></title>
    <link href="../../css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../../js/base.js" type="text/javascript"></script> 
    <script src="../../js/ligerGrid.js" type="text/javascript"></script>
        <script src="../../js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="../../js/CustomersData.js" type="text/javascript"></script>
    <script src="../../js/AllOrdersData.js" type="text/javascript"></script>
    <script type="text/javascript">
        var g;
        $(function ()
        {
            f_showOrders(); 
        });
        //显示订单
        function f_showOrders()
        {
                g = $("#maingrid4").ligerGrid({
            	height:'100%',
                columns: [ 
                {display: '订单编号' ,name:'orderId',isAllowHide:true,hide:0,totalSummary:
                    {
                        type: 'count'
                    }},
                {display: '用户名', name: 'stuUsername', width: 100 } ,
                {display: '订单金额', name: 'orderMoney', minWidth: 100,totalSummary:
                    {
                        type: 'sum'
                    } },
                {display: '下单时间',name:'orderAddTime',minWidth:125 ,type:'mydate' },
                {display: '订单状态', name: 'status', width: 100, render: function (record, rowindex, value, column) {
                					if(value=="未支付") return "<span style='color:red'>"+value+"</span>"; 
               						if(value=="已支付未送货") return "<span style='color:blue'>" + value + "</span>";
              						if(value=="已支付已送货") return "<span style='color:green'>"+value+"</span>";
               						return "<span style='color:#404040; text-decoration:line-through;'>"+value+"</span>";                   
                } },
                {display: '姓名', name: 'stuName', width: 100 },
                {display: '手机号', name: 'stuMobile', width: 100 },
                {display: '处理时间', name: 'orderDealTime', width: 200 }
                ], url:"${pageContext.request.contextPath}/order/orderList", frozen:false,page:1,pagesize:20,sortName:'orderAddTime',sortOrder:'desc',
					pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                	showTitle: false,width:'90%',columnWidth:120,
                	detail: { onShowDetail: f_showOrder },
               		onError: function (a, b)
                	{ 
                	}
            });
            manager=$("#maingrid4").ligerGetGridManager();
           // manager.bind("dblClickRow",
           // 			function(rowdata, rowindex, rowDomElement){
           // 				$.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/user/loadTeacher?id="+rowdata.tchId, height: 200,width: 660,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { alert(item.text); } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
           // $("#pageloading").hide();
        }
        function f_modify()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            parent.addTab("modify","${pageContext.request.contextPath}/user/loadAdmin?id=" + row.admId,'修改');
        }
        //刷新
        function f_reload()
        {
            manager.loadData();
        }
        function f_getOrdersData(CustomerID)
        {
            var data = { Rows: [] };
            for (var i = 0; i < AllOrdersData.Rows.length; i++)
            {
                if (AllOrdersData.Rows[i].CustomerID == CustomerID)
                    data.Rows.push(AllOrdersData.Rows[i]);
            }
            return data;
        }
        //显示顾客订单
        function f_showOrder(row, detailPanel,callback)
        {
            var grid = document.createElement('div'); 
            $(detailPanel).append(grid);
            $(grid).css('margin',10).ligerGrid({
                columns:
                            [
                            { display: '订单序号', name: 'OrderID',type:'float' },
                            { display: '运费', name: 'Freight', width: 50,type:'float' },
                            { display: '收货人', name: 'ShipName' },
                            { display: '收货地址', name: 'ShipAddress' },
                            { display: '收货城市', name: 'ShipCity' },
                            { display: '收货国家', name: 'ShipCountry' }
                            ], isScroll: false, showToggleColBtn: false, width: '90%',
                data: f_getOrdersData("ALFKI") , showTitle: false, columnWidth: 100
                 , onAfterShowData: callback,frozen:false
            });  
        }
       
 
    </script>
</head>
<body  style="padding:10px">
 
    <div id="maingrid4"></div>
 <br /> 
 <div style="display:none;">
 <!-- g data total ttt -->
</div>
</body>
</html>
