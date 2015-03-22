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
    	var g,manager,gradeId,classPackageDetailManager;
    	var ptypeId =${session.ptypeId};
        function itemclick(item)
        {
            alert(item.text);
        }
        //套餐添加
        function addClassPackage()
        {
            if(parent.tab.isTabItemExist("addClassPackage")){parent.tab.removeTabItem("addClassPackage");}
            parent.tab.addTabItem({tabid:"addClassPackage",url:"${pageContext.request.contextPath}/cms/jsp/lesson/addClassPackage.jsp",
            text:"添加套餐" });
        }
        //套餐修改
        function modifyClassPackage()
        {
        	var row =manager.getSelectedRow();
            if (!row) { $.ligerDialog.warn('请选择行'); return; }	
            if(parent.tab.isTabItemExist("modifyClassPackage")){parent.tab.removeTabItem("modifyClassPackage");}
            parent.tab.addTabItem({tabid:"modifyClassPackage",url:"${pageContext.request.contextPath}/package/classPackageLoad?pkgId="+row.pkgId,
            text:"修改套餐" });
        }
        //套餐删除
          function deleteClassPackage(){
      		var row =manager.getSelectedRow();
        	if (!row) { $.ligerDialog.warn('请选择行'); return; }	
        	$.ligerDialog.confirm('确定删除？', function (yes)
                     {
                         if(yes==true){
                         	$.post("${pageContext.request.contextPath}/package/classPackageDelete",{pkgId:row.pkgId},
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
        //明细
        $(function ()
        {
            f_showCustomers(); 
        });
        //显示顾客
        function f_showCustomers()
        {		
        	/* 	alert(parent.examId);  */
        	
            g = $("#maingrid").ligerGrid({
            	height:'100%',
               columns: [
                { display: '套餐名', name: 'pkgName', align: 'left', width: 150, minWidth: 60 },
                { display: '课时', name: 'pkgTotalTime', width: 60,minWidth: 30 },
                { display: '原价', name: 'pkgOPrice', width: 80,minWidth: 60 },
                { display: '实价', name: 'pkgRPrice', width: 80,minWidth: 60 },
                { display: '老学员价', name: 'pkgSPrice', width: 80,minWidth: 60 },
                { display: '招生到期时间', name: 'pkgRMatureDate' ,type:'date'},
                { display: '学习到期时间', name: 'pkgRMatureDate',type:'date' },
                { display: '礼品', name: 'pkgPresent' }
                ],   
				url:'${pageContext.request.contextPath}/package/classPackageList?ptypeId='+ptypeId,
				rowHeight: 25,headerRowHeight:30,
				toolbar: { items: [
                { text: '增加', click: addClassPackage, icon: 'add' },
                { line: true },
                { text: '修改', click: modifyClassPackage, icon: 'modify' },
                { line: true },
                { text: '删除', click: deleteClassPackage, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' }
                ]
                },
                dataAction:'local',
				rownumbers:true,
				//isScroll: false, 
				frozen:false,
				//pageSize:30,
				pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                showTitle: false,width:'99%',
                height:'95%',
                columnWidth:120,
                detail: { onShowDetail: f_showOrder ,height:'60%'},
                onError: function (a, b)
                { 
                }
            
            });
            manager=$("#maingrid").ligerGetGridManager();
            
            $("#pageloading").hide();
        }
        function f_showOrder(row, detailPanel,callback)
        {
            var grid = document.createElement('div'); 
            gradeId=row.gradeId;
            $(detailPanel).append(grid);
            $(grid).css('margin',10).ligerGrid({
                columns:
                [
                { display: '班级名', name: 'name', align: 'left', width: 150, minWidth: 60 },
               	{ display: '老师', name: 'tchName', minWidth: 80 },
                { display: '课时', name: 'gradeTime', minWidth: 60},
                { display: '原价', name: 'gradeOPrice',width: 100, minWidth: 80 },
                { display: '实价', name: 'gradeRPrice', width: 100,minWidth: 80 },
                { display: '到期时间', name: 'gradeDueTime',type:'date',minWidth: 120 }
                ],  
                usePager:false, 
                isScroll: false,
                showToggleColBtn: false, 
                width: '95%',
               /*  pageSizeOptions: [10, 20, 30, 40, 50, 100], */
                url:'${pageContext.request.contextPath}/package/gradeList?pkgId='+row.pkgId, 
                dataAction:'local',
                showTitle: false, columnWidth: 120,
                onAfterShowData: callback,
                frozen:false
            });  
          classPackageDetailManager=$(grid).ligerGetGridManager();
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
