<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title></title>
        <link href="../../css/ligerui-all.css" rel="stylesheet" type="text/css" />
        <link href="../../css/all.css" rel="stylesheet" type="text/css" />
        <style type="text/css"></style>
        <script src="../../js/jquery-1.3.2.min.js" type="text/javascript"></script>   
   	 	<script src="../../js/base.js" type="text/javascript"></script>
        <script src="../../js/ligerLayout.js" type="text/javascript"></script>
       	<script src="../../js/ligerTree.js" type="text/javascript"></script>
        <script src="../../js/ligerGrid.js" type="text/javascript"></script>
   		<script src="../../js/ligerToolBar.js" type="text/javascript"></script>
    	<script src="../../js/ligerResizable.js" type="text/javascript"></script>
    	<script src="../../js/ligerCheckBox.js" type="text/javascript"></script>
    	<script src="../../js/ligerTab.js" type="text/javascript"></script>
    	<script src="../../js/ligerTree.js" type="text/javascript"></script>
    	<script src="../../js/ligerMenu.js" type="text/javascript"></script>
        <script src="../../js/ligerDrag.js" type="text/javascript"></script> 
   		<script src="../../js/ligerDialog.js" type="text/javascript"></script>
        <script type="text/javascript">
        	  //生成树
        	  var tree=null;
        	  var examId;
        	  var actionNodeID;
        	  var actionNodePID;
        	  var actionNodeID1;
        	  var actionNodeText=null;
        	  var managerClassDetail;
        	  var packageCategorymanager;
        	  var managerClassPackage;
        	  var id;

        	  var manger=null;
        	  $(function ()
        		{
            		manager = $("#lessonTree").ligerTree({ checkbox: true });
        		});
        		function reload()
        		{
           			manager.clear();
            		manager.loadData(null, '${pageContext.request.contextPath}/exam/examList');
        		}
		      $(function ()
                {
                    $("#layout1").ligerLayout({ leftWidth: 200});
                    tab=$("#orderTab").ligerTab(); 
                    $("#maingrid").ligerGrid(
                    
                    );
              
            		tree=$("#lessonTree").ligerTree({  
            			url:"${pageContext.request.contextPath}/exam/examList", 
            			idFieldName :'id',
            			parentIDFieldName :'pid',
            			icon: 'archives',
            			slide: false,
            			checkbox:false,
            			btnClickToToggleOnly:true,
            			isLeaf:function(node){
            				       if(node.examChildrenNum!=0){
            						return true;
            						}
            					},
            			onSelect:function(node) 
            			{	id=node.data.id;
            				examId=node.data.examId;
            				actionNodeID = node.data.pid;
            				if(!node.data.examChildrenNum==0){
            					if(tab.isTabItemExist("package"+node.data.id)){tab.selectTabItem("package"+node.data.id);return;}
                    			tab.addTabItem({tabid:"package"+node.data.id,url:"packageCategory.jsp",text:node.data.text+"套餐管理",height:400});		
            				}else{
            					if(tab.isTabItemExist("grade"+node.data.id)){tab.selectTabItem("grade"+node.data.id);return;}
                    			tab.addTabItem({tabid:"grade"+node.data.id,url:"grade.jsp",text:node.data.text+"班级管理",height:400});
            					/* $("#iframe").attr("src","grade.jsp"); */
            				}
            			},
            			onSuccess:function(){
            				tree.collapseAll(); 
            			}
            		});
        
                });         
   				
   				function getNodeId(){
   					return tree.getSelected().data.id;
   				}
   				
   				//右键操作
				var menu;
				//添加
		         function addclick(item, i)
		        {
		             $.ligerDialog.prompt('考试类别','请输入考试', function (yes, value)
                     {
						if(yes){
							$.post("${pageContext.request.contextPath}/exam/examAdd",{examName:value,id:actionNodeID1},
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('添加成功');
          							reload();
          						}else{
          							$.ligerDialog.error('添加失败');
          						}
							},
							"json"
          					);
						}	
                     });
		        }
		        //删除
		         function deleteclick(item, i)
		        {
		              $.ligerDialog.confirm('确定删除？', function (yes)
                     
                     {
                       
                         if(yes==true){
                         	$.post("${pageContext.request.contextPath}/exam/examDelete",{examId:actionNodeID1,examPid:actionNodePID},
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('删除成功');
          							reload();
          						}else{
          							$.ligerDialog.error('删除失败');
          						}
							},
							"json"
          					);
                         }
                     });
		        }
		        //修改
		         function updateclick(item, i)
		        {
		             $.ligerDialog.prompt('考试类别',actionNodeText, function (yes, value)
                     {
						if(yes)	{
							$.post("${pageContext.request.contextPath}/exam/examUpdate",{examName:value,id:actionNodeID1},
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('修改成功');
          							reload();
          						}else{
          							$.ligerDialog.error('修改失败');
          						}
							},
							"json"
          					);
						}
                     });
		        }
		        
		        $(function ()
		        {
		            menu = $.ligerMenu({ top: 100, left: 100, width: 120, items:
		            [
		            { text: '增加', click: addclick, icon: 'add' },
		            { text: '修改', click: updateclick },
		            { text: '删除', click: deleteclick },
		           /*  { line: true },
		            { text: '查看', click: addclick } */
		            ]
		            });
		
		            $("#lessonTree").ligerTree({ onContextmenu: function (node, e)
		            { 
		                actionNodePID= node.data.pid;
		             	actionNodeID1= node.data.id;
		             	actionNodeText = node.data.text;
		                menu.show({ top: e.pageY, left: e.pageX });
		                return false;
		            }
		            });
		        });
		        //tab窗口控制
		        function closeTabAndFresh(tabid)
				{
				     if(tab.isTabItemExist(tabid)){
				     tab.removeSelectedTabItem(tabid);
				     managerClassDetail.loadData();
				     }
				 } 
				 
				   function addTab(tabid,url,text)
                {
                	if(tab.isTabItemExist(tabid)){tab.selectTabItem(tabid);return;}
                    tab.addTabItem({tabid:tabid,url:url,text:text,height:400});
                    	
                }
                function closeTab(tabid)
                {
                	if(tab.isTabItemExist(tabid))
                	{
                		tab.removeSelectedTabItem(tabid);
                	}
                }
                function fresh(tabid)
                {
                	tab.reload(tabid);
                }
	   </script> 
       <style type="text/css"> 
            body{ padding:5px; margin:0; padding-bottom:15px;}
            #layout1{  width:100%;margin:0; padding:0;  }  
            .l-page-top{ height:80px; background:#f8f8f8; margin-bottom:3px;}
            h4{ margin:20px;}
       </style>
    </head>
    <body style="padding:10px">  
       <div id="layout1">
            <div position="left" title="课程分类">
            	<div id="lessonTree"></div>
            </div>
           <!--  <div position="center" title="操作">
            	  <iframe id="iframe" marginheight="10px" marginwidth="10px" height="100%" width="100%" frameborder="0" src=""></iframe>
            </div>  --> 
            <div position="center" title="">
            	 <div id="orderTab" style="overflow:hidden; border:1px solid #A3C0E8;">
            	 	<div tabid="class" title="班级管理" lselected="true"  style="height:400px;" >
						<iframe marginheight="10px" marginwidth="10px" height="100%" width="100%" frameborder="0"  src="" id="iframe"></iframe>
					</div>
            	 </div>
            </div>  
        </div> 
    </body>
    </html>
