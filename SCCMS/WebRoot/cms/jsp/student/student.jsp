<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
    <link href="${pageContext.request.contextPath}/cms/css/common.css" rel="stylesheet" type="text/css" />  
    <script src="${pageContext.request.contextPath}/cms/js/common.js" type="text/javascript"></script>   
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.expand.js" type="text/javascript"></script>  
    <script src="${pageContext.request.contextPath}/cms/js/json2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
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
    	a{color:blue;}
    </style>
    
</head>
<body style="padding: 4px; overflow: hidden;">
<div class="l-panel-search" >
 <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search" ltype="select" >
			<option value="all" selected="selected">全部</option>
			<option value="today">今天</option>
			<option value="week">近一周</option>
			<option value="month">近一个月</option>
			<option value="premonth">近两个月</option>
		</select>
    </div>
     <div class="l-panel-search-item">
     	<span style="font-size: 14px; color: green;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;精确搜索:</span>
    </div>
    <div class="l-panel-search-item">
        <input class="l-text" type="text" id="content"  style="height: 16px;"/>
    </div>
     <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search1" ltype="select">
			<option value="stuMobile" >按手机</option>
			<option value="stuPhone">按电话</option>
			<option value="stuUsername"  selected="selected">按用户名</option>
			<option value="stuName">按真实姓名</option>
		</select>
    </div>
    <div class="l-panel-search-item">
        <div id="searchbtn" class="l-btn"  style="width:80px;">搜索<div class="l-btn-l"></div><div class="l-btn-r"></div><span></span></div>
    </div>
    <div class="l-panel-search-item">
        <div id="back" class="l-btn"  style="width:80px;display:none" onclick="f_back()">返回<div class="l-btn-l"></div><div class="l-btn-r"></div><span></span></div>
    </div>
</div>
   	<form id="mainform">
    <div id="maingrid" style="margin: 0; padding: 0 ;float: left;" >
    </div>
    </form>
    <div style="display: none;">
    </div>
</body>
<script type="text/javascript">
	 $.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	//return value.toString().substring(0,value.toString().indexOf("T"));
    	 	return value.toString().replace("T","  ");
    	 };
		//验证
      var grid,manager,tree1;
      var statusData = [{ stuStatus: 1, text: '正常' }, {stuStatus:0 , text: '冻结'}];
      var maingform = $("#mainform");
      $.metadata.setType("attr", "validate");
      LG.validate(maingform, { debug: true });
      //覆盖本页面grid的loading效果
      LG.overrideGridLoading(); 
       $(function(){
       		f_showStu();
        	$("#search").change(function(){
        		$("#content").val("");
        		grid.set({newPage:1});
        		f_showStu();
        	});
        });
      

      function itemclick(item)
      {
          var editingrow = grid.getEditingRow();
          switch (item.text)
          {
          	  case "添加":
          		parent.addTab("addStudent","${pageContext.request.contextPath}/cms/jsp/student/addStu.jsp","添加学员");
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
              case "导出":
            	  parent.addTab("exportStudent","${pageContext.request.contextPath}/cms/jsp/student/export.jsp","导出学员");
        	  	  break;
              case "重置学员密码":
                  var selected = grid.getSelected();
                  if (selected)
                  {
                      if (!selected.stuId)
                      {
                          grid.deleteRow(selected);
                          return;
                      }
                      $.ligerDialog.confirm('确定将密码重置为123456吗?', function (confirm) {
                          if (confirm)
                              f_resetPwd(selected.stuId);
                      });
                  }
         	 		else
          			{
              			LG.tip('请选择行!');
          			}
                  break;
              case "重置学员设备号":
                  var selected = grid.getSelected();
                  if (selected)
                  {
                      if (!selected.stuId)
                      {
                          grid.deleteRow(selected);
                          return;
                      }
                      $.ligerDialog.confirm('确定重置学员设备号吗?', function (confirm) {
                          if (confirm)
                              f_resetDeviceId(selected.stuId);
                      });
                  }
         	 		else
          			{
              			LG.tip('请选择行!');
          			}
                  break;
              case "增加听课次数":
                  var selected = grid.getSelected();
                  if (selected)
                  {
                      if (!selected.stuId)
                      {
                          grid.deleteRow(selected);
                          return;
                      }
                      //dialog
                      window.addListenNumWin=$.ligerDialog.open(
                         	 	{ 
                  	     		url: '${pageContext.request.contextPath}/user/addListenNumPage?stuId='+selected.stuId,
                  			    title:'增加听课次数',
                  			    isHidden: false,
                  				icon: 'images/Program Files Folder.png',
                  			    height: 200,width: 500,name:'addListenNumWin',
                  			    buttons: [ 
                  			        { text: '确定', onclick: function (item, dialog) {
                  			        	var num = $("#addListenNumWin")[0].contentWindow.getValue2('num');
                  			        	var recordId = $("#addListenNumWin")[0].contentWindow.getValue2('record');
                  			        	if(num > 0 && recordId != 0){
                  			        		$.ajax({
                  			        			type:"POST",
                  			        			url:'${pageContext.request.contextPath}/user/addListenNum',
                  			        			data:{num:num,recordId:recordId},
                  			        			dataType:"json",
                  			        			success:function(data){
                  			        				if(data){
                  			        					LG.showSuccess('修改成功');
                  			        					dialog.close();
                  			        				}else{
                  			        					LG.showSuccess('修改失败');
                  			        				}
                  			        			},
                  			        			error:function(){
                  			        				LG.showSuccess('系统异常');
                  			        				dialog.close();
                  			        			}
                  			        		});
                  			        	}
                  			        } }, 
                  			        { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ]
                  	       });
                  }
         	 		else
          			{
              			LG.tip('请选择行!');
          			}
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
              if (!selected.stuId)
              {
                  grid.deleteRow(selected);
                  return;
              }
              LG.ajax({
                  loading:'正在删除中...',
                  data: { stuId: selected.stuId },
                  url:'${pageContext.request.contextPath}/user/studentDelete',
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
      function f_resetPwd(stuId)
      { 
    
              LG.ajax({
                  loading:'正在重置中...',
                  data: { stuId: stuId },
                  url:'${pageContext.request.contextPath}/user/resetPwd',
                  success: function () { 
                      LG.showSuccess('重置成功');
                      f_reload();
                  },
                  error: function (message)
                  {
                      LG.showError(message);
                  }
              });
      }
      function f_resetDeviceId(stuId)
      { 
              LG.ajax({
                  loading:'正在重置中...',
                  data: { stuId: stuId },
                  url:'${pageContext.request.contextPath}/user/resetDeviceId',
                  success: function () { 
                      LG.showSuccess('重置成功');
                      f_reload();
                  },
                  error: function (message)
                  {
                      LG.showError(message);
                  }
              });
      }
      var toolbarOptions = { 
        items: [    
			{ text: '添加', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_new.gif" },
			{ line: true },
            { text: '修改', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_edit.gif" },
            { line: true },
            { text: '保存', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/silkicons/page_save.png" },
            { line: true },
            { text: '取消', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/silkicons/cancel.png" },
            { line: true },
            { text: '删除', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_delete.gif" },
            { line: true },
            { text: '导出', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_next.gif" },
            { line: true },
            { text: '重置学员密码', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_next.gif" },
            { line: true },
            { text: '重置学员设备号', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_next.gif" },
            { line: true },
            { text: '增加听课次数', click: itemclick, img: "${pageContext.request.contextPath}/cms/images/miniicons/page_next.gif" }
        ]
    };
     var grid;
     function f_showStu(){
     		grid = $("#maingrid").ligerGrid({
   			columns: [ 
                {display: '用户名', name: 'stuUsername', align: 'center', width: 80 } ,
                {display: '姓名', name: 'stuName', align: 'center', width: 80 } ,
                {display: '邮箱', name: 'stuEmail', width: 120},
                {display: '状态', name: 'stuStatus', width: 80, align: 'center' ,
                 editor: { type: 'select', data: statusData, valueColumnName: 'stuStatus' },
                 render:function(record, rowindex, value, column) {
                					if(value==1) return "<span style='color:green'>正常</span>"; 
              						else return "<span style='color:red'>冻结</span>";
                }},
                {display: 'QICQ', name: 'QICQ', width: 100, align: 'center',editor: { type: 'text' } },
                //{display: '电话', name: 'stuPhone', width: 100, align: 'center' ,editor: { type: 'text' }, validate:{digits:true}},
                {display: '手机', name: 'stuMobile', width: 100, align: 'center' ,editor: { type: 'text' },validate: {digits:true}},
                {display: '设备数', name: 'deviceNum', width: 100, align: 'center' ,editor: { type: 'text' },validate: {digits:true}},
                //{display: '地址', name: 'stuAddr', width: 180, align: 'left',editor: { type: 'text' } },
                {display: '类型', name: 'stuType', width: 80, align: 'center', render:function(record, rowindex, value, column) {
					if(value==1) return "面授学员";
					else if(value==2) return "<span style='color:red'>面授学员</span>";
						else return "";
				}},
				{display: '地区', name: 'stuArea', width: 120},
				{display: '考试', name: 'stuExam', width: 120},
                {display: '操作',width:180,render:  function (row)
                    {
                        var h="";
                        h += "<a href='javascript:f_showDetail(" + row.stuId + ")'>订单详细</a> ";
                        h += "<a href='javascript:f_showStudy(" + row.stuId + ")'>学习记录</a> ";
                        if(row.stuType==1)
                        {
                        	h += "<a href='javascript:f_orderClass(" + row.stuId + ")'>开通课程</a> ";
                        }else if(row.stuType==2)
                        {
                        	h += "已开通课程";
                        }
                        return h;
                    }}
                ], url:"${pageContext.request.contextPath}/user/studentSelect?date="+$("#search").val(), pageSize: 10, sortName: 'stuAddTime',
                width: '98%', height: '98%', rownumbers:true,dataAction:"server",sortOrder:'desc',
               	toolbar: toolbarOptions,enabledEdit: true, clickToEdit: false,fixedCellHeight: true, rowHeight: 25,checkbox: false
    	});
		grid.bind("dblClickRow",
            function(rowdata, rowindex, rowDomElement){
            			parent.addTab("stuDetail","${pageContext.request.contextPath}/user/loadStu?stuId="+rowdata.stuId,"学员详细信息");
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
	    	var data = $.extend();
	    	data.stuStatus =e.record.stuStatus;
	        data.stuId = e.record.stuId;
	        data.stuPhone =e.record.stuPhone;
	        data.stuMobile =e.record.stuMobile;
	        data.stuAddr = e.record.stuAddr;
	        data.QICQ = e.record.QICQ;
	        data.deviceNum = e.record.deviceNum;
	        LG.ajax({
	            loading: '正在保存数据中...',
	         	url:'${pageContext.request.contextPath}/user/studentModify',
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
     	}
     	$(function(){
     		 $("#searchbtn").click( function ()
            {
               f_search();
            }); 
     	});
     	 function f_showStudy(id)
     	 {
       	 	window.loginWin=$.ligerDialog.open(
       	 	{ 
	     		url: '${pageContext.request.contextPath}/user/studyInfo?stuId='+id,
			    title:'学习记录',
			    isHidden: false,
				icon: 'images/Program Files Folder.png',
			    height: 450,width: 710    	
	       });
        }
     	function f_orderClass(id)
     	{
     		parent.addTab("chooseClass","${pageContext.request.contextPath}/user/chooseClassFirst?stuId="+id,'选课');
     	}
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
            var str = escape(escape($("#content").val()));
            $("#search").val("all");
            grid.set({url:"${pageContext.request.contextPath}/user/searchStu?str="+str+"&searchName="+$("#search1").val(),newPage:1});
        }
     	
     	function f_back()
        {
        	$("#back").hide();
        	grid.set({url:"${pageContext.request.contextPath}/user/studentSelect?date="+$("#search").val(),newPage:1});
        }
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
	     function f_showDetail(id)
        {
        	parent.addTab("stuOrder","${pageContext.request.contextPath}/user/stuOrder?stuId="+id ,'订单详情');
        }
    </script>
</body>
</html>
