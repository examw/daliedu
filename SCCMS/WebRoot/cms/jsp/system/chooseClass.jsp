<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
   	<script src="${pageContext.request.contextPath}/cms/js/ligerLayout.js" type="text/javascript"></script>
   	 <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
   	<script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script>
   	<script src="${pageContext.request.contextPath}/cms/js/ligerTab.js" type="text/javascript"></script>
   	<script src="${pageContext.request.contextPath}/cms/js/ligerDialog2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerAccordion.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/cms/css/common.css" rel="stylesheet" type="text/css" />  
    <script src="${pageContext.request.contextPath}/cms/js/common.js" type="text/javascript"></script>  

    <style type="text/css">
    .l-panel td.l-grid-row-cell-editing { padding-bottom: 2px;padding-top: 2px;}
        .l-table-edit {margin-top:180px}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
</head>
<body style="padding:2px;text-align:center;">
  <div id="layout1">
  	 <div position="left">
  	<div id="accordion1" > 
	      <div title="课程" id="lesson">
              			<div id="maintree"></div>
        </div>	
  	</div> 
  	</div>    
    <div position="center" title="" > 
    <center>
    	<div id="accordion2" > 
	      <div title="套餐" id="package">
	      		<div id="maingrid1"></div>
        </div>	
        <div title="班级" id="grade">
              	<div id="maingrid2"></div>
        </div>	
  	</div> 
    </center>
    </div>
  </div>
<script type="text/javascript">
	var p,g,tree1,layout,accordion1,manager1,manager2;
	 function f_heightChanged(options) {
            if (accordion && options.middleHeight - 24 > 0)
                accordion.setHeight(options.middleHeight - 24);
        }
	$(function ()
           { 
				layout = $("#layout1").ligerLayout({ height: '100%', leftWidth: 220, onHeightChanged: f_heightChanged, minLeftWidth: 120 });
          		var bodyHeight = $(".l-layout-center:first").height();
          		
                accordion = $("#accordion1").ligerAccordion({ height: bodyHeight-24, speed: null ,changeHeightOnResize:true});
                $("#accordion2").ligerAccordion({ height: '100%', speed: null ,changeHeightOnResize:true});

          });
      //验证
	 $(function ()
            { 
            //layout
            layout = $("#layout").ligerLayout({ height: '100%', heightDiff: -3, leftWidth: 190, minLeftWidth: 120 });
             layout1 = $("#layout1").ligerLayout();
            });
    
      //覆盖本页面grid的loading效果
    LG.overrideGridLoading(); 
    var currentMenuParentNo;
    tree1=$("#maintree").ligerTree(
            {
            	checkbox:false,
                treeLine :true,
                icon: 'archives',
                nodeWidth :100,   
                slide :false,
                url: "${pageContext.request.contextPath}/exam/examTree",
                textFieldName:"examName",
                idFieldName:"examId",
                parentIDFieldName:"examPid",
		        onSelect :function(node,target)
		        {
		        	f_showCustomers(node.data.examId);
		        	f_showCustomers2(node.data.examId);
		        	//f_showGrade(node.data.examId);
		        }
		        
            });
    //预览
    function f_showCustomers(examId)
        {		
        	/* 	alert(parent.examId);  */
        	
            p = $("#maingrid1").ligerGrid({
            	height:'100%',
               columns: [
				{ display: '套餐ID', name: 'pkgId', align: 'left', width: 150, minWidth: 60,hide:'true'},
                { display: '套餐名', name: 'pkgName', align: 'left', width: 150, minWidth: 60 },
                { display: '课时', name: 'pkgTotalTime', width: 60,minWidth: 30 },
                { display: '原价', name: 'pkgOPrice', width: 80,minWidth: 60 },
                { display: '实价', name: 'pkgRPrice', width: 80,minWidth: 60 },
                { display: '老学员价', name: 'pkgSPrice', width: 80,minWidth: 60 },
                { display: '招生到期时间', name: 'pkgRMatureDate' ,type:'date'},
                { display: '学习到期时间', name: 'pkgRMatureDate',type:'date' },
                { display: '礼品', name: 'pkgPresent' }
                ],   
				url:'${pageContext.request.contextPath}/package/packageList?examId='+examId,
				rowHeight: 25,headerRowHeight:30,
                dataAction:'local', checkbox:true,
				rownumbers:true,
				//isScroll: false, 
				frozen:false,
				//pageSize:30,
				pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                showTitle: false,width:'99%',
                height:'95%',
                columnWidth:120,
                //detail: { onShowDetail: f_showOrder ,height:'60%'},
                onError: function (a, b)
                { 
                }
            
            });
            manager1=$("#maingrid1").ligerGetGridManager();
        }
    function f_showCustomers2(examId)
    {		
    	/* 	alert(parent.examId);  */
    	
        g = $("#maingrid2").ligerGrid({
         	 columns: [
         	           { display: '班级ID', name: 'gradeId', align: 'left', width: 100, minWidth: 60 ,hide:'true' },
                       { display: '班级名', name: 'name', align: 'left', width: 200, minWidth: 60 },
                       { display: '老师', name: 'tchName', minWidth: 120 },
                       { display: '课时', name: 'gradeTime', minWidth: 120 },
                       { display: '原价', name: 'gradeOPrice', minWidth: 150 },
                       { display: '实价', name: 'gradeRPrice', minWidth: 150 },
                       { display: '到期时间', name: 'gradeDueTime',minWidth: 200 ,type:'date'}
                       ],   
       				url:'${pageContext.request.contextPath}/grade/gradeList2?examPid='+examId ,
       				rowHeight: 25,headerRowHeight:30,dataAction:'local', checkbox:true,
       				rownumbers:true,
       				//isScroll: false, 
       				frozen:false,
       				//pageSize:30,
       				pageSizeOptions: [3,10, 20, 30, 40, 50, 100], 
                       showTitle: false,width:'99%',
                       height:'100%',
                       columnWidth:120,
                       onError: function (a, b)
                       { 
                       }
                   
                   });
        manager1=$("#maingrid2").ligerGetGridManager();
        $("#pageloading").hide();
    }
    function submit(id)
    {
		if(!g&&!p){
			$.ligerDialog.alert("请选择课程");
			return;
		}
		var rows1 = p.getSelectedRows();
    	var rows2 = g.getSelectedRows();
    	var pids = [],gids=[];
    	if(rows1.length == 0 && rows2.length==0)
		{
    		$.ligerDialog.alert("请选择套餐或班级");
    		return;
		}
    	if(id=='id'){
    	for(var i=0;i<rows1.length;i++)
		{
			pids.push(rows1[i].pkgId);
		}
    	pids.join(',');
    	for(var i=0;i<rows2.length;i++)
		{
			gids.push(rows2[i].gradeId);
		}
    	gids.join(',');
    	return "Package:"+pids+"|"+"Grade:"+gids;
    	}else if(id=='name'){
    		for(var i=0;i<rows1.length;i++)
    		{
    			pids.push(rows1[i].pkgName);
    		}
        	pids.join(',');
        	for(var i=0;i<rows2.length;i++)
    		{
    			pids.push(rows2[i].name);
    		}
        	return pids.toString();
    	}
    }
 </script>
</body>
</html>
