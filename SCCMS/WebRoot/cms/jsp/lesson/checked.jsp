<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>checked</title>
<link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/json2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>  
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script> 
   	<script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
   	 <script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
    <script type="text/javascript">
    	var classId = ${session.classId};
        $(f_initGrid);
        var manager, g;
        function f_initGrid()
        { 
           g =  manager = $("#maingrid").ligerGrid({
                columns: [
                { display: '课节编号', name: 'classId', width: 80, type: 'int' },
                { display: '讲义编号', name: 'lectId', width: 80, type: 'int' },
                { display: '讲义标题', name: 'lectTitle', width: 80, type: 'int' },
                { display: '分钟', name: 'lectMin', width: 50, type: 'int' },
                { display: '秒', name: 'lectSec', width: 50, type: 'int' },
                { display: '添加日期', name: 'lectAddTime', type: 'date', width: 100 },
                { display: '讲义内容', name: 'lectContent', align: 'left', width: 300
                }
                ],
                onSelectRow: function (rowdata, rowindex)
                {
                    $("#txtrowindex").val(rowindex);
                }, 
                pageSize:10,
                enabledEdit: true, 
                detailToEdit: false, 
                rowHeight: 25,headerRowHeight:30,
                pageSizeOptions: [3,10, 20, 30, 40, 50], 
                /* isScroll: true,  */
                frozen:false,
                url:'${pageContext.request.contextPath}/grade/lectureList?classId='+classId,
                toolbar: { items: [
                { text: '增加', click: addLecture, icon: 'add' },
                { line: true },
                { text: '修改', click: modifyLecture, icon: 'modify' },
                { line: true },
                { text: '删除', click: deleteclick, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' },
                { line: true },
                { text: '发布预览讲义', click: f_releaseLecture, img: '${pageContext.request.contextPath}/cms/images/32X32/sign_up.gif' },
                { line: true },         
                { text: '上传讲义', click: upload, img: '${pageContext.request.contextPath}/cms/images/32X32/invoice.gif' },
                { line: true }
                ]
                },
                width: '100%',
                height: '98%'
            });   
        }
        function f_releaseLecture(){
        	$.post("${pageContext.request.contextPath}/release/releaseLecture",{classId:classId },
          					function(ok){
          						if(ok==true){
          							window.loginWin=$.ligerDialog.open({ 
						          	  	url: "http://localhost:8080/memberCenter/lecture/lecture"+classId+".html",
						          	    title:'预览',
						          	    isHidden: false,
						          	    icon: 'images/Program Files Folder.png',
						          	    height: 450,width:700
						          	    });	       
          						}else{
          							$.ligerDialog.error('发布失败');
          						}
						},
						"json"
          			);
        }
        function upload(){
        	$.ligerDialog.open({ url: '${pageContext.request.contextPath}/cms/jsp/lesson/upload.jsp', height: 460,width: 450, buttons: [ 
        		{ text: '关闭', onclick: 
        			function (item, dialog)
        			{
        			 dialog.close(); 
        			 } 
        		} ] 
        	});
        }
        
        //添加讲义
        function addLecture()
        {
        	if(parent.tab.isTabItemExist("addLecture")){parent.tab.removeTabItem("addLecture");}
            parent.tab.addTabItem({tabid:"addLecture",url:"${pageContext.request.contextPath}/grade/loadLecture?classId="+ classId,
            text:"添加讲义" });       
        }
        
         //修改讲义

        function modifyLecture()
        {
        	var row =manager.getSelectedRow();
        	if (!row) { $.ligerDialog.warn('请选择行'); return; }	
        	if(parent.tab.isTabItemExist("modifyLecture")){parent.tab.removeTabItem("modifyLecture");}
            parent.tab.addTabItem({tabid:"modifyLecture",url:"${pageContext.request.contextPath}/grade/modifyLecture?lectId="+ row.lectId,
            text:"修改讲义" });       
        }
        
        //删除讲义
         function deleteclick()
		        {
		              $.ligerDialog.confirm('确定删除？', function (yes)
                     {
              
                         if(yes==true){
                         	var row =manager.getSelectedRow();
                         	$.post("${pageContext.request.contextPath}/grade/lectureDelete",{lectId:row.lectId},
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('删除成功');
          							parent.fresh("checkClassDetail");
          						}else{
          							$.ligerDialog.error('删除失败');
          						}
							},
							"json"
          					);
                         }
                     });
		        }
        function itemclick(item)
        {
            alert(item.text);
        } 
       
    </script>
</head>
<body  style="padding:0px"> 
 <div class="l-clear"></div>
    <div id="maingrid" style="margin-top:0px" style="height:100%"></div> 
    <br />
  <div style="display:none;">
  <!-- g data total ttt -->
</div>
</body>
</html>
