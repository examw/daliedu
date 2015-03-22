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
        });
        function f_showOrder()
        {
        	//　　订单号、用户名、价格、订单时间、订单状态、姓名、手机号、处理时间
        		toolbar = $("#toolbar").ligerToolBar({
        			items: [
                { text: '添加试卷', click: f_add, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' },
                { line: true },
                { text: '修改', click: f_modify, img: '${pageContext.request.contextPath}/cms/images/icon/modify.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '${pageContext.request.contextPath}/cms/images/icon/refresh.gif' },
                { line: true },
                { text: '删除', click: f_detele, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' },
                { line: true },
                { text: '预览试卷',click:f_show, img:'${pageContext.request.contextPath}/cms/images/icon/preview.png'},
                { line: true },
                { id:'search',text: '搜索', click: f_search, img: '${pageContext.request.contextPath}/cms/images/icon/search.gif' }
                ]
        		});
        		
                g = $("#maingrid4").ligerGrid({
            	height:'100%',
                columns: [ 
                {display: '试卷名称' ,name:'paperName',width:400},
                {display: '试卷类型', name: 'type', width: 100, render: function (record, rowindex, value, column) {
                					if(value=="真题卷") return "<span style='color:red'>"+value+"</span>"; 
              						if(value=="模拟卷") return "<span style='color:green'>"+value+"</span>";
              						if(value=="练习卷") return "<span style='color:purple;'>"+value+"</span>";
               						return "<span style='color:#404040;'>"+value+"</span>";                   
                } },
                {display: '添加时间', name: 'paperAddTime', width: 200 ,type:'mydate'},
                {display: '责任编辑', name: 'paperEditor', width: 100 },
                {display: '点击数', name: 'paperClickNum', width: 100 },
                {display: '查看(可双击行)',width:100,render: function (row)
                    {
                        var html = '<a href="#" onclick="f_showDetail(' + row.paperId + ')">查看</a>';
                        return html;
                    }}
                ], url:"${pageContext.request.contextPath}/paper/paperList?examId="+$("#examId").val(), frozen:false,page:1,pagesize:20,sortName:'paperAddTime',sortOrder:'desc',
					pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                	showTitle: false,width:'100%',headerRowHeight:30,
               		onError: function (a, b)
                	{ 
                	}/* ,
                toolbar:{ items: [
                { text: '添加试卷', click: f_add, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' },
                { line: true },
                { text: '修改', click: f_modify, img: '${pageContext.request.contextPath}/cms/images/icon/modify.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '${pageContext.request.contextPath}/cms/images/icon/refresh.gif' },
                { line: true },
                { text: '删除', click: f_detele, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' },
                { line: true },
                { text: '搜索', click: f_search, img: '${pageContext.request.contextPath}/cms/images/icon/search.gif' }
                ]} */
            });
            manager=$("#maingrid4").ligerGetGridManager();
            manager.bind("dblClickRow",
           			function(rowdata, rowindex, rowDomElement){
           				//detail = $.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/order/load?search=2&id="+rowdata.orderId, height: 200,width: 600,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { alert(item.text); } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
           				parent.addTab("paperDetail","${pageContext.request.contextPath}/paper/paperDetail?paperId=" + rowdata.paperId,'试卷详情');});
            $("#pageloading").hide();
        }
        //添加
        function f_add()
        {
			//parent.addTab("addPaper","${pageContext.request.contextPath}/cms/jsp/exam/addPaper","添加试卷");
			location="${pageContext.request.contextPath}/cms/jsp/exam/addPaper.jsp?examId="+$("#examId").val();
        }
        //修改
        function f_modify()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            if(row.paperClickNum>0)
            {
            	alert("已有学员考了该试卷不能修改");return;
            }
			location="${pageContext.request.contextPath}/paper/loadPaper?paperId="+row.paperId;
        }
        //详细
        function f_showDetail(id)
        {
        	parent.addTab("paperDetail","${pageContext.request.contextPath}/paper/paperDetail?paperId=" + id,'试卷详情');
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
        //删除
        function f_detele()
        {
        	var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            if(row.paperClickNum>0)
            {
            	alert("已有学员考了该试卷不能删除");return;
            }
            $.ligerDialog.confirm("试卷删除会删除试卷所有的题目，\n确认删除吗？不可逆哦！",function (r)
            {
            	if(r)
            	{
            		$.ajax({
            			async:true,
            			type:"POST",
            			url:"${pageContext.request.contextPath}/paper/deletePaper",
            			data:{"paperId":row.paperId},
            			dataType:"json",
            			success:function(data)
            			{
            				if(data)
            				{
            					alert("删除成功！");
            					f_reload(); //重新加载
            				}else
            				{
            					alert("删除失败，该试卷已不存在");
            					f_reload();
            				}
            			},
            			error:function()
            			{
            				alert("系统错误");
            			}
            		});
            	}
            });
            return;
        }
        //搜索
        function f_search(item)
        {
        	//item.text = "返回";
        	if(toolbar.getItemText('search')=="搜索"){
        	$.ligerDialog.alert($("#target2").html(), '搜索', 'none',
        		function(){
        			var content = $.trim($("#content").val());
        			toolbar.setItemText("search",'返回');
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
<!--表格 ---------------------------------------- -->
	<input type="hidden" value="<%=request.getParameter("examId")%>" id="examId">
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
