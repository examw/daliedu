<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>
</title>
    <link href="${pageContext.request.contextPath}/cms/css/jqueryui.css" rel="Stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cms/js/jqueryui1.8.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/cms/js/cropzoom.js"></script>
    <script type="text/javascript">
        $(function ()
        {
            var cropzoom = $('#crop_container2').cropzoom({
          	width: 600,
          	height: 500,
          	bgColor: '#ccc',
          	enableRotation: false,
          	enableZoom: true,
          	selector: {
			   w:479,
			   h:300,
			   showPositionsOnDrag:false,
			   showDimetionsOnDrag:false,
               centered: true,
			   bgInfoLayer:'#fff',
               borderColor: 'blue',
			   animated: false,
			   maxWidth:479,
			   maxHeight:300,
               borderColorHover: 'yellow'
           },
           image: {
               source: "../upload/temp/"+"${mfFileName}",
			   width: ${imgWidth},
               height: ${imgHeight},
               minZoom: 10,
               maxZoom: 150
             
            }});
            //$("form").ligerForm();
            $("#Button1").click(
            	function(){
            			cropzoom.send('${pageContext.request.contextPath}/cms/jsp/teacher/crop.jsp', 'POST', {}, function(imgRet) {
               				var imgurl = "${pageContext.request.contextPath}/upload/teacherface/"+$.trim(imgRet);
               				$.post(
            				"${pageContext.request.contextPath}/user/updateTeacherImgUrl",
            				{"teacher.tchImgUrl":imgurl,"teacher.tchId":${tchId}},
            				function(data){
            					if(data)
            					{
            						$.ligerDialog.alert("操作成功",function(){
            								//parent.parent.fresh("teacherList");
            								location="${pageContext.request.contextPath}/user/loadTeacher?id=${tchId}";
            								//parent.parent.selectTab("teacherList");
            						});
            					}else
            					{
            					}
            				},
            				"json"
            			);
          				});
            		});
        });  
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>

</head>

<body style="padding:10px">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!--  -------------------------  -->
        	<tr>
        	<td>
				<div id="crop_container2"></div>
            </td>
            </tr>
            <tr>
            <td align="center"><input type="button" value="修改" id="Button1"></td>
        	</tr>
           
        </table>
    <div style="display:none">
    <!--  数据统计代码 --></div>    
</body>
</html>
