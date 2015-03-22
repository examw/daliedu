<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 用于搜索订单条目内容的列表显示 -->

<title></title>
	
	 <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
     <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script>
     <script type="text/javascript">
     	var g,manager;
        $(function ()
        {
            $("form").ligerForm();
            $("#Button1").click(function(){
            	$("form").hide();
            	f_showOrder();
            	$("#maingrid4").show();
            	//return false;
            });
            
        }); 
        ////////////////////////////////////////////////////////////////////////////////
        
       //	var orderData =eval('(' + orderData1 + ')');
            function f_showOrder()
        {
        	//　　订单号、用户名、价格、订单时间、订单状态、姓名、手机号、处理时间
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
                ], url:'${pageContext.request.contextPath}/order/searchByPName?content='+escape(escape($("#content").val()))+'&status='+$("#status").val(),
                	frozen:false,page:1,pagesize:20,sortName:'orderAddTime',sortOrder:'desc',
					pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                	showTitle: false,width:'98%',
                	rowHeight: 25,headerRowHeight:30,
                	detail: { onShowDetail: f_showItems },
               		onError: function (a, b)
                	{ 
                	},
                	 toolbar:{ items: [
                { text: '修改', click: f_modify, img: '${pageContext.request.contextPath}/cms/images/icon/modify.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '${pageContext.request.contextPath}/cms/images/icon/refresh.gif' },
                 { line: true },
                { text: '退单', click: f_cancel, img: '../../images/icon/busy.gif' },
                { line: true }, 
                { text: '返回搜索', click: f_back, img: '${pageContext.request.contextPath}/cms/images/icon/back.gif' }
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
           // manager.bind("dblClickRow",
           // 			function(rowdata, rowindex, rowDomElement){
           // 				$.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/user/loadTeacher?id="+rowdata.tchId, height: 200,width: 660,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { alert(item.text); } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
            $("#pageloading").hide();
        }
        //显示详细列表
        function f_showItems(row, detailPanel,callback)
        {
             var grid = document.createElement('div'); 
            $(detailPanel).append(grid);
            $(grid).css('margin',10).ligerGrid({
                columns:
                            [
                            { display: '条目编号', name: 'itemId', totalSummary:{type:'count'}},
                            { display: '名称', name: 'itemName', width: 200 },                           
                            { display: '原价', name: 'itemOPrice' },
                            { display: '优惠价', name: 'itemRPrice',totalSummary:{type:'sum'} }
                            ], isScroll: false, showToggleColBtn: false, width: '98%',
                url: '${pageContext.request.contextPath}/order/itemList?orderId='+row.orderId , showTitle: false, columnWidth: 100
                 , onAfterShowData: callback,frozen:false,
                
            });  
        }
        //修改
        function f_modify()
        {
            //var row = manager.getSelectedRow();
            //if (!row) { alert('请选择行'); return; }
           // parent.addTab("modifyOrder1","${pageContext.request.contextPath}/order/load?search=1&id=" + row.orderId,'修改');
        }
        //刷新
        function f_reload()
        {
            manager.loadData();
        }
        //返回
        function f_back()
        {
        	$("#maingrid4").hide();
        	$("form").show();
        }
        
        var alert = function (content)
        {
            $.ligerDialog.alert(content);
        };
		  //退单
        function f_cancel()
        {
        	var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            if(row.orderStatus==1)
            {
            	//发请求退单
            	 $.ligerDialog.confirm("确认退单吗？不可逆哦！",function (r)
            	 {
            		if(r)
            		{
            			/* $.post("${pageContext.request.contextPath}/order/cancelOrder", {"orderId": row.orderId }, function (data)
            			{
                		 if(data)
                			{
                				$.ligerDialog.success( '操作成功!', function ()
                				{
                    				manager.loadData();
                				}); 
                			}
            			}); */
            			parent.addTab('cancel',"${pageContext.request.contextPath}/order/loadForCancel?orderId="+row.orderId,'退单');
            		}
            	});
            	return;
            }
            else
            {
            	//系统管理员进行实际的退单操作，收取手续费等
            	//加一个tab页面，在页面进行操作
            	alert("不是所有单都能退的");
            	return;
            }
        }
    </script>
    <style type="text/css">
        .l-table-edit {margin-top:100px}
        .l-table-edit-td{ padding:4px;}
        .advance{display:none}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
</head>
<body>
	<center>
	    <form name="form1" method="post"  id="form1" action="">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!--  -------------------------  -->
        	<tr>
                <td align="right" class="l-table-edit-td">包含商品名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="" type="text" id="content" /></td>
                <td align="left"></td>
           </tr>
            <tr class="">
                <td align="right" class="l-table-edit-td">支付状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
					<select name="status" class="l-select" id="status" ltype="select">
						<option value="all" selected="selected">所有订单</option>
						<option value="notpaid">未支付</option>
						<option value="paid">已支付</option>
						<option value="overtime">已过期</option>
					</select>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
            	<td></td>
            	<td><div id="message" title="默认搜索全部"><input type="button" value="搜索" id="Button1" class="l-button l-button-submit" /></div> 
            	<input type="reset" value="重置" class="l-button l-button-reset"/></td>
            </tr>  
        </table>
 <br />
    </form>
    </center>
<!--表格 ----------------------------------------
 <div class="l-loading" style="display: block" id="pageloading">
    </div> -->
<div id="maingrid4" style="margin: 3px; padding: 0">
    </div>
    <div style="display: none;">
    </div>

</body>
</html>
