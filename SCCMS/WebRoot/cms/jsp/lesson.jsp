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
            <script type="text/javascript">

                $(function ()
                {
                    $("#layout1").ligerLayout({ leftWidth: 200});
                    $("#maingrid").ligerGrid(
                    
                    );
                    var data = [];
              
           			 data.push({ id: 1, pid: 0, text: '1'});
            		data.push({ id: 2, pid: 1, text: '1.1' });
           			 data.push({ id: 4, pid: 2, text: '1.1.1', url:"toolbar.htm" });
            		data.push({ id: 5, pid: 2, text: '1.1.2' });      

            		data.push({ id: 10, pid: 8, text: 'wefwfwfe' });
            		data.push({ id: 11, pid: 8, text: 'wgegwgwg' });
            		data.push({ id: 12, pid: 8, text: 'gwegwg' });

            		data.push({ id: 6, pid: 2, text: '1.1.3', ischecked: true });
            		data.push({ id: 7, pid: 2, text: '1.1.4' });
            		data.push({ id: 8, pid: 7, text: '1.1.5' });
            		data.push({ id: 9, pid: 7, text: '1.1.6' });

            		$("#lessonTree").ligerTree({  
            			data:data, 
            			idFieldName :'id',
            			parentIDFieldName :'pid',
            			checkbox:false,
            			onSelect:function(node)
            			{
            				if(!node.data.url) return;
            				$("#iframe").attr("src","toolbar.htm");
            			}
            		});
                });         
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
            <div position="center" title="操作">
            	 <iframe id="iframe" marginheight="10px" marginwidth="10px" height="100%" width="100%" frameborder="0" src=""></iframe>
            </div>  
        </div> 
    </body>
    </html>
