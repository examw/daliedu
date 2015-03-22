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
    <style>
    	.add_li{padding-top:5px;padding-bottom:5px;width:255px;text-align:center}
    	.add_li:hover{background-color: #ccc;cursor:pointer}
    </style>
    <script type="text/javascript">
    	 $.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	//return value.toString().substring(0,value.toString().indexOf("T"));
    	 	return value.toString().replace("T","  ");
    	 };
        var g,manager,detail,menu,rows,toolbar;
        $(function(){
        	f_showOrder();
        });
        //修改页面右键
        $(document).bind('contextmenu',function(e){
		    rows = g.getSelectedRows ();
		    menu.setItemText("setLink","设置连题");
		    if(rows.length==0){
                 //表格中没有选中的行
                 //禁用其中的右键菜单项
                 menu.setDisable("setLink");
                 //menu.setDisable("delete");
                 menu.setDisable("cancelSelected");
		    }
		    if(rows.length==1){
		    	 if(rows[0].questLinkQuestionId)
		    	 {
		    	 	menu.setEnable("setLink");
		    	 	menu.setItemText("setLink","取消连题");
		    	 }else
		    	 {
		    	 	menu.setDisable("setLink");
		    	 }
		    	 menu.setEnable("cancelSelected");
		    }
		    var record=null;
		    if(rows.length>=2){
		    menu.setEnable("setLink");
		    menu.setEnable("cancelSelected");
		    for(var i=0;i<rows.length;i++)
		    {
		    	if((record=rows[i].questLinkQuestionId)=="")
		    	{
		    		break;
		    	}
		    }
		    if(record){menu.setItemText("setLink","取消连题");}
		    }
           menu.show({ top: e.pageY, left: e.pageX });
           return false;		
		}); 
        function f_showOrder()
        {
        	
        	menu = $.ligerMenu({ width: 120, items:
            [
            /* { text: '删除', click: menu_delete ,id:'delete'}, */
            { text: '刷新', click: menu_fresh ,id:'refresh'},
            { line: true },
            { text: '设置连题', click: menu_setLink, id:'setLink' },
            { text: '取消选择', click: menu_cancelSelected, id:'cancelSelected' }
            ]});
            toolbar = $("#toolbar").ligerToolBar({
            	items: [
                { text: '添加考题', click: f_add, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' },
                { line: true },
                { text: '修改', click: f_modify, img: '${pageContext.request.contextPath}/cms/images/icon/modify.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '${pageContext.request.contextPath}/cms/images/icon/refresh.gif' },
                { line: true },
                { text: '删除', click: f_detele, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' },
                { line: true },
                { text: '批量加题', click: f_bulkAdd, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' },
                { line: true },
                { id:"search",text: '搜索', click: f_search, img: '${pageContext.request.contextPath}/cms/images/icon/search.gif' }
                ]
            });
            g = $("#maingrid4").ligerGrid({
            	height:'100%',
            	 columns: [
                { display: '${paper.paperName}', 
                columns: [ 
                {display: '试题名称' ,name:'questContent',width:400,align:'left',render: function (record, rowindex, value, column) {
              						if(value.length>30) return value.substring(0,30);
               						return value;                   
                } },
                {display: '试题类型', name: 'type', width: 100, render: function (record, rowindex, value, column) {
                					if(value=="单选题") return "<span style='color:red'>"+value+"</span>"; 
              						if(value=="多选题") return "<span style='color:green'>"+value+"</span>";
              						if(value=="判断题") return "<span style='color:purple;'>"+value+"</span>";
               						return "<span style='color:#404040;'>"+value+"</span>";                   
                } },
                {display: '添加时间', name: 'questAddTime', width: 200 ,type:'mydate'},
                {display: '责任编辑', name: 'questEditor', width: 100 },
                {display: '属性', name: 'questOrderId', width: 150, render: function (record, rowindex, value, column) {
                					if(!record.questLinkQuestionId)
               						return "<span style='color:#404040;'>"+record.type+" | "+value+"</span>";
               						return "<span style='color:#404040;'>"+record.type+" | "+value+" 连题ID"+record.questLinkQuestionId.split('_')[0]+"</span>";
               						                   
                } },
                {display: '查看(可双击行)',width:100,render: function (row)
                    {
                        var html = '<a href="#" onclick="f_showDetail(' + row.questId + ')">查看</a>';
                        return html;
                    }}
                ]}],
                	url:"${pageContext.request.contextPath}/paper/questionList?paperId=${paperId}", frozen:false,page:1,pagesize:20,sortName:'questAddTime',sortOrder:'desc',
					pageSizeOptions: [3,10, 20, 30, 40, 50, 100], dataAction:'server',
                	showTitle: false,width:'100%',headerRowHeight:29,
               		onError: function (a, b)
                	{ 
                	}/* ,
                toolbar:{ items: [
                { text: '添加考题', click: f_add, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' },
                { line: true },
                { text: '修改', click: f_modify, img: '${pageContext.request.contextPath}/cms/images/icon/modify.gif' },
                { line: true },
                { text: '刷新', click: f_reload, img: '${pageContext.request.contextPath}/cms/images/icon/refresh.gif' },
                { line: true },
                { text: '删除', click: f_detele, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' },
                { line: true },
                { text: '批量加题', click: f_bulkAdd, img: '${pageContext.request.contextPath}/cms/images/icon/add.gif' }
                ]} */
            });
            manager=$("#maingrid4").ligerGetGridManager();
            manager.bind("dblClickRow",
           			function(rowdata, rowindex, rowDomElement){
           				//detail = $.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/order/load?search=2&id="+rowdata.orderId, height: 200,width: 600,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { alert(item.text); } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
           				parent.addTab("questDetail","${pageContext.request.contextPath}/paper/loadQuestion?flag=detail&qid=" + rowdata.questId+"&paperName="+escape(escape("${paper.paperName}")),'试题详情');});
            $("#pageloading").hide();
        }
        //添加
        function f_add()
        {
			//parent.addTab("addPaper","${pageContext.request.contextPath}/cms/jsp/exam/addPaper","添加试卷");
			//弹出框
			 $.ligerDialog.alert($("#target1").html(), '选择您要添加的题型', 'none');
			
        }
        //添题
        function f_addQuestion(id,num,flag)
        {
        	if(num==0)
        	{
        		alert("该大题已经加满");
        		return;
        	}
        	if(flag==0)
        		location='${pageContext.request.contextPath}/paper/prepareAdd?ruleId='+id;
        	else
        		location='${pageContext.request.contextPath}/paper/prepareAdd?ruleId='+id+'&flag=bulkAdd';
        }
        //修改
        function f_modify()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
			location="${pageContext.request.contextPath}/paper/loadQuestion?qid="+row.questId+"&paperName="+escape(escape("${paper.paperName}"));
        }
        //详细
        function f_showDetail(id)
        {
        	parent.addTab("questDetail","${pageContext.request.contextPath}/paper/loadQuestion?flag=detail&qid="+id+"&paperName="+escape(escape("${paper.paperName}")),'订单详情');
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
                       	//提示是否删除
            	 $.ligerDialog.confirm("确认删除吗？不可逆哦！",function (r)
            	 {
            		if(r)
            		{
            			$.ajax({
            				async:true,
							type:"POST",
							url:"${pageContext.request.contextPath}/paper/deleteQuestion",
							data:{'questionId':row.questId},
							dataType:'json',
							success:function(data)
							{
								if(data)
								{
									alert("删除成功");
									window.location.reload();
								}else
								{
									alert("删除失败，该题可能已不存在");
									window.location.reload();
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
        function f_bulkAdd()
        {
        	 $.ligerDialog.alert($("#target2").html(), '选择您要添加的题型', 'none');
        }
        //右键菜单操作
        function menu_delete()
        {
        	alert("gaga");
        }
        function menu_fresh()
        {
        	window.location.reload();
        }
        function menu_setLink()
        {
        	var text = menu.getItemText("setLink");
        	if(text=="设置连题")
        	{
        	var ruleId=rows[0].questRuleId;
        	var ids = "";
        	$.each(rows,function(){
        		if(ruleId!=this.questRuleId)
        		{
        			alert("题目不在同一个大题,不能设置");
        			return;
        		}
        		//是不是位置连续的题？
        		ids = ids + this.questId +',';
        	});
        	$.ajax({
        		async:true,
        		type:"POST",
        		url:"${pageContext.request.contextPath}/paper/setLink",
        		data:{'questionIds':ids.substring(0, ids.length-1)},
        		dataType:'json',
        		success:function(data)
        		{
        			if(data)
        			{
        				alert("设置成功");
        				location.reload();
        			}else
        			{
        				alert("设置失败,试题可能已更改,请刷新重试");
        			}
        		},
        		error:function()
        		{
        			alert('系统错误');
        		}
        		
        	});
        	}else
        	{
        		cancelLink();
        	}
        }
       	//取消连题
       	function cancelLink()
       	{
       		//提示取消连题的规则
       		$.ligerDialog.confirm("取消连题,会将整个连题属性都取消,是否继续?",function (r)
            {
       		 	if(r)
       			{
       				//分出不同linkQuestionId
       				var linkId = rows[0].questLinkQuestionId.split("_")[0];
       				var ids=rows[0].questLinkQuestionId;
       				$.each(rows,function(i,row){
       					if(linkId!=row.questLinkQuestionId.split("_")[0])
       					{
       						ids=ids+row.questLinkQuestionId+",";
       					}
       				});
       				$.ajax({
        				async:true,
        				type:"POST",
        				url:"${pageContext.request.contextPath}/paper/cancelLink",
        				data:{'questionIds':ids.substring(0, ids.length-1)},
        				dataType:'json',
        				success:function(data)
        				{
        					if(data)
        					{
        						alert("取消成功");
        						location.reload();
        					}else
        					{
        						alert("取消失败,试题可能已更改,请刷新重试");
        					}
        				},
        				error:function()
        				{
        					alert('系统错误');
        				}
        			});
       			}
       		});
       	}
       	
        //取消选择
        function menu_cancelSelected()
        {
        	$.each(rows,function(){
        		g.unselect(this);
        	});
        	//rows清空
        	rows=[];
        }
        //搜索
        function f_search()
        {
        	if(toolbar.getItemText('search')=="搜索"){
        	$.ligerDialog.alert($("#target3").html(), '搜索', 'none',
        		function(){
        			var content = $.trim($("#content").val());
        			toolbar.setItemText("search",'返回');
        			if(content)
        			{
        				var url = "${pageContext.request.contextPath}/paper/searchQuestion?paperId="+$("#paperId").val()+"&content="+escape(escape(content));
        				g.set({url:url});
        			}
        		});
        		return;
        	}
        	toolbar.setItemText('search',"搜索");
        	g.set({url:"${pageContext.request.contextPath}/paper/questionList?paperId=${paperId}"});
        }
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<script type="text/javascript">
	if("${actionFlag}"=="modify")
	{
		alert("修改成功!");
	}
</script>
<!--表格 ---------------------------------------- -->
	<input type="hidden" value="${paper.paperId }" id="paperId">
    <div class="l-loading" style="display: block" id="pageloading">
    </div> 
    <div id="toolbar" style="border:1px solid #ccc;border-bottom-style:none"></div>
    <div id="maingrid4" style="margin: 0; padding: 0">
    </div>
    <div style="display: none;">
    </div>
    
<!-- ----添加弹出框---- -->
 <div id="target1" style="width:200px; margin:3px; display:none;">
    <h3>添加题目</h3>
    <div>
     	<ul>
     		<s:iterator value="ruleList" var="rule">
     			<li class="add_li" onclick="f_addQuestion(${rule.ruleId},${rule.ruleQuestionNum-rule.ruleActualAddNum },0)">
     				${rule.type }(${rule.ruleActualAddNum }/${rule.ruleQuestionNum })
     			</li>
     		</s:iterator>
     	</ul>
    </div>
 </div>  
 <!-- ----添加弹出框---- -->
 <div id="target2" style="width:200px; margin:3px; display:none;">
    <h3>批量添加</h3>
    <div>
     	<ul>
     		<s:iterator value="ruleList" var="rule">
     			<li class="add_li" onclick="f_addQuestion(${rule.ruleId},${rule.ruleQuestionNum-rule.ruleActualAddNum },1)">
     				${rule.type }(${rule.ruleActualAddNum }/${rule.ruleQuestionNum })
     			</li>
     		</s:iterator>
     	</ul>
    </div>
 </div>
 <!-- 搜索 -->        
  <input type="hidden" id="content">
    <div id="target3" style="width:200px; margin:3px; display:none;">
    <h3>简单搜索</h3>
    <div>
     	<ul>
     		<li>
     			请输入搜索的内容
     		</li>
     		<li><input id="searchcontent" class="l-text" style="width:230px" onblur="$('#content').val(this.value);"></li>
     	</ul>
    </div>
 </div>     
</body>
</html>