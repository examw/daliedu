<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script>
    </head>
	<body style="padding:2px;text-align:center;">
		 <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<tr>
                <td align="right" class="l-table-edit-td">课件名称:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
                	<select id="record">
                			<option></option>
                		 <s:iterator value="list" var="r">
                		 	<option value="${r.recordId}">${r.recordName}</option>
                		 </s:iterator>
                	</select>
                </td>
                <td align="left"><span style="color:red" id="nameInfo"></span></td>
            </tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">增加次数:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
                	<input class="l-text" type="text" id="num" value="3"/>
                </td>
                <td align="left"><span style="color:red" id="numInfo">输入正整数</span></td>
            </tr>
            </table>
	</body>
	<script type="text/javascript">
		function getValue2(id){
			if(id == "num"){
				var num = Number($("#num").val());
				if(!num || num < 0){
					$("#numInfo").html("输入有误");
					return 0;
				}else{
					$("#numInfo").html("");
				}
				return Math.floor(num);
			}
			if(id == 'record'){
				var recordId = $.trim($("#record").val());
				if(!recordId){
					return 0;
				}else
					return recordId;
			}
		}
	</script>
</html>