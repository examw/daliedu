<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 普通搜索显示 -->
<title></title>
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
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerToolBar.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDrag.js" type="text/javascript"></script>
    <style type="text/css">
    	.l-select{
    	border:1px solid #AECAF0; 
    	background:#DBEBFF url('../../images/controls/bg-trigger.gif') repeat-x left;}
    	a:link,a:visited{
 			text-decoration:none;  /*超链接无下划线*/
		}
		a:hover{
 			text-decoration:underline;  /*鼠标放上去有下划线*/
 			color:red;
		}
    </style>
     <script type="text/javascript">
     	$.ligerDefaults.Grid.formatters['mydate'] = function (value, column) {
    	 	if(!value) return "";
    	 	return value.toString().replace("T","  ");
    	 	};
    	 $.ligerDefaults.Grid.formatters['mymoney'] = function (value, column) {
    	 	if(!value) return "0.0";
    	 	return Number(value).toFixed(2);
    	 	};
     	var g,manager;
        $(function ()
        {
            $("form").ligerForm();
            /* $("#before").change(function(){
            	if(Date.parse($("#before").val())<new Date().getTime())
            	{
            		$("#beforeInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
            	}
            	else
            		$("#beforeInfo").html("想穿越？");
            	
            }); */
            $("#after").change(function(){
            	if(Date.parse($("#after").val())<new Date().getTime())
            	{
            		$("#afterInfo").html("<img src='${pageContext.request.contextPath}/cms/images/label3.gif'>");
            	}
            	else
            		$("#afterInfo").html("想穿越？");
            	
            });
            $("#Button1").click(function(){
            	if(!(checkDate($("#after"),$("#afterInfo"))&checkBetween()&checkOrderId()))
            	 {
            			return;
            	 }
            	$("form").hide();
            	f_showTrade();
            	$("#maingrid4").show();
            	//return false;
            });
            
        }); 
        function checkDate(input,span)
        {
        	//不写为true 可以不写
        	if(!input.val()||!$.trim(input.val()))
        	{
        		span.html("");
        		return true;
        	}
            if(Date.parse(input.val())>new Date().getTime())
            {
            	span.html("想穿越？");
            	return false;
            }
            span.html("");
            return true;
        }
        //日期必须交叉     比如 必须是  2001-01-30之后2001-03-30之前
        function checkBetween()
        {
        	if(!$.trim($("#after").val())||!$.trim($("#before").val()))
        	{
        		return true;
        	}
        	var before = Date.parse($("#before").val());
        	var after = Date.parse($("#after").val());
        	if(before<=after)
        	{
        		$("#afterInfo").html("日期要交叉");
        		return false;
        	}else
        	{
        		return true;
        	}
        }
        function checkOrderId()
        {
        	if(!$("#orderId").val()||!$.trim($("#orderId").val()))
        	{
        		return true;
        	}else if(/^\d+$/.test($("#orderId").val()))
        	{
        		return true;
        	}else
        	{
        		$("#idInfo").html("认真填写");
        		return false;
        	}
        }
        ////////////////////////////////////////////////////////////////////////////////
        
       //	var orderData =eval('(' + orderData1 + ')');
            function f_showTrade()
        {
        	 g = $("#maingrid4").ligerGrid({
                columns: [ 
                 {display:'交易号' ,name:'tradeId',isAllowHide:true},
                {display: '交易金额', name: 'tradeMoney', width: 120 ,render: function (record, rowindex, value, column) {
                		if(value==0) return "<span>"+value+"</span>";
                		else if(value<0) return "<span style='font-size:20px;color:red'>－</span><span style='color:red'>"+Math.abs(value)+"</span>";
                		else return "<span style='font-size:20px;color:red'> +</span><span style='color:red'>"+value+"</span>";
                	}} ,
                {display:'学员ID',name:'stuId',width:100,render:function(record, rowindex, value, column){
                		return "<a href='${pageContext.request.contextPath}/order/loadStu?stuId="+value+"'>"+value+"</a>";
                }},
                {display:'即时现金券',name:'tradeCashBalance',width:80,type:'mymoney'},
                { display: '交易时间', name: 'tradeTime',type:'mydate', minWidth: 200 },
                { display: '订单号', name: 'tradeOrderNo', width: 150 },
                { display: '交易类型', name: 'type', width: 100  },
                { display: '交易备注', name: 'tradeNote', width: 300 }
                ], 
                url:"${pageContext.request.contextPath}/trade/searchList?type="+$("#type").val()+"&before="+$("#before").val()+"&after="+$("#after").val()+"&orderId="+$("#orderId").val(),
                 pageSize: 20, sortName: 'tradeTime',sortOrder:'desc',method:"post",
                width: '98%', height: '98%', rownumbers:true,dateFormat:"yyyy-MM-dd",dataAction:"server",rowHeight: 25,headerRowHeight:30,
                  toolbar: { items: [
                { text: '刷新', click: f_reload, img: '../../images/icon/refresh.gif' },
                { line: true }, 
                { text: '返回搜索', click: f_back, img: '${pageContext.request.contextPath}/cms/images/icon/back.gif' }
                ]}
            });
            manager=$("#maingrid4").ligerGetGridManager();
            //绑定双击事件
/*             manager.bind("dblClickRow",
            			function(rowdata, rowindex, rowDomElement){
            				$.ligerDialog.open({ title:"详细信息",content:g.getSelected(),url: "${pageContext.request.contextPath}/user/loadTeacher?id="+rowdata.tchId, height: 200,width: 660,showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, buttons: [ { text: '确定', onclick: function (item, dialog) { } }, { text: '取消', onclick: function (item, dialog) { dialog.close(); } } ] });;});
  */           $("#pageloading").hide();
        }
         //刷新
        function f_reload()
        {
            manager.loadData();
        }
        //返回
        function f_back()
        {
        	$("#maingrid4").hide();
        	$("form").show();
        }
        var alert = function (content)
        {
            $.ligerDialog.alert(content);
        };
    </script>
    <style type="text/css">
        .l-table-edit {margin-top:100px}
        .l-table-edit-td{ padding:4px;}
        .advance{display:none}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
</head>
<body>
	<center>
	    <form name="form1" method="post"  id="form1" action="">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	<!--  -------------------------  -->
        	<tr>
                <td align="right" class="l-table-edit-td">订单编号:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="orderId" type="text" id="orderId" onblur="checkOrderId();"/></td>
                <td align="left"><span style="color:red" id="idInfo"></span></td>
           </tr>
			<tr >
                <td align="right" class="l-table-edit-td">在此之前的交易:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="before" type="text" id="before" ltype="date" /></td>
                <td align="left"><span style="color:red" id="beforeInfo"></span></td>
            </tr>
           <tr >
                <td align="right" class="l-table-edit-td">在此之后的交易:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" ><input name="after" type="text" id="after" ltype="date" /></td>
                <td align="left"><span style="color:red" id="afterInfo"></span></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">交易类型:</td>
                <td align="left" class="l-table-edit-td" style="width:160px" >
					<select name="status" class="l-select" id="type" ltype="select">
						<option value="all" selected="selected">所有</option>
						<option value="recharge">充值</option>
						<option value="buyclass">购买课程</option>
						<option value="other">其他</option>
						
					</select>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
            	<td></td>
            	<td><div id="message" title="默认搜索全部"><input type="button" value="搜索" id="Button1" class="l-button l-button-submit" /></div> 
            	<input type="reset" value="重置" class="l-button l-button-reset"/></td>
            </tr>  
        </table>
 <br />
    </form>
    </center>
<!--表格 ----------------------------------------
 <div class="l-loading" style="display: block" id="pageloading">
    </div> -->
<div id="maingrid4" style="margin: 3px; padding: 0">
    </div>
    <div style="display: none;">
    </div>

</body>
</html>
