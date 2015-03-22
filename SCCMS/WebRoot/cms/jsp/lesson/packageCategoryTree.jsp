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
   	<script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script>
   	<script src="${pageContext.request.contextPath}/cms/js/ligerTab.js" type="text/javascript"></script>
   	<script src="${pageContext.request.contextPath}/cms/js/ligerDialog2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script>
    <script type="text/javascript"> 
        	var pexamId =${session.pexamId};
        	var ptypeId;
        	var ptypePid;
        	var manager=null;
            $(function ()
            { 
            	//布局
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%',space:4,onHeightChanged: f_heightChanged  });
                var height = $(".l-layout-center").height();
               	 //Tab
                $("#framecenter").ligerTab({height:height,changeHeightOnResize:true });
                //面板              
                tab = $("#framecenter").ligerGetTabManager();   
            });
             function f_heightChanged(options)
            	{
                	if (tab)
                    	tab.addHeight(options.diff);
            	}
           	$(function ()
        	{   
            $("#tree1").ligerTree({  
	           	url:"${pageContext.request.contextPath}/package/classPackageTree?examId="+pexamId, 
	            idFieldName :'ptypeId',
	            parentIDFieldName :'ptypePid',
	            textFieldName :'ptypeName',
	            icon: 'archives',
	            checkbox:false,
	            slide: false,
	            btnClickToToggleOnly:false,
	            isLeaf:function(node)
	            		{
            			if(node.ptypeChildrenNum!=0)
            				{
            				return true;
            				}
            			},
            	onSelect:function(node)
            			{	
   						if(node.data.ptypeChildrenNum==0&&node.data.ptypePid!=-1)
   							{
   							if(tab.isTabItemExist("addClassPackage")){$.ligerDialog.warn("请先关闭套餐添加页面"); tab.selectTabItem("addClassPackage"); return;}
            				if(tab.isTabItemExist("modifyClassPackage")){$.ligerDialog.warn("请先关闭套餐修改页面"); tab.selectTabItem("modifyClassPackage"); return;} 
            				if(tab.isTabItemExist("classPackage")){tab.removeTabItem("classPackage");}
   							tab.addTabItem({tabid:"classPackage",url:"${pageContext.request.contextPath}/package/classPackage?ptypeId="+node.data.ptypeId, text:"套餐详情"});
   							}
            			}
            	});
            	manager = $("#tree1").ligerGetTreeManager();
       		 });
  
          $(function ()
		        {
		            menu = $.ligerMenu({ top: 100, left: 100, width: 120, items:
		            [
		            { text: '增加', click: addPackageCategory },
		            { line: true },
		            { text: '修改', click: modifyPackageCategory },
		            { line: true },
		            { text: '删除', click: deletePackageCategory },
		            { line: true }
		            ]
		            });
		
		            $("#tree1").ligerTree({ onContextmenu: function (node, e)
		            {
		            	ptypeId = node.data.ptypeId;
		            	ptypePid = node.data.ptypePid;
		                menu.show({ top: e.pageY, left: e.pageX });
		                return false;
		            }
		            });
		        });
		function addPackageCategory(){
			$.post("${pageContext.request.contextPath}/package/checkPackageCategory",{ptypeId:ptypeId},function(data){
        		if(data){
        			alert('该套套餐类别下面有具体套餐，不能继续分类'); return; 
        		}else{
        		    window.loginWin=$.ligerDialog.open({ 
	          	  	url: '${pageContext.request.contextPath}/cms/jsp/lesson/addPackageCategory.jsp',
	          	    title:'添加套餐类别',
	          	    isHidden: false,
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 450,width: 600
	          	    });	
	          	}
	       });
        } 
        
     function reload()
        		{
           			manager.clear();
            		manager.loadData(null,'${pageContext.request.contextPath}/package/classPackageTree?examId='+pexamId);
        		}
      function  f_closeWindow()
   			{
                //$.ligerDialog.close();  //写法1，这么写遮罩会不消失，这不是坑爹么？？
               parent.fresh("package");
               window.loginWin.close(); 
    		}      
	
        //修改套餐类别
        function modifyPackageCategory()
        {
        	if(ptypePid==-1){
        		alert("不能修改");
        		return;
        	}
            window.loginWin=$.ligerDialog.open({ 
	          	  	url: "${pageContext.request.contextPath}/package/packageCategoryLoad?ptypeId="+ptypeId,
	          	    title:'修改套餐类别',
	          	    isHidden: false,
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 450,width: 600
	          	    });	       
        }  
        //删除套餐类别
        function deletePackageCategory(){
        	if(ptypePid==-1){
        		alert("不能删除");
        		return;
        	}
        	$.ligerDialog.confirm('确定删除？', function (yes)
                     {
                         if(yes==true){
                         	$.post("${pageContext.request.contextPath}/package/packageCategoryDelete",{ptypeId:ptypeId},
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('删除成功');
          							 reload();
          						}else{
          							$.ligerDialog.error('删除失败,请先删除其子类套餐类别或者具体套餐');
          						}
							},
							"json"
          					);
                         }
                     });
   		}
        function alert(message)
        {
            $.ligerDialog.alert(message.toString(), '提示信息');
        }
        function fresh(tabid)
        {
           tab.reload(tabid);
        } 
        
        function closeTab(tabid)
        {
             if(tab.isTabItemExist(tabid))
          	 {
             	tab.removeTabItem(tabid);
             }
        }
	
     </script> 
    <style type="text/css">
        body{ padding:10px; margin:0;}
        #layout1{  width:100%; margin:40px;  height:400px;
                   margin:0; padding:0;} 
        #accordion1 { height:270px;}
         h4{ margin:20px;}
    </style>
</head>
<body style="padding:2px">
        <div id="layout1">
            <div  position="left" title="套餐类别">
            	<div id="tree1"></div>
            </div>
            <div position="center" title="套餐详细" id="framecenter">
            </div>
        </div> 
     <div style="display:none;">  
</div>
</body>
</html>
