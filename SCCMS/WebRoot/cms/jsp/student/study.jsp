<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTab.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/CustomersData.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerMenu.js" type="text/javascript"></script>
    <script type="text/javascript">
    	var stuId = ${stuId};
    	 $.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	return value.toString().replace("T","  ");
    	 	};
        var g,manager;
        $(function ()
        {
            g = $("#maingrid4").ligerGrid({
                columns: [ 
                {display:'课程名称',name:'recordName',width:180},
                { display: '学习时间', name: 'recordStartTime',type:'mydate', width: 180 },
                { display: 'IP', name: 'recordIp', width: 180 },
                { display: '学习次数', name: 'countNum', width: 100  }
                ], 
                url:"${pageContext.request.contextPath}/user/studyRecord?stuId="+stuId, 
                pageSize: 10, sortName: 'recordStartTime',sortOrder:'desc',method:"post",
                width: '98%', height: '98%', rownumbers:true,dateFormat:"yyyy-MM-dd",dataAction:"server",rowHeight: 25,headerRowHeight:30
            });
            manager=$("#maingrid4").ligerGetGridManager();
         	$("#pageloading").hide();
        }); 
        //刷新
        $(function(){
        	$("#search").change(function(){
            	if($("#search").val()=="class")
            	{
            		g.set({
            		columns: [ 
		                {display:'课程名称',name:'recordName',width:180},
		                { display: '学习时间', name: 'recordStartTime',type:'mydate', width: 180 },
		                { display: 'IP', name: 'recordIp', width: 180 },
		                { display: '学习次数', name: 'countNum', width: 100  }
		                ], 
		                url:"${pageContext.request.contextPath}/user/studyRecord?stuId="+stuId, 
		                pageSize: 10, sortName: 'recordStartTime',sortOrder:'desc',method:"post",
		                width: '98%', height: '98%', rownumbers:true,dateFormat:"yyyy-MM-dd",dataAction:"server",rowHeight: 25,headerRowHeight:30
            		});
            	}
            	else{
            		g.set({url:"${pageContext.request.contextPath}/user/examRecord?stuId="+stuId,
            			 columns: [ 
			                {display:'考试名称',name:'paperName',width:180},
			                { display: '开始时间', name: 'rcdStartTime',type:'mydate', width: 150 },
			                { display: '结束时间', name: 'rcdEndTime',type:'mydate', width: 150 },
			                { display: '考试得分', name: 'paperScore', width: 100  },
			                { display: '考试次数', name: 'rcdTestNum', width: 100  }
			                ], 
			                pageSize: 10, sortName: 'rcdStartTime',sortOrder:'desc',method:"post",
			                width: '98%', height: '98%', rownumbers:true,dateFormat:"yyyy-MM-dd",dataAction:"server",rowHeight: 25,headerRowHeight:30	
            		});
            	}
            });
        });
        function f_reload()
        {
            manager.loadData();
        }
        //封装alert方法
        var alert = function (content)
        {
            $.ligerDialog.alert(content);
        };
    </script>
</head>
<body style="padding: 4px; overflow: hidden;">
<div class="l-panel-search" >
 <div class="l-panel-search-item">
        <select name="searchName" class="l-select" id="search" ltype="select">
			<option value="class" selected="selected">课程</option>
			<option value="exam">考试</option>
		</select>
    </div>
</div>
<div class="l-loading" style="display: block" id="pageloading"></div> 
<div id="maingrid4" style="margin: 0; padding: 0"></div>
<div style="display: none;"></div>
</body>
</html>
