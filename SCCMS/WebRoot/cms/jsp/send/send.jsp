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
        <script src="../../js/ligerMenu.js" type="text/javascript"></script>
        <script type="text/javascript">
				var tab =null;
                $(function ()
                {
                    $("#layout1").ligerLayout({ leftWidth: 200});
                    tab=$("#orderTab").ligerTab(); 
                    $("#maingrid").ligerGrid(
                    );
                    //绑定事件,便于不同位置的切换
                     tab.bind("afterRemoveTabItem",
                     		function(tabid){
                     			$("#"+tabid).removeClass("l-o-div-down");
                     			if(tabid=="modifySend")
                     			{
                     				tab.selectTabItem("sendList");
                     			}
                     			if(tabid=="modifyEpc"||tabid=="addEpc")
                     			{
                     				tab.selectTabItem("companyList");
                     			}
                     		});
                }); 
                function list(id,url2,title)
                {
                	if(tab.isTabItemExist(id)){tab.selectTabItem(id);return;}
                	tab.addTabItem({tabid:id,url:url2,text:title,height:400});
                	$("#"+id).addClass("l-o-div-down");
                }
                function addTab(tabid,url,text)
                {
                	if(tab.isTabItemExist(tabid))
                	{
                		if(tabid=='modifyEpc'||tabid=='modifySend')
                		{
                			overrideTab(tabid,url,text);
                			return;
                		}
                		tab.selectTabItem(tabid);
                		return;
                	}
                    tab.addTabItem({tabid:tabid,url:url,text:text,height:500});
                    	
                }
                function overrideTab(tabid,url,text)
                {
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
                	if(tab.isTabItemExist(tabid))
               		{
                		tab.reload(tabid);
               	}}
               	function selectTab(tabid)
               	{
               		if(tab.isTabItemExist(tabid))
               		{
                		tab.selectTabItem(tabid);
                	}
               	}
         </script> 
        <style type="text/css"> 
            body{ padding:5px; margin:0; padding-bottom:15px;}
            #layout1{  width:100%;margin:0; padding:0;  }  
            .l-page-top{ height:80px; background:#f8f8f8; margin-bottom:3px;}
            h4{ margin:20px;}
			.l-o-div{font-family: "微软雅黑", "宋体", Arial, sans-serif;height:30px;background-color:#f8f8f8;padding-left:10px;padding-top:10px;text-align:left;font-size:12px;}
            .l-o-div:hover{background: url(../../images/controls/button-bg-over.gif) repeat; border-color:#D6A886;cursor:pointer;}
            .l-o-div-down{background: url(../../images/controls/button-bg.gif) repeat center; border-color:#D6A886;}
         </style>
    </head>
    <body style="padding:10px">  
      <div id="layout1">
            <div position="left" title="订单分类">
            	<div class="l-o-div" onclick="list('companyList','companyList.jsp','快递公司列表');" id="companyList">快递公司</div>
            	<div class="l-o-div" onclick="list('sendList','sendList.jsp','寄送列表');"id="sendList">寄送情况</div>
            	<div class="l-o-div" onclick="list('searchSend','searchSend.jsp','搜索寄送表');"id="searchSend">搜索</div>
            </div>
            <div position="center" title="">
            	 <!-- <iframe id="iframe" marginheight="10px" marginwidth="10px" height="100%" width="100%" frameborder="0" src=""></iframe>-->
            	 <div id="orderTab" style="overflow:hidden; border:1px solid #A3C0E8;">
            	 	<div tabid="home" title="我的主页" lselected="true"  style="height:300px" >
						<iframe frameborder="0" name="showmessage" src=""></iframe>
					</div>
            	 </div>
            </div>  
        </div> 
</body>
</html>