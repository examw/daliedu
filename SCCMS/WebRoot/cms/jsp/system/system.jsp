<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <title></title>
        <link href="../../css/ligerui-all.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
        </style>
     	<script src="../../js/jquery-1.3.2.min.js" type="text/javascript"></script>   
   	 	<script src="../../js/base.js" type="text/javascript"></script>
        <script src="../../js/ligerLayout.js" type="text/javascript"></script>
        <script src="../../js/ligerTree.js" type="text/javascript"></script>
        <script src="../../js/ligerGrid.js" type="text/javascript"></script>
        <script src="../../js/ligerTab.js" type="text/javascript"></script>
        <script src="../../js/ligerDialog.js" type="text/javascript"></script>
        <script src="../../js/ligerAccordion.js" type="text/javascript"></script>
        <script src="../../js/ligerMenu.js" type="text/javascript"></script>
            <script type="text/javascript">
				var tab =null;
                $(function ()
                {
                    $("#layout1").ligerLayout({ leftWidth: 200});
                    tab=$("#orderTab").ligerTab(); 
                    //绑定事件
                    tab.bind("afterRemoveTabItem",
                  		function(tabid){
                     		if(tabid=="addAdmin"||tabid=="modifyAdmin")
                     		{
                     			tab.selectTabItem("admList");
                     		}
                     		if(tabid=="addAdmin1"||tabid=="modifyAdmin1")
                     		{
                     			tab.selectTabItem("searchAdm");
                     		}
                     		if(tabid=="addStudent")
                     		{
                     			tab.selectTabItem("stuList");
                     		}
            		}); 
                    $("#accordion1").ligerAccordion({ height: 300});
                    $("#maingrid").ligerGrid(
                    );
                    $("#admList").click(function(){
                    	if(tab.isTabItemExist("admList")){tab.selectTabItem("admList");return;}
                    	tab.addTabItem({tabid:"admList",url:"adminList.jsp",text:"管理员列表",height:400});
                    	});
                    $("#createCards").click(function(){
                    	if(tab.isTabItemExist("createCards")){tab.selectTabItem("createCards");return;}
                    	tab.addTabItem({tabid:"createCards",url:"createCards.jsp",text:"批量生成",height:400});
                    	});
                    $("#cardList").click(function(){
                    	if(tab.isTabItemExist("cardList")){tab.selectTabItem("cardList");return;}
                    	tab.addTabItem({tabid:"cardList",url:"cardList.jsp",text:"列表",height:400});
                    	});
                    $("#export").click(function(){
                    	if(tab.isTabItemExist("export")){tab.selectTabItem("export");return;}
                    	tab.addTabItem({tabid:"export",url:"export.jsp",text:"导出",height:400});
                    	});
                    $("#searchAdm").click(function(){
                    	if(tab.isTabItemExist("searchAdm")){tab.selectTabItem("searchAdm");return;}
                    	tab.addTabItem({tabid:"searchAdm",url:"searchAdm.jsp",text:"搜索",height:400});
                    	});
                }); 
                function addTab(tabid,url,text)
                {
                	if(tab.isTabItemExist(tabid))
                	{	if(/modify/.test(tabid))
                		{
                			overrideTab(tabid,url,text);
                			return;
                		}
                		tab.selectTabItem(tabid);
                		return;
                	}
                    tab.addTabItem({tabid:tabid,url:url,text:text,height:400});
                    	
                }
                function overrideTab(tabid,url,text)
                {
                	//if(tab.isTabItemExist(tabid)){tab.overrideSelectedTabItem({tabid:tabid,url:url,text:text,height:400});return;}
                	tab.removeTabItem(tabid);
                    tab.addTabItem({tabid:tabid,url:url,text:text,height:400});
                    	
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
         </script> 
        <style type="text/css"> 
            body{ padding:5px; margin:0; padding-bottom:15px;}
            #layout1{  width:100%;margin:0; padding:0;  }  
            .l-page-top{ height:80px; background:#f8f8f8; margin-bottom:3px;}
            h4{ margin:20px;}
            .l-div{font-family: "微软雅黑", "宋体", Arial, sans-serif; font-size: 13px;margin-left:10px;padding-top:5px;padding-bottom:5px}
            .l-div-welcome{color:blue;font-family: "微软雅黑", "黑体", Arial, sans-serif; font-size: 18px;margin-left:100px;padding-top:120px;padding-bottom:5px}
            li:hover {background: #FFBE76 url(../../images/controls/button-bg-over.gif) repeat-x center; border-color:#D6A886;cursor:pointer;}
         </style>
    </head>
    <body style="padding:10px">  
      <div id="layout1">
            <div position="left">
                <div id="accordion1"> 
        			 <div title="管理员管理">
              			<ul class="">
                    		<li id="admList"><div class="l-div">管理员列表</div></li>
                    		<li id="searchAdm"><div class="l-div">搜索</div></li>
                		</ul>
        			</div>
        			<div title="系统参数">
                		<ul>
                    		<li>列表一</li>
                    		<li>列表二</li>
                    		<li>列表三</li>
                    		<li>列表四</li>
                    		<li>列表五</li>
               			</ul>
        			</div> 
       				<div title="数据库管理" style="padding:10px"> 
        				其他内容
        			</div>
        			<div title="学习卡管理">
        				<ul class="">
                    		<li id="createCards"><div class="l-div">生成学习卡</div></li>
                    		<li id="cardList"><div class="l-div">学习卡列表</div></li>
                    		<li id="export"><div class="l-div">导出</div></li>
                		</ul>
        			</div>
        			<div title="其他">
        				其他
        			</div>
  			  </div>        
            </div>
            <div position="center" title="">
            	 <!-- <iframe id="iframe" marginheight="10px" marginwidth="10px" height="100%" width="100%" frameborder="0" src=""></iframe>-->
            	 <div id="orderTab" style="overflow:hidden; border:1px solid #A3C0E8;">
            	 	<div tabid="home" title="我的主页" lselected="true"  style="height:300px" >
            	 		<div class="l-div-welcome">欢迎进入系统管理,请谨慎操作！！</div>
						<iframe frameborder="0" name="showmessage" src=""></iframe>
						
					</div>
            	 </div>
            </div>  
        </div> 
</body>
</html>