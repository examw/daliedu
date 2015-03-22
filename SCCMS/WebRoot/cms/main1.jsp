<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head id="Head1" runat="server">
      <title>欢迎使用 管理系统</title> 
    	<link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
     	<link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
      	<link href="${pageContext.request.contextPath}/cms/css/common.css" rel="stylesheet" type="text/css" />  
	   	<script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script> 
	    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
	   	<script src="${pageContext.request.contextPath}/cms/js/ligerLayout.js" type="text/javascript"></script>
	   	<script src="${pageContext.request.contextPath}/cms/js/ligerAccordion.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
   		<script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
    	<script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    	<script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    	<script src="${pageContext.request.contextPath}/cms/js/ligerTab.js" type="text/javascript"></script>
    	<script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script> 
   		<script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script> 
    	<script src="${pageContext.request.contextPath}/cms/js/ligerui.min.js" type="text/javascript"></script>
    	<script src="${pageContext.request.contextPath}/cms/js/ligerTab.js" type="text/javascript"></script>
    	<script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script>
   	 	<script src="${pageContext.request.contextPath}/cms/js/ligerLayout.js" type="text/javascript"></script> 
	    <script src="${pageContext.request.contextPath}/cms/js/common.js" type="text/javascript"></script>
	    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
	    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
	    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
	    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
	    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
	    <script src="${pageContext.request.contextPath}/cms/js/login.js" type="text/javascript"></script>
	    <script src="${pageContext.request.contextPath}/cms/js/changepassword.js" type="text/javascript"></script>
	     <style type="text/css">
		/* 顶部 */ 
		.l-topmenu{ margin:0; padding:0; height:55px; line-height:24px; background:#1B3160 url('${pageContext.request.contextPath}/cms/images/index/top.jpg') repeat-x ;  position:relative;}
		.l-topmenu-logo{ color:#070A0C;  padding-left:30px; padding-top:10px;}
		.l-topmenu-welcome{  position:absolute; padding-top:10px;height:24px; right:30px; top:0px;color:#F0F0F0;}
		.l-topmenu-welcome a{ color:#FFFFFF; text-decoration:underline}
		.l-topmenu-username{ color:#FFFFFF; font-weight:bold;} 
		/* 菜单列表 */
		 .menulist{ margin-left:0px; margin-right:0px; margin-top:2px;text-align:left; color:#000;}
		.menulist li{ height:24px; line-height:24px; padding-left:24px; display:block; position:relative;cursor:pointer; text-align:left;}
		.menulist li img{ position:absolute; left:4px; top:4px; width:16px; height:16px;}
		.menulist li:hover{ background:url(${pageContext.request.contextPath}/cms/images/index/menuitem.gif) repeat-x 0px 0px;} 
	    </style>
	  	<script type="text/javascript">
        //几个布局的对象
        var layout, tab, accordion;
        var isUpdated = false;
        //窗口改变时的处理函数
        function f_heightChanged(options) {
            if (tab)
                tab.addHeight(options.diff);
            if (accordion && options.middleHeight - 24 > 0)
                accordion.setHeight(options.middleHeight - 24);
        }
        //增加tab项的函数
        function f_addTab(tabid, text, url) {
            if (!tab) return;
            tab.addTabItem({ tabid: tabid, text: text, url: url });
        }
        //登录
        function f_login()
        {
            LG.login();
        }
        //修改密码
        function f_changepassword()
        {
            LG.changepassword();
        }
        $(document).ready(function ()
        {

            //菜单初始化
            $("ul.menulist li").live('click', function ()
            {
                var jitem = $(this);
                var tabid = jitem.attr("menuno");
                var url = jitem.attr("url");
                if (!url) return;
                if (!tabid)
                {
                    tabidcounter++;
                    tabid = "tabid" + tabidcounter;
                    jitem.attr("tabid", tabid);
                }
                f_addTab(tabid, $("span:first", jitem).html(), url);
            }).live('mouseover', function ()
            {
                var jitem = $(this);
                jitem.addClass("over");
            }).live('mouseout', function ()
            {
                var jitem = $(this);
                jitem.removeClass("over");
            });

            //布局初始化 
            //layout
            layout = $("#mainbody").ligerLayout({ height: '100%', heightDiff: -30, leftWidth: 160, onHeightChanged: f_heightChanged, minLeftWidth: 120 });
            var bodyHeight = $(".l-layout-center:first").height();
            //Tab
            tab = $("#framecenter").ligerTab({ height: bodyHeight, contextmenu: true });
            

            var mainmenu = $("#mainmenu");

            $.getJSON('${pageContext.request.contextPath}/system/menuList?rnd='+Math.random(), function (menus)
            {
                $(menus).each(function (i, menu)
                {
                	if(menu.text=="课程管理"){
                	var item = $('<div title="' + menu.text + '"><div id="lessonTree"></div></div>');
                    mainmenu.append(item);
                	}else if(menu.text=="试卷管理")
                	{
                		//
                		var item = $('<div title="' + menu.text + '"><div id="examPaperTree"></div></div>');
                    	mainmenu.append(item);
                	}
                	else{
                	var item = $('<div title="' + menu.text + '"><ul class="menulist"></ul></div>');
                    $(menu.children).each(function (j, submenu)
                    {
                        var subitem = $('<li><img/><span></span><div class="menuitem-l"></div><div class="menuitem-r"></div></li>');
                        subitem.attr({
                            url: submenu.menuAddress,
                            menuno: submenu.menuNumber
                        });
                        $("img", subitem).attr("src", submenu.icon);
                        $("span", subitem).html(submenu.text);

                        $("ul:first", item).append(subitem);
                    });
                    mainmenu.append(item);
                	}
                    
                });
                //加载树菜单
                lessonTree();

                //Accordion
                accordion = $("#mainmenu").ligerAccordion({ height: bodyHeight - 24, speed: null });
                $("#pageloading").hide();
            });
        });
		//绑定事件
         $(function ()
                {
                    //绑定事件
                    tab.bind("afterRemoveTabItem",
                  		function(tabid){
                     		if(tabid=="addAdmin"||tabid=="modifyAdmin")
                     		{
                     			tab.selectTabItem("admList");
                     			return;
                     		}
                     		if(tabid=="addAdmin1"||tabid=="modifyAdmin1")
                     		{
                     			tab.selectTabItem("searchAdmin");
                     			return;
                     		}
                     		if(tabid=="addTeacher"||tabid=="modifyTeacher")
                     		{
                     			tab.selectTabItem("teacherList");
                     			tab.reload("teacherList");
                     			return;
                     		}
                     		if(tabid=="addNews"||tabid=="addNews")
                     		{
                     			tab.selectTabItem("newsList");
                     			tab.reload("newsList");
                     			return;
                     		}
                     		if(tabid=="addStudent")
                     		{
                     			tab.selectTabItem("stuList");
                     			if(isUpdated)
                     			{
                     				tab.reload("stuList");	
	                     			isUpdated=false;
                     			}
                     			return;
                     		}
                     		if(tabid=="modifyOrder")
                     		{
                     			tab.selectTabItem("orderList");
                     			return;
                     		}
                     		if(tabid=="modifyOrder1")
                     		{
                     			tab.selectTabItem("searchOrder");
                     			return;
                     		}
                     		if(tabid=="modifySend")
                     		{
                     			tab.selectTabItem("sendList");
                     			return;
                     		}
                     		if(tabid=="modifySend1")
                     		{
                     			tab.selectTabItem("searchSend");
                     			return;
                     			
                     		}
                     		if(tabid=="reply")
                     		{
                     			tab.selectTabItem("comlainList");
                     			return;
                     		}
                     		if(tabid=="orderDetail"||tabid=="modifyOrder"||tabid=="cancelOrder")
                     		{
                     			tab.selectTabItem("orderList");      
                     			return;
                     		}
                     		tab.moveToPrevTabItem ();
            		}); 
                  
                }); 
                function showTab(tabid,url,text)
                {
                	if(tab.isTabItemExist(tabid)){tab.selectTabItem(tabid);return;}
                    tab.addTabItem({tabid:tabid,url:url,text:text});
                }	
            
                function addTab(tabid,url,text)
                {
                	if(tab.isTabItemExist(tabid))
                	{
                		if(/modify/.test(tabid)||/reply/.test(tabid)||/Detail/.test(tabid))
                		{
                			tab.overrideTabItem(tabid,{tabid:tabid,url:url,text:text});
                			tab.selectTabItem(tabid);
                			return;
                		}
                		tab.selectTabItem(tabid);
                		return;
                	}
                    tab.addTabItem({tabid:tabid,url:url,text:text});            	
                }
                function overrideTab(tabid,url,text)
                { 
                    tab.selectTabItem(tabid);
                    tab.reload(tabid);
                    	
                }
                function overrideTabItem(tabid,tabid1,url,text)
                {
                	tab.overrideTabItem(tabid,{tabid:tabid1,url:url,text:text});
                	tab.selectTabItem(tabid1);
                }
                function closeTab(tabid)
                {
                	if(tab.isTabItemExist(tabid))
                	{
                		tab.removeTabItem(tabid);
                	}
                }
                function fresh(tabid)
                {
                	tab.reload(tabid);
                } 
                 //登录
        		function f_login()
        		{
           			 LG.login();
        		}
       		 	//修改密码
       	 		function f_changepassword()
        		{
            		LG.changepassword();
        		}
        		
        		var tab =null;
    		  var tree=null;
    		  var examPaperTree=null;
    		  var actionExamId;
        	  var examId;
        	  var actionNodeID;
        	  var actionNodePID;
        	  var actionNodeID1;
        	  var actionNodeText=null;
        	  var managerClassDetail;
        	  var packageCategorymanager;
        	  var managerClassPackage;
        	  var manger=null;
        	  //课程模块 用在关闭页面之前于判断表单是否已经提交
        		function reload()
        		{
           			manager.clear();examPaperTree.clear();
            		manager.loadData(null, '${pageContext.request.contextPath}/exam/examList');
        		}
  
		      function lessonTree()
                {
            		tree=$("#lessonTree").ligerTree({  
            			url:"${pageContext.request.contextPath}/exam/examList", 
            			idFieldName :'id',
            			parentIDFieldName :'pid',
            			nodeWidth :100,
            			icon: 'archives',
            			checkbox:false,
            			slide: false,
            			btnClickToToggleOnly:true,
            			/* onBeforeExpand: onBeforeExpand,
            			 */
            			isLeaf:function(node){
            				       if(node.examChildrenNum!=0){
            						return true;
            						}
            					}, 
            			onSelect:function(node) 
            			{	
            				examId=node.data.examId;
            				actionNodeID = node.data.pid;
            				if(!node.data.examChildrenNum==0&&node.data.examPid!=0&&node.data.examPid!=-1){
            						if(tab.isTabItemExist("package")){parent.tab.removeTabItem("package");}
            						if(tab.isTabItemExist("classPackage")){parent.tab.removeTabItem("classPackage");}
                    				tab.addTabItem({tabid:"package",url:"${pageContext.request.contextPath}/package/packageCategory?examId="+examId,text:node.data.examName+"套餐管理"}); 
                    				/* tab.addTabItem({tabid:"package",url:"${pageContext.request.contextPath}/package/packageCategory?examId="+examId,text:node.data.text+"套餐管理"}); */		
            				}else if(node.data.examChildrenNum==0){
            						if(parent.tab.isTabItemExist("addGrade")){$.ligerDialog.warn("请先关闭班级添加页面"); tab.selectTabItem("addGrade"); return;}
            						if(parent.tab.isTabItemExist("modifyGrade")){$.ligerDialog.warn("请先关闭班级修改页面"); tab.selectTabItem("modifyGrade"); return;}
            						if(parent.tab.isTabItemExist("addClassDetail")){$.ligerDialog.warn("请先关闭课节添加页面"); tab.selectTabItem("addClassDetail"); return;}
            						if(parent.tab.isTabItemExist("modifyClassDetail")){$.ligerDialog.warn("请先关闭课节添加页面页面"); tab.selectTabItem("modifyClassDetail"); return;;}
            						if(parent.tab.isTabItemExist("addLecture")){$.ligerDialog.warn("请先关闭讲义添加页面"); tab.selectTabItem("addLecture"); return;}
            						if(parent.tab.isTabItemExist("modifyLecture")){$.ligerDialog.warn("请先关闭讲义修改页面"); tab.selectTabItem("modifyLecture"); return;} 
            						if(parent.tab.isTabItemExist("checkClassDetail")){parent.tab.removeTabItem("checkClassDetail");}
            						if(parent.tab.isTabItemExist("grade")){parent.tab.removeTabItem("grade");}
                    				tab.addTabItem({tabid:"grade",url:"${pageContext.request.contextPath}/grade/grade?examId="+examId+"&examPid="+actionNodeID,text:node.data.examName+"班级管理"});
            				}
            			},
            			onSuccess:function(data)	//用success不用afterAppend
            			{
            				//右键
            				ligerMenu();
            				if(examPaperTree)	//避免重复的树
            				{
            					examPaperTree.clear();
            					examPaperTree.loadData2(null,data);
            				}else{
            				examPaperTree = $("#examPaperTree").ligerTree({  
            				data:data, 
            				idFieldName :'id',
            				parentIDFieldName :'pid',
            				icon: 'archives',
            				checkbox:false,
            				slide: false,
            				btnClickToToggleOnly:false,
            				/* onBeforeExpand: onBeforeExpand,
            				 */
            				isLeaf:function(node){
            				       if(node.examChildrenNum!=0){
            						return true;
            						}
            					}, 
            				onSelect:function(node) 
            				{
            					//只有最后的叶子节点能够进行试卷的增删改
            					if(node.data.examChildrenNum==0){
            						if(tab.isTabItemExist("paperList"))
                					{
	                					tab.overrideTabItem("paperList",{tabid:"paperList",url:"${pageContext.request.contextPath}/cms/jsp/exam/paperList.jsp?examId="+node.data.examId,text:node.data.text+"试卷列表"});
	                					tab.selectTabItem("paperList");
                						return;
                					}
                    				tab.addTabItem({tabid:"paperList",url:"${pageContext.request.contextPath}/cms/jsp/exam/paperList.jsp?examId="+node.data.examId,text:node.data.text+"试卷列表"});
            					}	
            				}
            				});
            				treeData=null;
            				}
            			}
            		});
					manager = $("#lessonTree").ligerTree(); 
                } 

                //班级
				var gradeAddMark = false;
				var modifyGradeMark = false;
				//课节
				var addClassDetailMark = false;
				var modifyClassDetailMark = false;
				//讲义
				var addLectureMark = false;
				var modifyLectureMark = false;
				//套餐类型
				var modifyPackageCategoryMark= false;
				//具体套餐
				var addClassPackageMark = false;
				var modifyClassPackageMark = false;
				$(function() {
					$("#framecenter").ligerTab({
						onBeforeRemoveTabItem : function(tabid) {
							if (tabid =="addGrade") {
								if (gradeAddMark == true) {
									$.ligerDialog.warn('添加班级表单已经改变,请先保存或者取消');
									tab.selectTabItem("addGrade");
									return false;
								}
							}
							if (tabid == "modifyGrade") {
								if (modifyGradeMark == true) {
									$.ligerDialog.warn('修改班级表单已经改变,请先保存或者取消');
									tab.selectTabItem("modifyGrade");
									return false;
								}
							}
							if (tabid == "addClassDetail") {
								if (addClassDetailMark == true) {
									$.ligerDialog.warn('添加课节表单已经改变,请先保存或者取消');
									tab.selectTabItem("addClassDetail");
									return false;
								}
							}
							if (tabid == "modifyClassDetail") {
								if (modifyClassDetailMark == true) {
									$.ligerDialog.warn('修改课节表单已经改变,请先保存或者取消');
									tab.selectTabItem("modifyClassDetail");
									return false;
								}
							}
							if (tabid == "addLecture") {
								if (addLectureMark == true) {
									$.ligerDialog.warn('添加讲义表单已经改变,请先保存或者取消');
									tab.selectTabItem("addLecture");
									return false;
								}
							}
							if (tabid == "modifyLecture") {
								if (modifyLectureMark == true) {
									$.ligerDialog.warn('修改讲义表单已经改变,请先保存或者取消');
									tab.selectTabItem("modifyLecture");
									return false;
								}
							}
							if (tabid == "modifyPackageCategory") {
								if (modifyPackageCategoryMark == true) {
									$.ligerDialog.warn('修改套餐类别表单已经改变,请先保存或者取消');
									tab.selectTabItem("modifyPackageCategory");
									return false;
								}
							}
							if (tabid == "addClassPackage") {
								if (addClassPackageMark == true) {
									$.ligerDialog.warn('添加套餐表单已经改变,请先保存或者取消');
									tab.selectTabItem("addClassPackage");
									return false;
								}
							}
							if (tabid == "modifyClassPackage") {
								if (modifyClassPackageMark == true) {
									$.ligerDialog.warn('修改套餐表单已经改变,请先保存或者取消');
									tab.selectTabItem("modifyClassPackage");
									return false;
								}
							}
							
							
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
		        	$.post("${pageContext.request.contextPath}/exam/checkExam",{examId:actionExamId},function(ok){
		        		if(ok){
		        			window.loginWin=$.ligerDialog.open({ 
			          	  	url: '${pageContext.request.contextPath}/cms/jsp/lesson/addExamCategory.jsp?id='+actionNodeID1,
			          	    title:'添加考试类别',
			          	    isHidden: false,
			          	    icon: 'images/Program Files Folder.png',
			          	    height: 450,width: 600
			          	    });		
		        		
		        	/* 	 $.ligerDialog.prompt('考试类别','请输入考试类别', function (yes, value)
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
                     }); */
		        		}else{
		        			$.ligerDialog.error('该考试下面有班级，不能继续分类');
		        		}
		        	},"json");
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
		        	window.loginWin=$.ligerDialog.open({ 
			          	  	url: "${pageContext.request.contextPath}/exam/loadExam?examId="+actionExamId,
			          	    title:'修改考试类别',
			          	    isHidden: false,
			          	    icon: 'images/Program Files Folder.png',
			          	    height: 450,width: 600
			          	    });			
		           
		        }
		        
		        //查看班级
		        function gradeList(item, i)
		        {
		            if(parent.tab.isTabItemExist("addGrade")){$.ligerDialog.warn("请先关闭班级添加页面"); tab.selectTabItem("addGrade"); return;}
            		if(parent.tab.isTabItemExist("modifyGrade")){$.ligerDialog.warn("请先关闭班级修改页面"); tab.selectTabItem("modifyGrade"); return;}
            		if(parent.tab.isTabItemExist("addClassDetail")){$.ligerDialog.warn("请先关闭课节添加页面"); tab.selectTabItem("addClassDetail"); return;}
            		if(parent.tab.isTabItemExist("modifyClassDetail")){$.ligerDialog.warn("请先关闭课节添加页面页面"); tab.selectTabItem("modifyClassDetail"); return;;}
            		if(parent.tab.isTabItemExist("addLecture")){$.ligerDialog.warn("请先关闭讲义添加页面"); tab.selectTabItem("addLecture"); return;}
            		if(parent.tab.isTabItemExist("modifyLecture")){$.ligerDialog.warn("请先关闭讲义修改页面"); tab.selectTabItem("modifyLecture"); return;} 
            		if(parent.tab.isTabItemExist("checkClassDetail")){parent.tab.removeTabItem("checkClassDetail");}
            		if(parent.tab.isTabItemExist("grade")){parent.tab.removeTabItem("grade");}
                    tab.addTabItem({tabid:"grade",url:"${pageContext.request.contextPath}/grade/grade?examId="+actionExamId+"&examPid="+actionNodePID,text:actionNodeText+"班级管理"});
		        }
		        //查看套餐
		        function packageList(item,i){
		        	if(tab.isTabItemExist("modifyPackageCategory")){ $.ligerDialog.warn("请先关闭套餐类型修改页面"); tab.selectTabItem("modifyPackageCategory"); return;}
            		if(tab.isTabItemExist("package")){tab.removeTabItem("package");}
            		if(tab.isTabItemExist("classPackage")){tab.removeTabItem("classPackage");}
                    tab.addTabItem({tabid:"package",url:"${pageContext.request.contextPath}/package/packageCategory?examId="+actionExamId,text:actionNodeText+"套餐管理"});		
		        }
		        
		        var menuPackage= { text: '查看套餐', click: packageList,id:'package' }; 
		        var menuGrade={ text: '查看班级', click: gradeList ,id:'grade'};
		       function ligerMenu()
		        {
		            menu = $.ligerMenu({ top: 100, left: 100, width: 120, items:
		            [
		            { text: '增加', click: addclick, icon: 'add',id:'add' },
		            { line: true },
		            { text: '修改', click: updateclick },
		            { line: true },
		            { text: '删除', click: deleteclick },
		            { line: true },
		            { text: '查看套餐', click: packageList,id:'package' },
		            { line: true },
		            { text: '查看班级', click: gradeList ,id:'grade'},
		            { line: true },  
		            ]
		            });
		
		            $("#lessonTree").ligerTree({ onContextmenu: function (node, e)
		            { 
		            	examDescription = node.data.examDescription;
		                actionNodePID= node.data.pid;
		             	actionNodeID1= node.data.id;
		             	actionExamId = node.data.examId;
		             	actionNodeText = node.data.text;
		             	examUrl=node.data.examUrl;
		             	if(actionExamId ==0||actionNodePID==0) {
		             		menu.setDisable("package");        		
		             		menu.setDisable("grade");
		             	}else if(node.data.examChildrenNum==0){
		             		menu.setEnable("package");
		             		menu.setEnable("grade");
		             	}else{
		             		menu.setEnable("package");
		             		menu.setDisable("grade");
		             	}
		                menu.show({ top: e.pageY, left: e.pageX });
		                return false;
		            }
		            });
		        }
		        //tab窗口控制
		        function closeTabAndFresh(tabid)
				{
				     if(tab.isTabItemExist(tabid)){
				     tab.removeSelectedTabItem(tabid);
				     managerClassDetail.loadData();
				     }
				 } 
               function closeTab(tabid)
                {
                	if(tab.isTabItemExist(tabid))
                	{
                		tab.removeSelectedTabItem(tabid);
                	}
                }
                function getSelectTabId()
                {
                	return tab.getSelectedTabItemID();
                }
                function fresh(tabid)
                {
                	tab.reload(tabid);
                } 
        	     function selectTab(tabid)
                {
                	if(tab.isTabItemExist(tabid))
                	{
                		tab.selectTabItem(tabid);
                	}
                }
       //关闭弹窗         
       function  f_closeWindow()
   			{
                //$.ligerDialog.close();  //写法1，这么写遮罩会不消失，这不是坑爹么？？
               reload();
               window.loginWin.close(); 
    		}                
                 /* setTimeout(function(){lessonTree();},3000);
                 setTimeout(function(){ligerMenu();},4000); */

                 
    </script>

</head>
<body style="text-align:center; background:#F0F0F0; overflow:hidden;" >    
    <div id="topmenu" class="l-topmenu">
        <div class="l-topmenu-logo"><img src="${pageContext.request.contextPath}/cms/images/index/head-logo.png"></div>
        <div class="l-topmenu-welcome"> 
            <span class="l-topmenu-username">${admin.admName}</span>&nbsp;&nbsp;欢迎您  &nbsp; 
            [<a href="javascript:f_changepassword()">修改密码</a>] &nbsp; 

            [<a href="javascript:f_login()">切换用户</a>]
            [<a href="${pageContext.request.contextPath}/system/logout">退出</a>] 
        </div> 
    </div> 
    <div id="mainbody" class="l-mainbody" style="width:99.2%; margin:0 auto; margin-top:3px;" >
    	 <div position="left" title="主要菜单" id="mainmenu">
    	 </div>
    	   <div position="center" title="" id="framecenter">
            	 	<div tabid="home" title="我的主页" >
						<iframe frameborder="0" name="showmessage" src="../cms/welcome.jsp"></iframe>
					</div>
            </div> 
    </div>
    <div  style="height:32px; line-height:32px; text-align:center;">
            Copyright © 2006 - 2013 wx.daliedu.cn All Rights Reserved
    		</div> 
    <div class="l-hidden"></div>
</body>
</html>
