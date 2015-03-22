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
    	$.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	return value.toString().replace("T","  ");
    	 };
        var g,manager;
        $(function ()
        {
            g = $("#maingrid4").ligerGrid({
                columns: [ 
                {display: '编号' ,name:'admId',isAllowHide:true,hide:1},
                {display: '用户名', name: 'admUsername', width: 120 } ,
                {display: '真实姓名', name: 'admName', minWidth: 120 },
                {display: '角色',name:'name',minWidth:100 },
                {display: '状态', name: 'admStatus', width: 100 ,render:function(record, rowindex, value, column) {
                					if(value==1) return "<span style='color:green'>正常</span>"; 
              						else return "<span style='color:red'>冻结</span>";
                } },
                {display: '注册时间', name: 'admAddTime', width: 200 ,type:'mydate'}
                ], url:"${pageContext.request.contextPath}/user/adminList", pageSize: 20, sortName: 'tchAddTime',method:"post",
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
            $("#searchbtn").ligerButton({ click: function ()
            {
               //alert("添加搜索的action");
               f_search();
            }});
        });
        //添加
        function f_add()
        {
            //window["add"]=f_openWindow('addForm.jsp', '添加管理员', 610, 360);  
            parent.addTab("addAdmin",'${pageContext.request.contextPath}/cms/jsp/system/addAdmForm.jsp','添加管理员');
        }
        //修改
        function f_modify()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            //f_openWindow("${pageContext.request.contextPath}/user/loadAdmin?id=" + row.admId, '信息修改',610, 360);
            parent.addTab("modifyAdmin","${pageContext.request.contextPath}/user/loadAdmin?id=" + row.admId,'修改管理员');
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
            		$.post("${pageContext.request.contextPath}/user/deleteAdmin", {"id": row.admId }, function (data)
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
        function f_closeWindow()
        {
        	add.close();
        	manager.loadData();
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

    <div class="l-loading" style="display: block" id="pageloading">
    </div> 
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
</body>
</html>
