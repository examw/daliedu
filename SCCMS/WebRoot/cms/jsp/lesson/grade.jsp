<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
    <title></title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/CustomersData.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/AllOrdersData.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script> 
   	<script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
   	<script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
    <script type="text/javascript">
    	var g,manager,gradeId,ligerGetGridManager,tchId,gradeName;
    	var examId =${session.gexamId};
    	var row ;
        function itemclick(item)
        {
            alert(item.text);
        }
        //获得班级id
       
      	//班级管理
      	//班级删除
      	function deleteGrade(){
      		var row = manager.getSelectedRow();
        	if (!row) { $.ligerDialog.warn('请选择行'); return; }
        	$.ligerDialog.confirm('确定删除？', function (yes)
                     {
                       
                         if(yes==true){
                         	$.post("${pageContext.request.contextPath}/grade/gradeDelete",{gradeId:row.gradeId},
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('删除成功');
          							manager.loadData();
          						}else{
          							$.ligerDialog.error('删除失败');
          						}
							},
							"json"
          					);
                         }
                     });
   		}
        //添加班级
        function addClass()
        {	
            if(parent.tab.isTabItemExist("addGrade")){parent.tab.removeTabItem("addGrade");}
            parent.tab.addTabItem({tabid:"addGrade",url:"${pageContext.request.contextPath}/cms/jsp/lesson/add.jsp",text:"增加班级"});
        }
        
        //班级修改
         function modifyClass()
        {
        	var row = manager.getSelectedRow();
        	if (!row) { $.ligerDialog.warn('请选择行'); return; }
            if(parent.tab.isTabItemExist("modifyGrade")){parent.tab.removeTabItem("modifyGrade");}
            parent.tab.addTabItem({tabid:"modifyGrade",url:"${pageContext.request.contextPath}/grade/gradeLoad?gradeId="+row.gradeId,text:"修改班级"});
        }
        //附件上传
        function uploadFile(){
        	var row = manager.getSelectedRow();
        	if (!row) { $.ligerDialog.warn('请选择行'); return; }
        	window.uploadFileWin=$.ligerDialog.open(
               	 	{ 
        	     		url: '${pageContext.request.contextPath}/grade/chooseFile?gradeId='+row.gradeId,
        			    title:'附件上传',
        			    isHidden: false,
        				icon: 'images/Program Files Folder.png',
        			    height: 300,width: 410,name:'uploadFileWin',
        			    buttons: [ 
        			        { text: '关闭', onclick: function (item, dialog) { dialog.close();manager.loadData(); } } ]
        	       });
        }
        //课节管理
        
        //课节添加
        function addClassDetail()
        {
            if(parent.tab.isTabItemExist("addClassDetail")){parent.tab.removeTabItem("addClassDetail");}
            parent.tab.addTabItem({tabid:"addClassDetail",url:"${pageContext.request.contextPath}/grade/classDetailLoad?gradeId="+gradeId ,
            text:"添加章节" });
        }
        
        //课节修改
        function modifyClassDetail()
        {
        	var  row =ligerGetGridManager.getSelectedRow();
        	if (!row||checkedCustomer.length!=1) { $.ligerDialog.warn('请先选择一行'); return; }
            if(parent.tab.isTabItemExist("modifyClassDetail")){parent.tab.removeTabItem("modifyClassDetail");}
            parent.tab.addTabItem({tabid:"modifyClassDetail",url:"${pageContext.request.contextPath}/grade/modifyClassDetail?classId="+row.classId,
            text:"课节修改" });
        }
        //课节删除
   		function deleteClassDetail(){
        	if (checkedCustomer.join()=="") 
        	{
        	$.ligerDialog.warn('请选择行'); return; 
        	}
        	$.ligerDialog.confirm('确定删除？', function (yes)
                     {
                         if(yes==true){
                         	$.post("${pageContext.request.contextPath}/grade/classDetailDelete",{classId:checkedCustomer.join()},
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('删除成功');
          							parent.managerClassDetail.loadData();
          							manager.loadData();
          						}else{
          							$.ligerDialog.error('删除失败');
          						}
							},
							"json"
          					);
                         }
                     });
   		}
        //讲义添加
       	/* function addLecture()
        {
        	var row =ligerGetGridManager.getSelectedRow();
        	if (!row) { $.ligerDialog.warn('请选择行'); return; }
        	if(parent.tab.isTabItemExist("addLecture"))
        	{
        		parent.tab.removeTabItem("addLecture");
        	}	
            	parent.tab.addTabItem({tabid:"addLecture",url:"${pageContext.request.contextPath}/grade/loadLecture?classId="+ row.classId,
            	text:"添加讲义"+row.classId });        }
        */
       	//查看讲义内容
       	function checkClassDetail()
        {	
        	var row =ligerGetGridManager.getSelectedRow();
        	if (!row||checkedCustomer.length!=1) { $.ligerDialog.warn('请先选择一行'); return; }
        	if(parent.tab.isTabItemExist("checkClassDetail")){parent.tab.removeTabItem("checkClassDetail");}
            parent.tab.addTabItem({tabid:"checkClassDetail",url:"${pageContext.request.contextPath}/grade/lecture?classId="+row.classId,
            text:"预览讲义" });        
        }   
        //明细
        $(function ()
        {
            f_showCustomers(); 
        });
        //显示班级
        function f_showCustomers()
        {		
            g = $("#maingrid").ligerGrid({
              	 columns: [
                { display: '班级名', name: 'name', align: 'left', width: 200, minWidth: 60,
                	 render:function(record, rowindex, value, column) {
     					if(record.gradeName) return record.gradeName;
   						else return value;
     			}},
                { display: '老师', name: 'tchName', minWidth: 120 },
                { display: '课时', name: 'gradeTime', minWidth: 120 },
                { display: '原价', name: 'gradeOPrice', minWidth: 150 },
                { display: '实价', name: 'gradeRPrice', minWidth: 150 },
                { display: '到期时间', name: 'gradeDueTime',minWidth: 200 ,type:'date'},
                { display: '附件地址', name: 'dataDownloadUrl',minWidth: 200},
                ],   
				url:'${pageContext.request.contextPath}/exam/gradeList?id='+examId ,
				rowHeight: 25,headerRowHeight:30,
				toolbar: { items: [
                { text: '增加', click: addClass, icon: 'add' },
                { line: true },
                { text: '修改', click: modifyClass, icon: 'modify' },
                { line: true },
                { text: '删除', click: deleteGrade, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' },
                { line: true },
                { text: '附件上传', click: uploadFile, icon: 'add' }
                ]
                },
				rownumbers:true,
				//isScroll: false, 
				frozen:false,
				//pageSize:30,
				pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                showTitle: false,width:'99%',
                height:'100%',
                columnWidth:120,
                detail:{ onShowDetail:f_showOrder,height:'100%'},
                dataAction:'local',
                onError: function (a, b)
                { 
                }
            
            });
            manager=$("#maingrid").ligerGetGridManager();
            
            $("#pageloading").hide();
        }
        function f_showFLV(id){
        	 window.loginWin=$.ligerDialog.open({ 
	          	  	url: '${pageContext.request.contextPath}/grade/showFLV?classId='+id,
	          	    title:'预览',
	          	    isHidden: false,
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 420,width:700
	          	    });	   
        }
        function f_showOrder(row, detailPanel,callback)
        {
            var grid = document.createElement('div'); 
            gradeId=row.gradeId;
            tchId = row.tchId;
            gradeName=row.name;
            $(detailPanel).append(grid);
            $(grid).css('margin',10).ligerGrid({
               columns:
                [
                            { display: '章节标题', name: 'classTitle',type:'float',minWidth: 180 },
                            { display: '课程年份', name: 'classYear',type:'float' },
                            { display: '添加时间', name: 'classAddTime' ,minWidth: 180,type:'date'},
                            { display: '开放时间', name: 'classOpenTime',minWidth: 180,type:'date' },
                            { display: '免费试听', name: 'ifFree',width:100 },
                            { display: '课节时间', name: 'time' },
                            {display: '高清视频',width:100,render: function (row)
                    		{
                       			 var html = "<a href='javascript:f_showFLV(" + row.classId + ")'>预览</a> ";
                        		return html;
                   			 }}
                 ], 
                toolbar: { items: [
                { text: '增加', click: addClassDetail, icon: 'add' },
                { line: true },
                { text: '修改', click: modifyClassDetail, icon: 'modify' },
                { line: true },
                { text: '删除', click: deleteClassDetail, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' },
                { line: true },
                { text: '批量添加', click: f_batchAdd, icon: 'add' },
                { line: true },
                { text: '查看讲义', click: checkClassDetail, img: '${pageContext.request.contextPath}/cms/images/icon/searchtool.gif' },
                { line: true },
                { text: '批量设置开放时间', click: setOpenTime, img: '${pageContext.request.contextPath}/cms/images/icon/searchtool.gif' }
                ]
                },
                isChecked: f_isChecked, 
                onCheckRow: f_onCheckRow,
                onCheckAllRow: f_onCheckAllRow,
                checkbox:true, 
                pageSizeOptions: [10, 5, 8],
                isScroll: false,
                showToggleColBtn: false, 
                dataAction:'local',
                width: '95%',
                url:'${pageContext.request.contextPath}/grade/classDetailList?gid='+gradeId, 
                showTitle: false,
                columnWidth: 120,
                onAfterShowData: callback,
                onDblClickRow : function (data, rowindex, rowobj)
                {
                   if(parent.tab.isTabItemExist("checkClassDetail")){parent.tab.removeTabItem("checkClassDetail");}
           			 parent.tab.addTabItem({tabid:"checkClassDetail",url:"${pageContext.request.contextPath}/grade/lecture?classId="+data.classId,text:"查看讲义" });        
                },
                frozen:false
                
            });  
           parent.managerClassDetail=$(grid).ligerGetGridManager();
           ligerGetGridManager =$(grid).ligerGetGridManager();
           row =ligerGetGridManager.getSelectedRow();
        }
        
        //批量添加
        function f_batchAdd(){
        	window.loginWin=$.ligerDialog.open({ 
			          	  	url: "${pageContext.request.contextPath}/cms/jsp/lesson/batchAdd.jsp?gradeId="+gradeId+"&tchId="+tchId,
			          	    title:gradeName,
			          	    isHidden: false,
			          	    icon: 'images/Program Files Folder.png',
			          	    height: 500,width:700
			          	    });		
        }
		
        //复选框
         function f_onCheckAllRow(checked)
        {
            for (var rowid in this.records)
            {
                if(checked)
                    addCheckedCustomer(this.records[rowid]['classId']);
                else
                    removeCheckedCustomer(this.records[rowid]['classId']);
            }
        }

        /*
        ·即利用onCheckRow将选中的行记忆下来，并利用isChecked将记忆下来的行初始化选中
        */
        var checkedCustomer = [];
        function findCheckedCustomer(classId)
        {
            for(var i =0;i<checkedCustomer.length;i++)
            {
                if(checkedCustomer[i] == classId) return i;
            }
            return -1;
        }
        function addCheckedCustomer(classId)
        {
            if(findCheckedCustomer(classId) == -1)
                checkedCustomer.push(classId);
        }
        function removeCheckedCustomer(classId)
        {
            var i = findCheckedCustomer(classId);
            if(i==-1) return;
            checkedCustomer.splice(i,1);
        }
        function f_isChecked(rowdata)
        {
            if (findCheckedCustomer(rowdata.classId) == -1)
                return false;
            return true;
        }
        function f_onCheckRow(checked, data)
        {
            if (checked) addCheckedCustomer(data.classId);
            else removeCheckedCustomer(data.classId);
        }
        function f_getChecked()
        {
            alert(checkedCustomer.join());
        }
        function  f_closeWindow()
			{
           window.loginWin.close(); 
           parent.fresh("grade");
		}
        function setOpenTime(){
        	var  rows =ligerGetGridManager.getSelectedRows();
        	if(!rows||rows.length==0){$.ligerDialog.warn('请选择行'); return; }
        	window.setOpenTimeWin=$.ligerDialog.open({ 
          	  	url: "${pageContext.request.contextPath}/cms/jsp/lesson/chooseOpenTime.jsp",
          	    title:'设置开放时间',
          	    isHidden: false,
          	    icon: 'images/Program Files Folder.png',
          	    height: 300,width:300,name:'setOpenTimeWin',
          	  	buttons: [ 
          	  	        { text: '确定',onclick:function(item,dialog){
          	  	        	var s = $("#setOpenTimeWin")[0].contentWindow.submit();
          	  	        	if(!s) return;
          	  	        	var ids=[];
          	  	        	$.each(rows,function(i){
          	  	        		ids.push(rows[i].classId);
          	  	        	});
          	  	        	ids.join(",");
          	  	        	$.ajax({
          	  	        		type:"POST",
          	  	        		url:"${pageContext.request.contextPath}/grade/updateOpenTime",
          	  	        		data:{"ids":ids,"time":s},
          	  	        		dataType:"json",
          	  	        		success:function(data){
          	  	        			if(data){
          	  	        				dialog.close();
          	  	        				ligerGetGridManager.loadData();
          	  	        			}
          	  	        		}
          	  	        	});
          	  	        }},
    			        { text: '关闭', onclick: function (item, dialog) { dialog.close();} } ]
          	    });	
        }
        
    </script>
</head>
<body style="overflow-x:hidden; padding:2px;">
<div class="l-loading" style="display:block" id="pageloading"></div>
 <a class="l-button" style="width:120px;float:left; margin-left:10px; display:none;" onclick="deleteRow()">删除选择的行</a>
 <div class="l-clear"></div>

    <div id="maingrid"></div>
   
  <div style="display:none;">
  
</div>
 
</body>
</html>
