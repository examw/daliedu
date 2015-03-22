<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
                {display: '编号' ,name:'epcId',isAllowHide:true,hide:1},
                {display: '公司名', name: 'epcName', width: 120 } ,
                {display: '地址', name: 'epcAddr', minWidth: 200 },
                {display: '电话',name:'epcPhone',minWidth:120 },
                {display: '网址', name: 'epcUrl', width: 137 },
                {display: '添加时间', name: 'epcAddTime', width: 200 ,format:"yyyy-MM-dd",hide:1}
                ], url:"${pageContext.request.contextPath}/send/companyList", pageSize: 20, sortName: 'tchAddTime',method:"post",rowHeight: 25,headerRowHeight:30,
                width: '98%', height: '98%', rownumbers:true,dataAction:"local",
                 toolbar: { items: [
                { text: '增加', click: f_add, img: '../../images/icon/add.gif' },
                { line: true },
                { text: '修改', click: f_modify, img: '../../images/icon/modify.gif' },
                { line: true },
                { text: '删除', click: f_delete, img: '../../images/icon/delete.gif' },
                 { line: true },
                { text: '刷新', click: f_reload, img: '../../images/icon/refresh.gif' }
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
            $("#pageloading").hide();
        });
        //添加
        function f_add()
        {
            parent.addTab("addEpc",'${pageContext.request.contextPath}/cms/jsp/send/addForm.jsp','添加公司');
        }
        //修改
        function f_modify()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            parent.addTab("modifyEpc","${pageContext.request.contextPath}/send/loadCompany?id=" + row.epcId,'修改');
        }
        //刷新
        function f_reload()
        {
            manager.loadData();
        }
        //删除
        function f_delete()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            $.ligerDialog.confirm("确认删除吗？",function (r)
            {
            	if(r)
            	{
            		$.post("${pageContext.request.contextPath}/send/deleteCompany", {"id": row.epcId }, function (data)
            		{
                		if(data)
                		{
                			$.ligerDialog.success( '删除成功!', function ()
                			{
                    			manager.loadData();
                			}); 
                		}
            		});
            	}
            });
        }
        var alert = function (content)
        {
            $.ligerDialog.alert(content);
        };
        //搜索
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
            //中文的话进行编码
            var str = escape(escape($("#content").val()));
            g.set({url:"${pageContext.request.contextPath}/user/searchAdmin?str="+str+"&searchName="+$("#search").val()});
        }
        function f_getWhere()
        {
            if (!g) return null;
            var clause = function (rowdata, rowindex)
            {
                var key = $("#txtKey").val();
                if(!key){return null;}
                return rowdata.CustomerID.indexOf(key) > -1;
            };
            return clause; 
        }
        //返回
        function f_back()
        {
        	$("#back").hide();
        	g.set({url:"${pageContext.request.contextPath}/user/adminList"});
        	//g.loadData();
        }
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<!-- 增删改button---------------------------------------- 
<a class="l-button" style="width:60px; float:left; margin-left:10px;" onclick="f_add()">添加</a>
<a class="l-button" style="width:60px; float:left; margin-left:10px;" onclick="f_modify()">修改</a>
<a class="l-button" style="width:60px; float:left; margin-left:10px;" onclick="f_delete()">删除</a>
<a class="l-button" style="width:60px; float:left; margin-left:10px;" onclick="f_reload()">刷新</a>
<a class="l-button" id="back" style="width:60px; float:left; margin-left:10px; display:none;" onclick="f_back()">返回</a>
-->
	<!-- search button------------------------------------------>
    <!-- 	
<div class="l-panel-search" >
 
    <div class="l-panel-search-item">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索：
    </div>
    <div class="l-panel-search-item">
        <input class="l-text" type="text" id="content" />
    </div>
     <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search" ltype="select">
			<option value="admId" selected="selected">按编号</option>
			<option value="admUsername">按用户名</option>
			<option value="admRole">按角色</option>
		</select>
    </div>
    <div class="l-panel-search-item">
        <div id="searchbtn" style="width:80px;">搜索</div>
    </div>
</div>
-->
<!--表格 ---------------------------------------- -->
    <div class="l-loading" style="display: block" id="pageloading">
    </div> 
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
</body>
</html>
