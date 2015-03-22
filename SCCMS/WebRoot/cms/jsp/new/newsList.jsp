<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.all.js" type="text/javascript"></script>   
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/cms/css/common.css" rel="stylesheet" type="text/css" />  
    <script src="${pageContext.request.contextPath}/cms/js/common.js" type="text/javascript"></script>   
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.expand.js" type="text/javascript"></script>  
    <script src="${pageContext.request.contextPath}/cms/js/json2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.expand.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/iconselector.js" type="text/javascript"></script> 
    <style type="text/css">
    .l-panel td.l-grid-row-cell-editing { padding-bottom: 2px;padding-top: 2px;}
    </style>
</head>
<body style="padding:2px; text-align:center;">
  <div class="layout">
    <div position="left" title="主菜单模块" id="mainmenu">
    	<div class="accordion" > 
       		<div title="省份地区" id="lesson">
           		<div id="maintree"></div>
     		</div>	
  		</div>    
    </div>
    <div position="center" title="资讯列表"  id="framecenter"> 
    	<div class="layout">
    		 <div position="left" title="资讯" id="mainmenu">
    		 	<div class="accordion" > 
       				<div title="资讯类别" id="lesson">
           				<div id="classtree"></div>
     				</div>	
  				</div>    
    		 </div>
    		 <div  position="center" title="资讯详细" >
    		 	 <form id="mainform">
        			<div id="maingrid"  style="margin:2px;"></div> 
        		</form>
    		 </div>
    	</div>
    </div>
  </div>
  <ul class="iconlist">
  </ul>
<script type="text/javascript">
      //验证
      var grid ,provinceId,examId,manager;
      var maingform = $("#mainform");
      $.metadata.setType("attr", "validate");
      LG.validate(maingform, { debug: true });
      //覆盖本页面grid的loading效果
      LG.overrideGridLoading(); 
	    $(function ()
            { 
            	//布局
               layout = $(".layout").ligerLayout({ height: '100%', heightDiff: -20, leftWidth: 150,  minLeftWidth: 120 });
               var bodyHeight = $(".l-layout-center:first").height();
               accordion = $(".accordion").ligerAccordion({ height: bodyHeight-35, speed: null ,changeHeightOnResize:true});
            });
      function itemclick(item)
      {
    	  var selected = grid.getSelected();
          switch (item.text)
          {
              case "增加":
            	  f_open2();
                  break;
              case "修改":
                  if (selected!= null)
                  {
                      f_open(selected.newId);
                  } else
                  {
                      LG.tip('请先选择行');
                  }
                  break;
              case "删除": 
                  $.ligerDialog.confirm('确定删除吗?', function (confirm) {
                      if (confirm)
                          f_delete();
                  });
                  break;
          }
      }
      
      function f_open2(){
	       	window.addNews=$.ligerDialog.open({ 
	          	  	url: 'news.jsp',
	          	    title:'资讯管理', 
	          	    isHidden :'false',
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 500,width: 800, 
	          	    buttons: [ { text: '确定', 
	          	    	onclick: function (item, dialog) { 	
	          					dialog.frame.submit();
	          	    			}
	          	    		 }
	          	     	] 
	          	    });	
	  }
      
      function f_open(id){
	       	window.addNews=$.ligerDialog.open({ 
	          	  	url: '${pageContext.request.contextPath}/new/getNews?id='+id,
	          	    title:'资讯管理', 
	          	    isHidden :'false',
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 500,width: 800, 
	          	    buttons: [ { text: '确定', 
	          	    	onclick: function (item, dialog) { 	
	          					dialog.frame.submit();
	          	    			}
	          	    		 }
	          	     	] 
	          	    });	
	 }
      function f_reload()
      {
          grid.loadData();
      }
      function f_delete()
      { 
          var selected = grid.getSelected();
          if (selected)
          {
              LG.ajax({
                  loading:'正在删除中...',
                  data: { id: selected.newId },
                  url:'${pageContext.request.contextPath}/new/deleteNews',
                  success: function () { 
                      LG.showSuccess('删除成功');
                      f_reload();
                  },
                  error: function (message)
                  {
                      LG.showError(message);
                  }
              });
          }
          else
          {
              LG.tip('请选择行!');
          }
      	  }
	      var toolbarOptions = { 
	        items: [ 
	            { text: '增加', click: itemclick , img:"${pageContext.request.contextPath}/cms/images/silkicons/add.png"}, 
	            { line:true },
	            { text: '修改', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_edit.gif" },  
	            { line: true },
	            { text: '删除', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_delete.gif" }
	        ]
	    };
	    var currentMenuParentNo;
	    var tree = $("#maintree").ligerTree({
	        url: "${pageContext.request.contextPath}/new/getProvince",
	        textFieldName: "provinceName",
	        checkbox: false,
	        nodeWidth:60,  
	        nodeDraggable: false, 
	        btnClickToToggleOnly:true,
	        onSelect: function (node)
	        {
	        	provinceId = node.data.provinceId;
	        	examId =0;
	        	if(examCategory.getSelected()!=null){
	        		examId = examCategory.getSelected().data.examId;
	        	}
	        	grid.set({newPage:1});
	            grid.set('url', '${pageContext.request.contextPath}/new/findAll?provinceId='+provinceId+'&examId='+examId);
	        }
	    });
	    
	    var examCategory = $("#classtree").ligerTree({
	        url: "${pageContext.request.contextPath}/new/examList",
	        textFieldName: "examName",
	        checkbox: false,
	        nodeWidth:60,  
	        nodeDraggable: false, 
	        isLeaf:function(node){
			       if(node.examChildrenNum!=0){
					return true;
					}
				}, 
			onSelect: function (node)
	        {
	        	examId = node.data.examId;
	        	provinceId =0;
	        	if(tree.getSelected()!=null){
	    		provinceId = tree.getSelected().data.provinceId;
	        	}
	        	grid.set({newPage:1});
	            grid.set('url', '${pageContext.request.contextPath}/new/findAll?provinceId='+provinceId+'&examId='+examId);
	        }
	    });
	    
	    
        $(function ()
        {
            grid = $("#maingrid").ligerGrid({
                columns: [ 
                {display:'编号' ,name:'tchId',isAllowHide:true,hide:1},
                {display: '标题', name: 'newTitle', width: 120 } ,
                {display: '副标题', name: 'subTitle', minWidth: 120 },
                {display: '考试类别', name: 'examName', minWidth: 120 },
                {display: '资讯类别', name: 'className', width: 120 },
                {display: '置顶', name: 'isTop', width: 100,render:function(record, rowindex, value, column) {
                					if(value=="1") return "<span style='color:green'>是</span>"; 
              						else return "<span style='color:red'>否</span>";
                } },
                { display: '点击次数', name: 'clickNum', width: 100  },
                { display: '添加时间', name: 'addTime',type:'date', width: 150 }
                ], url:"${pageContext.request.contextPath}/new/findAll", pageSize: 10,sortName:'addTime',sortOrder:'desc',method:"post",
                width: '98%', height: '98%', rownumbers:true,dateFormat:"yyyy-MM-dd",dataAction:"server",rowHeight: 25,headerRowHeight:30, checkbox:false,
                toolbar: toolbarOptions, heightDiff: -6
            });
            manager=$("#maingrid").ligerGetGridManager();
            //绑定双击事件
            manager.bind("dblClickRow",
            			function(rowdata, rowindex, rowDomElement){
            				parent.addTab("teacherDetail","${pageContext.request.contextPath}/user/loadTeacher1?id="+rowdata.tchId,"教师详细信息");
            			});
            $("#pageloading").hide();
            $("#searchbtn").click( function ()
            {
               f_search();
            });
        });
 </script>
</body>
</html>
