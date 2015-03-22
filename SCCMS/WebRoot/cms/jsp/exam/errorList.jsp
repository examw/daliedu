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
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
    <script type="text/javascript">
    	 $.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	//return value.toString().substring(0,value.toString().indexOf("T"));
    	 	return value.toString().replace("T","  ");
    	 };
        var g,manager,detail,toolbar;
        $(function(){
        	f_showOrder();
        	$("#search").change(function(){
        		g.set({url:"${pageContext.request.contextPath}/paper/errorList?dealOrNot="+$("#search").val()});
        	});
        });
        function f_showOrder()
        {
        	//　　订单号、用户名、价格、订单时间、订单状态、姓名、手机号、处理时间
        		toolbar = $("#toolbar").ligerToolBar({
        			items: [
                { text: '修复错误', click: f_modify, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '${pageContext.request.contextPath}/cms/images/icon/refresh.gif' }
                //,{ line: true },
                //{ id:'search',text: '搜索', click: f_search, img: '${pageContext.request.contextPath}/cms/images/icon/search.gif' }
                ]
        		});
                g = $("#maingrid4").ligerGrid({
            	height:'100%',
                columns: [ 
                {display: '错误信息' ,name:'errorContent',width:400},
                {display: '错误类型', name: 'type', width: 100, render: function (record, rowindex, value, column) {
                					if(value=="错别字") return "<span style='color:blue'>"+value+"</span>"; 
              						if(value=="答案错误") return "<span style='color:green'>"+value+"</span>";
              						if(value=="图片模糊") return "<span style='color:purple;'>"+value+"</span>";
               						return "<span style='color:#404040;'>"+value+"</span>";                   
                } },
                {display: '添加时间', name: 'errorAddTime', width: 200 ,type:'mydate'},
                {display: '状态', name: 'status', width: 100,render:function (record, rowindex, value, column) {
                					if(value=="未处理") return "<span style='color:red'>"+value+"</span>"; 
               						return "<span style='color:green;'>"+value+"</span>";                   
                } },
                {display: '纠错学员', name: 'stuUserName', width: 100 },
                {display: '查看(可双击行)',width:100,render: function (row)
                    {
                        var html = '<a href="#" onclick="f_showDetail(' + row.id + ')">查看</a>';
                        return html;
                    }}
                ], url:"${pageContext.request.contextPath}/paper/errorList?dealOrNot="+$("#search").val(), frozen:false,page:1,pagesize:20,sortName:'errorAddTime',sortOrder:'desc',
					pageSizeOptions: [10, 20, 30, 40, 50, 100], 
                	showTitle: false,width:'100%',headerRowHeight:30,
               		onError: function (a, b)
                	{ 
                	}
            });
            manager=$("#maingrid4").ligerGetGridManager();
            manager.bind("dblClickRow",
           			function(rowdata, rowindex, rowDomElement){
           				//detail = $.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/order/load?search=2&id="+rowdata.orderId, height: 200,width: 600,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { alert(item.text); } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
           				parent.addTab("errorDetail","${pageContext.request.contextPath}/paper/loadError?actionFlag=detail&id=" + rowdata.id,'试题错误详情');});
            $("#pageloading").hide();
        }
        //修改
        function f_modify()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            if(row.errorStatus==1){alert("已经处理");return;}
            parent.addTab("modifyError","${pageContext.request.contextPath}/paper/loadError?id="+row.id,"修复问题错误");
        }
        //详细
        function f_showDetail(id)
        {
        	parent.addTab("errorDetail","${pageContext.request.contextPath}/paper/loadError?actionFlag=detail&id=" + id,'试卷详情');
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
        //搜索
        function f_search(item)
        {
        	//item.text = "返回";
        	if(toolbar.getItemText('search')=="搜索"){
        	toolbar.setItemText("search",'返回');
        	$.ligerDialog.alert($("#target2").html(), '搜索', 'none',
        		function(){
        			var content = $.trim($("#content").val());
        			if(content)
        			{
        				var url = "${pageContext.request.contextPath}/paper/searchPaper?examId="+$("#examId").val()+"&content="+escape(escape(content));
        				g.set({url:url});
        			}
        		});
        		return;
        	}
        	toolbar.setItemText('search',"搜索");
        	g.set({url:"${pageContext.request.contextPath}/paper/paperList?examId="+$("#examId").val()});
        }
        //预览
        function f_show()
        {
        	var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
			window.open("http://"+location.host+"${pageContext.request.contextPath}/paper/showPaper?paperId="+row.paperId);
        }
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<script type="text/javascript">
/* 	if("${action}"=="add")
	{
		alert("添加试卷成功");
	}
	if("${action}"=="update")
	{
		alert("修改试卷成功");
	}
	 */
</script>
<!-- 选择下拉框 -->
<div class="l-panel-search" >
 <div class="l-panel-search-item">问题状态：&nbsp;&nbsp;
        <select name="searchName" class="l-select" id="search" ltype="select" >
			<option value="notdeal" selected="selected">未处理</option>
			<option value="dealed">已处理</option>
			<option value="all" >所有</option>
		</select>
    </div>
</div>
<!--表格 ---------------------------------------- -->
    <div class="l-loading" style="display: block" id="pageloading">
    </div> 
    <div id="toolbar" style="border:1px solid #ccc;border-bottom-style:none"></div>
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
    <input type="hidden" id="content">
    <div id="target2" style="width:200px; margin:3px; display:none;">
    <h3>简单搜索</h3>
    <div>
     	<ul>
     		<li>
     			请输入搜索的内容
     		</li>
     		<li><input id="searchcontent" class="l-text" style="width:230px" onblur="$('#content').val(this.value)"></li>
     	</ul>
    </div>
 </div>     
</body>
</html>
