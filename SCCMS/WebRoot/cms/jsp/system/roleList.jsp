<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.all.js" type="text/javascript"></script>   
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog2.js" type="text/javascript"></script>   
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.expand.js" type="text/javascript"></script>  
    <link href="${pageContext.request.contextPath}/cms/css/common.css" rel="stylesheet" type="text/css" />  
    <script src="${pageContext.request.contextPath}/cms/js/common.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/json2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.expand.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/iconselector.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTree1.js" type="text/javascript"></script>
    <style type="text/css">
    	 .l-select{
    	border:1px solid #AECAF0; 
    	background:#DBEBFF url('../../images/controls/bg-trigger.gif') repeat-x left;} 

	   .l-tree .l-tree-icon-none img {
	    border: 0 none;
	    height: 16px;
	    width: 16px;
		}
    </style>
    
</head>
<body style="padding: 4px; overflow: hidden;">
	 <div id="layout1">
           <div position="center" title="标题">
           		<form id="mainform">
   				 <div id="maingrid" style="margin: 0; padding: 0 ;float: left;" >
    
   			 	</div>
    			</form>
           </div>
           <div position="right">
           		<div id="accordion1" > 
	         		<div title="权限设置" id="lesson">
              			<div id="tree1"></div>
        			</div>	
  			  	</div>    
           </div>
        </div>  
     <div style="display:none;">
    <!-- 	<div style="border:20px ;float: left;solid #ccc;" id="tree" title="角色权限"></div> -->
   	<!--  <div style="margin-left:10px; height:495px;width:500px; border:1px solid #ccc; float: left; overflow:auto; ">
   		 <ul id="tree1"></ul>
    </div> 
   
    <div position="right" title="主要菜单" id="mainmenu" >
	         <div id="accordion1" > 
	         		<div title="课程管理" id="lesson">
              			<div id="lessonTree"></div>
        			</div>	
  			  </div>    
    </div>
     <div style="display: none;"> </div>   -->
</body>
<script type="text/javascript">
	 function f_heightChanged(options) {
            if (accordion && options.middleHeight - 24 > 0)
                accordion.setHeight(options.middleHeight - 24);
        }
	$(function ()
           { 
				layout = $("#layout1").ligerLayout({ height: '100%', rightWidth: 300, onHeightChanged: f_heightChanged, minLeftWidth: 120 });
          		var bodyHeight = $(".l-layout-center:first").height();
                accordion = $("#accordion1").ligerAccordion({ height: bodyHeight-24, speed: null ,changeHeightOnResize:true});
          });
		//验证
      var grid,manager,tree1;
      var maingform = $("#mainform");
      $.metadata.setType("attr", "validate");
      LG.validate(maingform, { debug: true });
      //覆盖本页面grid的loading效果
      LG.overrideGridLoading(); 

      function itemclick(item)
      {
          var editingrow = grid.getEditingRow();
          switch (item.text)
          {
              case "增加":
                  if (editingrow == null)
                  {
                      addNewRow();
                  } else
                  {
                      LG.tip('请先提交或取消修改');
                  }
                  break;
              case "修改":
                  if (editingrow == null)
                  {
                      beginEdit();
                  } else
                  {
                      LG.tip('请先提交或取消修改');
                  }
                  break;
              case "保存":
                  if (editingrow != null)
                  {
                      grid.endEdit(editingrow);
                  } else
                  {
                      LG.tip('现在不在编辑状态!');
                  }
                  break;
              case "取消":
                  if (editingrow != null)
                  {
                      grid.cancelEdit(editingrow); 
                  } else
                  {
                      LG.tip('现在不在编辑状态!');
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
      function f_reload()
      {
          grid.loadData();
      }
      function f_delete()
      { 
          var selected = grid.getSelected();
          if (selected)
          {
              if (!selected.roleId)
              {
                  grid.deleteRow(selected);
                  return;
              }
              LG.ajax({
                  loading:'正在删除中...',
                  data: { roleId: selected.roleId },
                  url:'${pageContext.request.contextPath}/system/deleteRole',
                  success: function () { 
                  	  inittree();
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
            { text: '保存', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/silkicons/page_save.png" },
            { line: true },
            { text: '取消', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/silkicons/cancel.png" },
            { line: true },
            { text: '删除', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_delete.gif" }
        ]
    };
     tree1=$("#tree1").ligerTree(
            {
                checkbox:true,
                nodeDraggable: true,  
                nodeWidth : 100,            
                url: "${pageContext.request.contextPath}/system/menuTree",
                textFieldName:"text",
                idFieldName:"id",
                parentIDFieldName:"menuPid",               
            });
     	var layout = $("#layout").ligerLayout({ leftWidth: 140 });
   		grid = $("#maingrid").ligerGrid({
   		url:"${pageContext.request.contextPath}/system/roleList",
        //headerImg:"../lib/icons/silkicons/table.png",title:'表格表头',
        columns: [
                 { display: '管理组名称', name: 'roleName', align: 'center', width:'20%'
                , validate: { required: true }
                , editor: { type: 'text' }
                },
                { display: '管理组描述', name: 'roleDescribe', align: 'center', width:'75%'
                , validate: { required: true }
                , editor: { type: 'text' }
                }
                ], dataAction: 'server', pageSize: 20, toolbar: toolbarOptions, sortName: 'id',
        width: '100%', height: '100%', heightDiff: -5, checkbox: false, usePager: false, enabledEdit: true, clickToEdit: false,
        fixedCellHeight: true, rowHeight: 25
    	});
	  	grid.bind('SelectRow', function (rowdata)
        	{
        		  inittree();    
        		  var s = rowdata.menuId.split(";");
                  for(var i=0;i<s.length;i++){
                  tree1.selectNode(s[i]);
                  }
			});  

	    grid.bind('beforeSubmitEdit', function (e)
	    {
	        if (!LG.validator.form())
	        {
	            LG.showInvalid();
	            return false;
	        }
	        return true;
	    });
	    function getChecked()
        {
            var notes = tree1.getChecked();
            var text = "";
            for (var i = 0; i < notes.length; i++)
            {
                
                text += notes[i].data.id + ";";
            }
            return text;
        }
	    grid.bind('afterSubmitEdit', function (e)
	    {
	        var isAddNew = e.record['__status'] == "add";
	        var data = $.extend({ menuId: getChecked }, e.newdata);
	        if (!isAddNew)
	            data.roleId = e.record.roleId;
	        LG.ajax({
	            loading: '正在保存数据中...',
	         	url:'${pageContext.request.contextPath}/system/saveRole',
	            data: data,
	            success: function ()
	            {
	                grid.loadData();
	                LG.tip('保存成功!');
	            },
	            error: function (message)
	            {
	                LG.tip(message);
	            }
	        }); 
	    }); 
	
	    function beginEdit()
	    {
	        var row = grid.getSelectedRow();
	        if (!row) { LG.tip('请选择行'); return; }
	        grid.beginEdit(row); 
	    }
	    function addNewRow()
	    {
	    	inittree();
	        grid.addEditRow();
	    }
		function inittree()
        {
            $(".l-checkbox", "#tree1").removeClass("l-checkbox-checked").addClass("l-checkbox-unchecked");
        }  

    </script>
</html>
