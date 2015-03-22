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
                {display: '卡号' ,name:'cardNo',width: 170,isAllowHide:true,hide:0},
                {display: '密码', name: 'cardPassword', width: 120 } ,
                {display: '面值', name: 'cardValue', minWidth: 100 ,type:"myMoneyFormat"},
                {display: '余额', name: 'cardBalance', minWidth: 100 ,type:'myMoneyFormat'},
                {display: '生成时间',name:'cardAddTime',minWidth:150,type:"mydate"},
                {display: '过期时间',name:'cardOverTime',minWidth:150 ,type:"mydate"},
                {display: '是否增送', name: 'present', width: 100 },
                {display: '是否被使用',name:'stuId',width:100,render :function (record, rowindex, value, column){
                	if(value!=0) return "<span style='color:red'>已被使用</span>";
                	else return "--";
                }},
                {display: '操作',width:100,render:  function (row, rowindex, value, column)
                    {
                       if(row.stuId!=0)
                       return "<a href='javascript:f_showDetail(" + row.cardId + ")'>使用详细</a> ";
                    	else return "--";
                    }
                }
                ], url:"${pageContext.request.contextPath}/system/cardList?num="+n, pageSize: 20, sortName: 'cardId',sortOrder:'desc',method:"post",format:"yyyy-MM-dd",
                width: '98%', height: '98%', rownumbers:true,dataAction:"server",dateFormat:"yyyy-MM-dd",
                rowHeight: 25,headerRowHeight:30,
                 toolbar: { items: [
                { text: '增加', click: f_add, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '${pageContext.request.contextPath}/cms/images/icon/refresh.gif' },
                 { line: true },
                { text: '导出', click: f_downLoad, img: '${pageContext.request.contextPath}/cms/images/icon/outbox.gif' }
                ]
                }
            });
        }
        //添加
        function f_add()
        {
        	if(n)
        	{
        		$.ligerDialog.confirm("确定不导出当次生成的吗？",function(r)
        			{
        				if(r)
        				{
        					parent.overrideTab("createCards",'${pageContext.request.contextPath}/cms/jsp/system/createCards.jsp','批量生成');
        				}
        			}
        		);
        		return;
	        }
	       parent.addTab("createCards",'${pageContext.request.contextPath}/cms/jsp/system/createCards.jsp','批量生成');
	        
        }
        //刷新
        function f_reload()
        {
            manager.loadData();
        }
        var alert = function (content)
        {
            $.ligerDialog.alert(content);
        };
        //导出
        function f_downLoad()
        {
        	if(n!=0)
        	{
        		location="${pageContext.request.contextPath}/system/excel?num="+n;
        	}else
        	{
        		parent.addTab("export","${pageContext.request.contextPath}/cms/jsp/system/export.jsp","导出");
        	}
        }
        //搜索
        function f_search()
        {
        	//如果搜索框为空，提示
        	if(!$.trim($("#content").val()))
        	{
        		alert("请输入搜索内容！");
        		return;
        	}
        	if(!/^[0-9A-Za-z]+[-]?[0-9]*$/.test($.trim($("#content").val())))
        	{
        		alert("请输入正确的卡号");
        		return;
        	}
        	//显示返回按钮
            $("#back").show();
            //加载搜索结果
            var str = escape(escape($("#content").val()));
            g.set({url:"${pageContext.request.contextPath}/system/searchCard?str="+str+"&searchName="+$("#search").val()});
        }
        //返回
        function f_back()
        {
        	$("#back").hide();
        	g.set({url:"${pageContext.request.contextPath}/system/cardList?num="+n});
        	//g.loadData();
        }
        //详细
        function f_showDetail(cardId)
        {
        	window.cardRecordWin=$.ligerDialog.open(
               	 	{ 
        	     		url: '${pageContext.request.contextPath}/system/getRecordList?cardId='+cardId,
        			    title:'充值记录',
        			    isHidden: false,
        				icon: 'images/Program Files Folder.png',
        			    height: 450,width: 710    	
        	       });
        }
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<!--表格 ---------------------------------------- -->
    <div class="l-loading" style="display: block" id="pageloading">
    </div> 
<!-- search button---------------------------------------- -->
<div class="l-panel-search" id="searchDiv">
    <div class="l-panel-search-item">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索：
    </div>
    <div class="l-panel-search-item">
        <input class="l-text" type="text" id="content" />
    </div>
     <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search" ltype="select">
			<option value="cardId" selected="selected">按卡号</option>
			<!-- <option value="tchUsername">按用户名</option>
			<option value="tchName">按姓名</option> -->
		</select>
    </div>
    <div class="l-panel-search-item">
        <div id="searchbtn" class="l-btn"  style="width:80px;" onclick="f_search()">搜索<div class="l-btn-l"></div><div class="l-btn-r"></div><span></span></div>
    </div>
    <div class="l-panel-search-item">
        <div id="back" class="l-btn"  style="width:80px;display:none" onclick="f_back()">返回<div class="l-btn-l"></div><div class="l-btn-r"></div><span></span></div>
    </div>
</div>
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
</body>
</html>
