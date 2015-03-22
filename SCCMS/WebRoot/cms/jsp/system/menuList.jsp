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
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog2.js" type="text/javascript"></script>
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
  <div id="layout">
    <div position="left" title="主菜单模块" id="mainmenu">
        <ul id="maintree"></ul>
     </div>
    <div position="center" title="子菜单列表"  id="framecenter"> 
        <form id="mainform">
        <div id="maingrid"  style="margin:2px;"></div> 
        </form>
    </div>
  </div>
  <ul class="iconlist">
  </ul>
<script type="text/javascript">
      //验证
      var grid 
      var maingform = $("#mainform");
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
              if (!selected.id)
              {
                  grid.deleteRow(selected);
                  return;
              }
              LG.ajax({
                  loading:'正在删除中...',
                  data: { id: selected.id },
                  url:'${pageContext.request.contextPath}/system/deleteMenu',
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
            { text: '保存', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/silkicons/page_save.png" },
            { line: true },
            { text: '取消', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/silkicons/cancel.png" },
            { line: true },
            { text: '删除', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_delete.gif" }
        ]
    };
    var currentMenuParentNo;
    var tree = $("#maintree").ligerTree({
        url: "${pageContext.request.contextPath}/system/mainMenuList",
        checkbox: false,
        onClick: function (node)
        {
        	currentMenuParentNo = node.data.id;
            if (node.data.menuPid==0) return;
            grid.set('url', '${pageContext.request.contextPath}/system/subMenuList?id='+currentMenuParentNo);
        }
    });
   		grid = $("#maingrid").ligerGrid({
        //headerImg:"../lib/icons/silkicons/table.png",title:'表格表头',
        columns: [
                { display: '菜单名', name: 'text', align: 'left', width: 180, minWidth: 60
                , validate: { required: true }
                , editor: { type: 'text' }
                },
                { display: '菜单编号', name: 'menuNumber', align: 'left', width: 130, minWidth: 60
                , validate: { required: true }
                , editor: { type: 'text' }
                },
                { display: '链接地址', name: 'menuAddress', align: 'left', width: 300, minWidth: 60
                , validate: { required: true }
                , editor: { type: 'text' }
                }
                , { display: '图标', name: 'icon', align: 'left', width: 230, minWidth: 50
                , editor: { type: 'select',
                    ext:
                    function (rowdata)
                    {
                        return {
                            onBeforeOpen: function ()
                            {
                                currentComboBox = this;
                                f_openIconsWin();
                                return false;
                            },
                            render: function ()
                            {
                                return rowdata.icon;
                            }
                        };
                    } }
                , render: function (item)
                {
                    return "<div style='width:100%;height:100%;'><img src='" + item.icon + "' /></div>";
                }
                }
                ], dataAction: 'server', pageSize: 20, toolbar: toolbarOptions, sortName: 'id',
        width: '98%', height: '100%', heightDiff: -5, checkbox: false, usePager: false, enabledEdit: true, clickToEdit: false,
        fixedCellHeight: true, rowHeight: 25
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
    grid.bind('afterSubmitEdit', function (e)
    {
        var isAddNew = e.record['__status'] == "add";
        var data = $.extend({ menuPid: currentMenuParentNo }, e.newdata);
        if (!isAddNew)
            data.id = e.record.id;
        LG.ajax({
            loading: '正在保存数据中...',
         	url:'${pageContext.request.contextPath}/system/saveOrUpdate',
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
        grid.addEditRow();
    }
 </script>
</body>
</html>
