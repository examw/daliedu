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
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
     <script type="text/javascript">
     	var g;
        $(function ()
        {
            $("#Button1").click(function(){
            	$("form").hide();
            	f_showList();
            	$("#maingrid4").show();
            });
             $(document).keydown(function (e)
            {
                if (e.keyCode == 13)
                {
                    $("#Button1").click();
                }
            });
        }); 
        function f_showList()
        {
        		var str = escape(escape($("#content").val()));
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
                {display: '注册时间', name: 'admAddTime', width: 200 ,type:'date'},
                ], url:"${pageContext.request.contextPath}/user/searchAdmin?content="+str, pageSize: 20, sortName: 'tchAddTime',method:"post",
                width: '98%', height: '98%', rownumbers:true,dataAction:"local",
                 toolbar: { items: [
                { text: '增加', click: f_add, img: '../../images/icon/add.gif' },
                { line: true },
                { text: '修改', click: f_modify, img: '../../images/icon/modify.gif' },
                { line: true },
                { text: '删除', click: f_delete, img: '../../images/icon/delete.gif' },
                 { line: true },
                { text: '刷新', click: f_reload, img: '../../images/icon/refresh.gif' },
                { line: true },
                { text: '返回搜索', click: f_back, img: '../../images/icon/refresh.gif' }
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
           // manager.bind("dblClickRow",
           // 			function(rowdata, rowindex, rowDomElement){
           // 				$.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/user/loadTeacher?id="+rowdata.tchId, height: 200,width: 660,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { alert(item.text); } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
            $("#pageloading").hide();
        }
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
            parent.addTab("modifyAdmin1","${pageContext.request.contextPath}/user/loadAdmin?id=" + row.admId,'修改');
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
        //返回
        function f_back()
        {
        	 $("form").show();
        	$("#maingrid4").hide(); 
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
	    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/user/searchAdmin">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!--  -------------------------  -->
        	<tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td" style="width:180px" >
                	输入搜索关键字(id或用户名或姓名)
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td" style="width:190px" ><input id="content" class="l-text" style="width:190px" name="content" type="text" id="date"/></td>
                <td align="left"><span style="color:red" id="info"></span></td>
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
