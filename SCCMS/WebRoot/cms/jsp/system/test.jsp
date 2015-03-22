<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/cms/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/cms/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/cms/js/exporting.js"></script>
<script type="text/javascript">
var total;
$(function(){
	$.ajax({
	        type: "post",
	        dataType: "json",
	        url: "${pageContext.request.contextPath}/system/chart",
	        success: function (data) {	
	        	chart = new Highcharts.Chart({	
	                chart: {
	                    renderTo: 'container',
	                    
	                    type: 'column'
	                },
	                title: {
	                    text: '中华考试网'
	                },
	                subtitle: {
	                    text: '网校流量'
	                },
	                xAxis: {
	                    categories: [
	                        '第一周',
	                        '第二周',
	                        '第三周',
	                        '第四周',
	                    ]
	                },
	                yAxis: {
	                    min: 0,
	                    title: {
	                        text: 'IP'
	                    }
	                },
	                legend: {
	                    layout: 'vertical',
	                    backgroundColor: '#FFFFFF',
	                    align: 'left',
	                    verticalAlign: 'top',
	                    x: 100,
	                    y: 70,
	                    floating: true,
	                    shadow: true
	                },
	                tooltip: {
	                    formatter: function() {
	                    	
	                        return ''+
	                            this.x +': '+ this.y +'Ip';
	                    }
	                },
	                plotOptions: {
	                    column: {
	                        pointPadding: 0.2,
	                        borderWidth: 0
	                    }
	                },
	                series:data
	            });
	             }
    	});

});

</script>	
</head>
<body>
<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
</body>
</html>
