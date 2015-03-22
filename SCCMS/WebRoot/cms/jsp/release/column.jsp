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
	      <div title="栏目" id="lesson">
              			<div id="maintree"></div>
        </div>	
  	</div> 
  	</div>    
    <div position="center" title="操作" > 
    <center>
   	<table cellpadding="0" cellspacing="0" class="l-table-edit">
   		<tr>
            	<td><input type="button" value="发布" class="l-button l-button-reset" onclick="f_release()"/></td>
            	<td><input type="button" value="预览" id="Button1" class="l-button l-button-submit" onclick="f_preview()"/></td>
        </tr>  
   	</table>
    </center>
    </div>
  </div>
<script type="text/javascript">
	 function f_heightChanged(options) {
            if (accordion && options.middleHeight - 24 > 0)
                accordion.setHeight(options.middleHeight - 24);
        }
	$(function ()
           { 
				layout = $("#layout1").ligerLayout({ height: '100%', leftWidth: 220, onHeightChanged: f_heightChanged, minLeftWidth: 120 });
          		var bodyHeight = $(".l-layout-center:first").height();
          		
                accordion = $("#accordion1").ligerAccordion({ height: bodyHeight-24, speed: null ,changeHeightOnResize:true});
                
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
                checkbox:true, 
                treeLine :true,
                icon: 'archives',
                nodeWidth :100,   
                slide :false,
                url: "${pageContext.request.contextPath}/exam/examTree",
                textFieldName:"examName",
                idFieldName:"examId",
                parentIDFieldName:"examPid",
                btnClickToToggleOnly:false  ,
                onClick: function (node)
		        {
		        }      
            });
    //预览
    function f_preview(){
    	var text =getChecked();
    	if(text.length!=1){
    		$.ligerDialog.warn('请选择单个考试');
    		return;
    	}
    	 window.loginWin=$.ligerDialog.open({ 
	          	  	url: "http://localhost:8080/main/main?examId="+text[0],
	          	    title:'预览',
	          	    isHidden: false,
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 500,width:900
	          	    });	       
    }   
    //发布
     function f_release(){
     	if(getChecked().length==0){
     	$.ligerDialog.warn('请选择考试');
    	return;
     	}
     	var text = getChecked();
     	window.loginWin=$.ligerDialog.open({ 
			          	  	url: '${pageContext.request.contextPath}/cms/jsp/release/demo.jsp?examId='+text,
			          	    title:'发布课程',
			          	    isHidden: false,
			          	    icon: 'images/Program Files Folder.png',
			          	    height: 200,width: 300
			          	    });		
			    
			          	    
     /* 	
     	LG.showLoading("正在发布，请稍后");
    	$.post("${pageContext.request.contextPath}/release/releaseGrade",{examId:getChecked},
          					function(ok){
          						LG.hideLoading("正在发布，请稍后");
          						if(ok==true){
          							$.ligerDialog.success('发布成功');
          						}else{
          							$.ligerDialog.error('发布失败');
          						}
							},
							"json"
          					); */
    }
    function getChecked()
        {
        	var text = [];
            var nodes = tree1.getChecked();
            $(nodes).each(function (i, node)
                    {
                        if (node.data.children) return;
                        text.push(node.data.examId);
                    });
            return text;
        }
        
    function  f_closeWindow()
   			{
                //$.ligerDialog.close();  //写法1，这么写遮罩会不消失，这不是坑爹么？？
               window.loginWin.close(); 
    		}                
        
 </script>
</body>
</html>
