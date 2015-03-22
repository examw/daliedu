<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	 <title>classPackage</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet"type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    
  
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
   	<script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
   <!--  <script src="../TreeDeptData.js" type="text/javascript"></script> -->
    <script type="text/javascript">
    	var manager;
    	var row;
    	var pexamId =${session.pexamId};
    	function itemclick(item)
        {
            alert(item.text);
        }
        //查看套餐内容
       	function classPackage()
        {
        	var row =manager.getSelectedRow();
        	if (!row) { alert('请选择行'); return; }	
        	if(parent.tab.isTabItemExist("classPackage"))
        		{parent.tab.removeTabItem("classPackage");}
            	parent.tab.addTabItem({tabid:"classPackage",url:"${pageContext.request.contextPath}/cms/jsp/lesson/classPackage.jsp",
            text:"套餐详情"});        
        }  
        
        //添加套餐类别
        function addPackageCategory(){
        	if(!window.loginWin){
	       	window.loginWin=$.ligerDialog.open({ 
	          	  	url: 'addPackageCategory.jsp',
	          	    title:'添加套餐类别', 
	          	    isHidden :'false',
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 450,width: 700, 
	          	    });	
	       	}else {
			 	window.loginWin.show();
			}
        }
        /* function addPackageCategory(){
        	var row =manager.getSelectedRow();
        	if (!row) { ptypeId=0;}else{
        		ptypeId = row.ptypeId;
        	}
        	$.post("${pageContext.request.contextPath}/package/checkPackageCategory",{ptypeId:ptypeId},function(data){
        		if(data){
        			alert('该套套餐类别下面有具体套餐，不能继续分类'); return; 
        		}else{
        			$.ligerDialog.prompt('套餐类别','请输入套餐类别名字', function (yes, value)
                     {
                     	var ptypeName= value;
						if(yes){
							$.ligerDialog.prompt('套餐描述','请输入套餐类别的描述',true, function (yes,value) { 
							 $.ligerDialog.prompt('套餐描述','请输入套餐类别的描述', function (yes, value){ 
								if(yes){
									$.post("${pageContext.request.contextPath}/package/packageCategoryAdd",{ptypeName:ptypeName,ptypePid:ptypeId,
									ptypeDescription:value,examId:pexamId},
          							function(ok){
          							if(ok==true){
          								$.ligerDialog.success('添加成功');
          								 parent.fresh("package");
          							}else{
          								$.ligerDialog.error('添加失败');
          							}
								},
							"json"
          					);
								}
							});
						}
					});	
        		}
        	},"json");
        } */
        //修改套餐类别
        function modifyPackageCategory()
        {
        	var row =manager.getSelectedRow();
        	if (!row) { alert('请选择行'); return; }	
        	if(parent.tab.isTabItemExist("modifyPackageCategory")){parent.tab.removeTabItem("modifyPackageCategory");}
   
            parent.tab.addTabItem({tabid:"modifyPackageCategory",url:"${pageContext.request.contextPath}/package/packageCategoryLoad?ptypeId="+row.ptypeId,
            text:"套餐修改",height:"450px" });        
        }  
        //删除套餐类别
        function deletePackageCategory(){
      		var row =manager.getSelectedRow();
        	if (!row) { alert('请选择行'); return; }	
        	$.ligerDialog.confirm('确定删除？', function (yes)
                     {
                         if(yes==true){
                         	$.post("${pageContext.request.contextPath}/package/packageCategoryDelete",{ptypeId:row.ptypeId},
          					function(ok){
          						if(ok==true){
          							$.ligerDialog.success('删除成功');
          							manager.loadData();
          						}else{
          							$.ligerDialog.error('删除失败,请先删除其之类套餐类别或者具体套餐');
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
        function tip(message)
        {
            $.ligerDialog.tip({ title: '提示信息', content: message.toString() });
        }
        $(function ()
        {
           		manager=$("#maingrid").ligerGrid({
                columns: [
                { display: '套餐类名', name: 'ptypeName', width: 250, align: 'left',editor: { type: 'text'} },
                { display: '添加时间', name: 'ptypeAddTime', width: 250, type: 'int', align: 'left' ,type:'date'},

                { display: '套餐描述', name: 'ptypeDescription', width: 250, align: 'left', editor: { type: 'text'} }
                ], width: '100%', pageSizeOptions: [5, 10, 15, 20], height: '97%',
                rowHeight: 25,headerRowHeight:30,
                onSelectRow: function (rowdata, rowindex)
                {
                    $("#txtrowindex").val(rowindex);
                },
              
                url: "${pageContext.request.contextPath}/package/packageCategoryList?examId="+pexamId, 
                toolbar: { items: [
                { text: '增加', click: addPackageCategory, icon: 'add' },
                { line: true },
                { text: '修改', click: modifyPackageCategory, icon: 'modify' },
                { line: true },
                { text: '删除', click: deletePackageCategory, img: '${pageContext.request.contextPath}/cms/images/icon/delete.gif' },
                { line: true },
                { text: '查看具体套餐', click: classPackage, img: '${pageContext.request.contextPath}/cms/images/icon/searchtool.gif'}
                ]
                },
                alternatingRow: false,
                tree: { columnName: 'ptypeName' }, 
                checkbox: false,
                autoCheckChildren: false
            }
            );
            parent.packageCategorymanager=$("#maingrid").ligerGetGridManager();
            row =manager.getSelectedRow();
        });
    </script>
    <style type="text/css">
    .l-button{width: 120px; float: left; margin-left: 10px; margin-bottom:2px; margin-top:2px;}
    </style>
</head>
<body style="padding: 2px">
    <div id="maingrid">
    </div>
</body>
</html>
