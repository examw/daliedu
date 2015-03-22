<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	 <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerRadio.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
     <script type="text/javascript">
     	var areas;
        $(function ()
        {
        	$.ajax({
        		url:"/common/area_exam.json",
        		dataType:"json",
        		success:function(data){
        			areas = data.area;
        			var max = areas.length;
        			$("#select").html("<select id='areaSelect_prov' style='width:90px' name='prov'></select><select id='areaSelect_city' style='width:90px' name='city'></select>");
        			for(var i=0;i<max;i++)
        			{
        				if(i<areas.length)
        				{
        					var a_option = $("<option value='"+areas[i].prov+"'>"+areas[i].prov+"</option>");
        					$("#areaSelect_prov").append(a_option);
        				}
        			}
        			$("#areaSelect_prov").val(areas[0].prov);
        			var citys = (areas[0].city).split("|");
        			$("#areaSelect_city").html("");
        			for(var j=0;j<citys.length;j++)
        			{
        				var a_option = $("<option value='"+citys[j]+"'>"+citys[j]+"</option>");
        				$("#areaSelect_city").append(a_option);
        			}
        			$("#areaSelect_city").val(citys[0]);
        			$("#areaSelect_prov").change(function(){
                		$("#areaSelect_city").html("<option value=''>全部</option>");
                		for(var i=0;i<areas.length;i++)
                		{
                			if($(this).val()==areas[i].prov)
                			{
                				var citys = (areas[i].city).split("|");
                				for(var j=0;j<citys.length;j++)
                				{
                					var a_option = $("<option value='"+citys[j]+"'>"+citys[j]+"</option>");
                					$("#areaSelect_city").append(a_option);
                				}
                				$("#areaSelect_city").val(citys[0]);
                			}
                		}
                	});
        		}
        	
        	});
            $("form").ligerForm();
            $("#date").change(function(){
            	if(Date.parse($("#date").val())<new Date().getTime())
            	{
            		$("#info").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
            	}
            	else
            		$("#info").html("想穿越？");
            	
            });
            $("#Button1").click(function(){
            	if(!$("#date").val())
            	{
            		$("#info").html("请选择日期");
            		return false;
            	}
            	if(Date.parse($("#date").val())>new Date().getTime())
            	{
            		$("#info").html("想穿越？");
            		return false;
            	}
            });
        }); 
    </script>
    <style type="text/css">
        .l-table-edit {margin-top:100px}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
</head>
<body>
	<center>
	    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/user/export">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!--  -------------------------  -->
        	<tr>
                <td align="right" class="l-table-edit-td">选择地区:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" id="select">
				</td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">此后注册的:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
                <input name="date" type="text" id="date" ltype="date"/></td>
                <td align="left"><span style="color:red" id="info"></span></td>
            </tr>
            <tr>
            	<td></td>
            	<td><input type="submit" value="导出" id="Button1" class="l-button l-button-submit" /> 
            	<input type="reset" value="重置" class="l-button l-button-reset"/></td>
            </tr>  
        </table>
 <br />
    </form></center>
</body>
</html>
