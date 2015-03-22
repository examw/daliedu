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
   <form id="mainform">
    <div id="maingrid" style="margin: 0; padding: 0 ;float: left;" >
    </div>
    </form>
    <div style="display: none;">
   </div>
<script type="text/javascript">
      //验证
      var grid,maingform = $("#mainform");
      $.metadata.setType("attr", "validate");
      LG.validate(maingform, { debug: true });
      //覆盖本页面grid的loading效果
      LG.overrideGridLoading(); 
	    $(function ()
            { 
            	//布局
               layout = $("#layout").ligerLayout({ height: '100%', heightDiff: -20, leftWidth: 190,  minLeftWidth: 120 });
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
	                      f_open(selected.id);
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
	       	window.addNewClass=$.ligerDialog.open({ 
	          	  	url: 'new_class.jsp',
	          	    title:'资讯管理', 
	          	    isHidden :'false',
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 450,width: 700, 
	          	    buttons: [ { text: '确定', 
	          	    	onclick: function (item, dialog) { 	
	          					dialog.frame.submit();		
	          	    			}
	          	    		 }
	          	     	] 
	          	    });	
  	 }
      
      function f_open(id){
	       	window.addNewClass=$.ligerDialog.open({ 
	          	  	url: '${pageContext.request.contextPath}/new/loadNewClass?newClassId='+id,
	          	    title:'资讯管理', 
	          	    isHidden :'false',
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 450,width: 700, 
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
              if (!selected.id)
              {
                  grid.deleteRow(selected);
                  return;
              }
              LG.ajax({
                  loading:'正在删除中...',
                  data: { id: selected.id },
                  url:'${pageContext.request.contextPath}/new/delete.action',
                  success: function () { 
           		     LG.showSuccess('删除成功');
                     f_reload();
           		  	 LG.showSuccess(j.msg);                
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
   		grid = $("#maingrid").ligerGrid({
        //headerImg:"../lib/icons/silkicons/table.png",title:'表格表头',
        columns: [
                { display: '资源分类', name: 'classCname', align: 'left', width: 180, minWidth: 60
                , validate: { required: true }
                , editor: { type: 'text' }
                },
                { display: '英文名称', name: 'classEname', align: 'left', width: 100, minWidth: 60
                , validate: { required: true }
                , editor: { type: 'text' }
                },
                { display: '路径', name: 'urlPath', align: 'left', width: 150, minWidth: 60
                , validate: { required: true }
                , editor: { type: 'text' }
                },
                { display: '关键字', name: 'keywords', align: 'left', width: 150, minWidth: 60
                    , validate: { required: true }
                    , editor: { type: 'text' }
                },
                { display: '备注', name: 'descri', align: 'left', width: 150, minWidth: 60
                    , validate: { required: true }
                    , editor: { type: 'text' }
                },
                { display: '模板', name: 'classTemp', align: 'left', width: 150, minWidth: 60
                    , validate: { required: true }
                    , editor: { type: 'text' }
                },
                { display: '排序', name: 'orderId', align: 'left', width: 150, minWidth: 60
                    , validate: { required: true }
                    , editor: { type: 'text' }
                }
                ],url:"${pageContext.request.contextPath}/new/newClassList.action",tree: { columnName: 'classCname' }, dataAction: 'server', pageSize: 20, toolbar: toolbarOptions, sortName: 'id',
        width: '98%', height: '100%', heightDiff: -5, checkbox: false, usePager: false, enabledEdit: true, clickToEdit: false,
        fixedCellHeight: true, rowHeight: 25
    });
 </script>
</body>
</html>
