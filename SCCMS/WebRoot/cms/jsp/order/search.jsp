<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 普通搜索显示 -->
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
     	$.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	return value.toString().replace("T","  ");
    	 };
    	 $.ligerDefaults.Grid.formatters['myMoneyFormat'] = function (value, column) {
    	 	if(!value) return "0.00";
    	 	return value.toFixed(2);
    	 };
     	var g,manager;
        $(function ()
        {
            $("form").ligerForm();
            $("#addDate").change(function(){
            	if(Date.parse($("#addDate").val())<new Date().getTime())
            	{
            		$("#info").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
            	}
            	else
            		$("#info").html("想穿越？");
            	
            });
            $("#dealDate").change(function(){
            	if(Date.parse($("#dealDate").val())<new Date().getTime())
            	{
            		$("#dealInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
            	}
            	else
            		$("#dealInfo").html("想穿越？");
            	
            });
            $("#Button1").click(function(){
            	if($("#advance").html()=="普通搜索")
            	{
            		if(!(checkDate($("#addDate"),$("#info"))&&checkDate($("#dealDate"),$("#dealInfo"))))
            		{
            			return false;
            		};
            	}
            	$("form").hide();
            	f_showOrder();
            	$("#maingrid4").show();
            	//return false;
            });
            
        }); 
        function advance()
        {
        	var str = $("#advance").html();
        	if(str=="高级搜索")
        	{
        		$("#advance").html("普通搜索");
        		$(".advance").show();
        	}else
        	{
        		$("#advance").html("高级搜索");
        		$(".advance").hide();
        	}
        }
        function checkDate(input,span)
        {
        	//不写为true 可以不写
        	if(!input.val()||!$.trim(input.val()))
        	{
        		return true;
        	}
            if(Date.parse(input.val())>new Date().getTime())
            {
            	span.html("想穿越？");
            	return false;
            }
            return true;
        }
        
        ////////////////////////////////////////////////////////////////////////////////
        
       //	var orderData =eval('(' + orderData1 + ')');
            function f_showOrder()
        {
        	//　　订单号、用户名、价格、订单时间、订单状态、姓名、手机号、处理时间
                g = $("#maingrid4").ligerGrid({
            	height:'100%',
                columns: [ 
 				{display: '订单号' ,name:'orderNo',isAllowHide:true,hide:0},
                {display: '用户名', name: 'stuUsername', width: 100 } ,
                {display: '订单金额', name: 'orderMoney', minWidth: 100,type:"myMoneyFormat"},
                {display: '下单时间',name:'orderAddTime',minWidth:125 ,type:'mydate' },
                {display: '订单状态', name: 'status', width: 100, render: function (record, rowindex, value, column) {
                					if(value=="未支付") return "<span style='color:red'>"+value+"</span>"; 
              						if(value=="已支付") return "<span style='color:green'>"+value+"</span>";
              						if(value=="已退单") return "<span style='color:purple; text-decoration:line-through;'>"+value+"</span>";
               						return "<span style='color:#404040; text-decoration:line-through;'>"+value+"</span>";                   
                } },
                {display: '姓名', name: 'stuName', width: 100 },
                {display: '手机号', name: 'stuMobile', width: 100 },
                {display: '查看(可双击行)',width:100,render: function (row)
                    {
                        var html = '<a href="#" onclick="f_showDetail(' + row.orderId + ')">详情</a>';
                        return html;
                    }},
                {display: '处理时间', name: 'orderDealTime', width: 200 ,type:'mydate'}
                ], url:'${pageContext.request.contextPath}/order/search?orderId='+$("#orderId").val()+'&stuUsername='+$("#stuUsername").val()+'&stuMobile='+$("#stuMobile").val()+'&stuName='+escape(escape($("#stuName").val()))+'&admUsername='+escape(escape($("#admUserName").val()))+'&addDate='+$("#addDate").val()+'&dealDate='+$("#dealDate").val()+'&status='+$("#status").val(),
                	frozen:false,page:1,pagesize:20,sortName:'orderAddTime',sortOrder:'desc',
					pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                	showTitle: false,width:'98%',
                	rowHeight: 25,headerRowHeight:30,
               		onError: function (a, b)
                	{ 
                	},
                	 toolbar:{ items: [
                { text: '开通订单', click: f_modify, img: '${pageContext.request.contextPath}/cms/images/icon/modify.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '${pageContext.request.contextPath}/cms/images/icon/refresh.gif' },
                 { line: true },
                { text: '退单', click: f_cancel, img: '../../images/icon/busy.gif' },
                { line: true }, 
                { text: '返回搜索', click: f_back, img: '${pageContext.request.contextPath}/cms/images/icon/back.gif' }
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
          manager.bind("dblClickRow",
           			function(rowdata, rowindex, rowDomElement){
           				//detail = $.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/order/load?search=2&id="+rowdata.orderId, height: 200,width: 600,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { alert(item.text); } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
           				parent.addTab("orderDetail","${pageContext.request.contextPath}/order/orderDetail?orderId=" + rowdata.orderId,'订单详情');});
            $("#pageloading").hide();
        }
        //详情
        function f_showDetail(id)
        {
        	parent.addTab("orderDetail","${pageContext.request.contextPath}/order/orderDetail?orderId=" + id,'订单详情');
        }
        //修改
        function f_modify()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
           /*  if(row.orderStatus==3||row.orderStatus==4) {alert("已经不能再开通了");return;}
            parent.addTab("modifyOrder","${pageContext.request.contextPath}/order/load?id=" + row.orderId,'开通订单'); */
            if(row.orderStatus==0) 
            {
            	$.ajax({
    				type:"POST",
					url:"${pageContext.request.contextPath}/order/beforePay",
					data:{"orderId":row.orderId},
    				dataType:"json",
    				success:function(data)
    				{
    				if(data)
    				{
    					parent.addTab("modifyOrder","${pageContext.request.contextPath}/order/load?id=" + row.orderId,'修改订单');
    				}else
    				{
    					alert("订单包含已过期课程不能支付!");
						parent.fresh("searchOrder");
    				}
    				},
    				error:function(){
    					alert("系统异常,请稍后重试!");
    				}
            	});
            }
            else
            	alert("该订单不能再开通了！");
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
            if(row.orderStatus==1||row.orderStatus==2)
            {
            	//发请求退单
            	 $.ligerDialog.confirm("确认退单吗？不可逆哦！",function (r)
            	 {
            		if(r)
            		{
            			parent.addTab('cancel',"${pageContext.request.contextPath}/order/cancelOrder2?orderId="+row.orderId,'退单');
            		}
            	});
            	return;
            }
            if((row.orderStatus==0||row.orderStatus==3||row.orderStatus==4))
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
                <td align="right" class="l-table-edit-td">订单编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="orderId" type="text" id="orderId" /></td>
                <td align="left"></td>
           </tr>
           <tr>
                <td align="right" class="l-table-edit-td">学员用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="stuUsername" type="text" id="stuUsername"  /></td>
                <td align="left"></span></td>
           </tr>
           <tr>
                <td align="right" class="l-table-edit-td">学员手机号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="stuMobile" type="text" id="stuMobile" /></td>
                <td align="left"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">学员姓名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="stuName" type="text" id="stuName"  /></td>
                <td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">管理员用户名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="admUsername" type="text" id="admUserName"  /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td" style="width:160px" ></td>
                <td align="left"><a id="advance" href="javascript:;" onclick="advance();">高级搜索</a></td>
            </tr>
			<tr class="advance">
                <td align="right" class="l-table-edit-td">在此之后生成的:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="addDate" type="text" id="addDate" ltype="date" /></td>
                <td align="left"><span style="color:red" id="info"></span></td>
            </tr>
           <tr class="advance">
                <td align="right" class="l-table-edit-td">在此之后处理的:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="dealDate" type="text" id="dealDate" ltype="date" /></td>
                <td align="left"><span style="color:red" id="dealInfo"></span></td>
            </tr>
            <tr class="advance">
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
