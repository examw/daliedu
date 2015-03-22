<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	 <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
     <script type="text/javascript">
     	$.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	return value.toString().substring(0,value.toString().indexOf("T"));
    	 };
     	var g;
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
            $("#confirmDate").change(function(){
            	if(Date.parse($("confirmDate").val())<new Date().getTime())
            	{
            		$("#dealInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
            	}
            	else
            		$("#dealInfo").html("想穿越？");
            	
            });
            $("#Button1").click(function(){
            	if(!(checkDate($("#addDate"),$("#info"))&&checkDate($("#confirmDate"),$("#dealInfo"))))
            	{
            			return false;
            	};
            	$("form").hide();
            	f_showList();
            	$("#maingrid4").show();
            });
            $("#orderId").blur(checkContent);
        }); 
        function checkContent()
        {
        	var value = $("#orderId").val();
        	if(!value||!$.trim(value))
        	{
        		 $("#content").html("");
        		 return;
        	}
        	if(!/^[0-9]+$/.test(value))
        	{
        		$("#content").html("请认真输入");
        	}else{
        		$("#content").html("");
        	}
        }
        function f_showList()
        {
                g = $("#maingrid4").ligerGrid({
            	height:'100%',
                columns: [ 
                {display: '编号' ,name:'sendId',isAllowHide:true,hide:0},
                {display: '订单编号' ,name:'orderNo',isAllowHide:true,hide:0},
                {display: '寄送物品', name: 'sendContent', width: 200 } ,
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
                ], url:"${pageContext.request.contextPath}/send/searchSend?status="+$("#status").val()+"&addDate="+$("#addDate").val()+"&confirmDate="+$("#confirmDate").val()+"&orderNo="+$.trim($("#orderId").val())+"&stuUsername="+$.trim($("#stuUsername").val())+"&stuMobile="+$.trim($("#stuMobile").val()), 
                	frozen:false,page:1,pagesize:20,sortName:'sendId',sortOrder:'desc',
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
                { line: true},
                { text: '返回搜索',click:f_back, img:'${pageContext.request.contextPath}/cms/images/icon/back.gif'}
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
 			manager.bind("dblClickRow",
            			function(rowdata, rowindex, rowDomElement){
            				parent.addTab('sendDetail','${pageContext.request.contextPath}/send/sendDetail?sendId='+rowdata.sendId,'寄送详情');
            });            $("#pageloading").hide();
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
          //返回
        function f_back()
        {
        	$("#maingrid4").hide();
        	$("form").show();
        }
        //查看详情
        function f_showDetail()
        {
        	var row = manager.getSelectedRow();
            if (!row) { alert('请选择行或直接双击该行'); return; }
            parent.addTab("sendDetail","${pageContext.request.contextPath}/send/sendDetail?sendId=" + row.sendId,'寄送详情');
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
    </script>
    <style type="text/css">
        .l-table-edit {margin-top:100px}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
</head>
<body>
	<center>
	    <form name="form1" method="post"  id="form1" action="">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!--  -------------------------  -->
        	<tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td" style="width:180px" >
                	输入搜索关键字(如订单id)
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">订单号</td>
                <td align="left" class="l-table-edit-td" style="width:190px" ><input id="orderId" class="l-text" style="width:190px" name="content" type="text" /></td>
                <td align="left"><span style="color:red" id="content"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">学员用户名</td>
                <td align="left" class="l-table-edit-td" style="width:190px" ><input id="stuUsername" class="l-text" style="width:190px" name="content" type="text" /></td>
                <td align="left"><span style="color:red" id="username"></span></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">学员手机号</td>
                <td align="left" class="l-table-edit-td" style="width:190px" ><input id="stuMobile" class="l-text" style="width:190px" name="content" type="text" /></td>
                <td align="left"><span style="color:red" id="mobile"></span></td>
            </tr>
            <tr class="advance">
                <td align="right" class="l-table-edit-td">在此之后生成的:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="addDate" type="text" id="addDate" ltype="date" /></td>
                <td align="left" width=50px><span style="color:red;" id="info"></span></td>
            </tr>
           <tr class="advance">
                <td align="right" class="l-table-edit-td">在此之后确认的:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="confirmDate" type="text" id="confirmDate" ltype="date" /></td>
                <td align="left"><span style="color:red" id="dealInfo"></span></td>
            </tr>
            <tr class="advance">
                <td align="right" class="l-table-edit-td">支付状态:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
					<select name="status" class="l-select" id="status" ltype="select">
						<option value="all" selected="selected">所有寄送单</option>
						<option value="notsend">未送</option>
						<option value="sending">正送</option>
						<option value="sent">已送</option>
					</select>
                </td>
                <td align="left"></td>
            </tr>

            <tr>
            	<td></td>
            	<td>
            	<input type="button" value="搜索" id="Button1" class="l-button l-button-submit" /> 
            	<input type="reset" value="重置" class="l-button l-button-reset"/></td>
            	<td align="left"></td>
            </tr>  
        </table>
 <br />
    </form></center>
    
<!--表格 ----------------------------------------
 <div class="l-loading" style="display: block" id="pageloading">
    </div> -->
<div id="maingrid4" style="margin: 3px; padding: 0">
    </div>
    <div style="display: none;">
    </div>
</body>
</html>
