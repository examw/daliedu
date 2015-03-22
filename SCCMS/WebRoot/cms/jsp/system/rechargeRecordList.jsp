<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/CustomersData.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
    <style type="text/css">
    	.l-select{
    	border:1px solid #AECAF0; 
    	background:#DBEBFF url('${pageContext.request.contextPath}/cms/images/controls/bg-trigger.gif') repeat-x left;}
    </style>
    <script type="text/javascript">
    	$.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	//return value.toString().substring(0,value.toString().indexOf("T"));
    	 	return value.toString().replace("T","  ");
    	 };
    	 $.ligerDefaults.Grid.formatters['myMoneyFormat'] = function (value, column) {
    	 	if(!value) return "0.00";
    	 	return value.toFixed(2);
    	 };
        var g,manager;
        var n = (!"${num}")?0:parseInt("${num}");
        $(function ()
        {
        	if(n){$("#searchDiv").hide();}
			f_showGrid();
            manager=$("#maingrid4").ligerGetGridManager();
           // manager.bind("dblClickRow",
           // 			function(rowdata, rowindex, rowDomElement){
           // 				$.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/user/loadTeacher?id="+rowdata.tchId, height: 200,width: 660,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { alert(item.text); } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
            $("#pageloading").hide();
        });
        //
        function f_showGrid()
        {
        	    g = $("#maingrid4").ligerGrid({
                columns: [ 
                {display: '用户名' ,name:'stuUsername',width: 170,render:  function (row, rowindex, value, column)
                    {
                    if(row.rcId)
                    return row.student.stuUsername;
                 }},
                {display: '姓名', name: 'stuName', width: 120,render:function (row, rowindex, value, column)
                    {
                    if(row.rcId)
                    return row.student.stuName;
                 } } ,
                {display: '充值金额', name: 'rcMoney', minWidth: 100 ,type:"myMoneyFormat"},
                {display: '充值时间',name:'rcAddTime',minWidth:150,type:"mydate"}
                ], url:"${pageContext.request.contextPath}/system/recordList?cardId=${cardId}", pageSize: 20, sortName: 'cardId',sortOrder:'desc',method:"post",format:"yyyy-MM-dd",
                width: '98%', height: '98%', rownumbers:true,dataAction:"local",dateFormat:"yyyy-MM-dd",
                rowHeight: 25,headerRowHeight:30
            });
        }
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<!--表格 ---------------------------------------- -->
    <div class="l-loading" style="display: block" id="pageloading">
    </div> 
<!-- search button---------------------------------------- -->
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
</body>
</html>
