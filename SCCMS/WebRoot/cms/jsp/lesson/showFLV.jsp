<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>预览视频</title>
</head>
<body>
	 <div id="playerContent" style="height: 450;width: 800px"></div>
	 <script src="${pageContext.request.contextPath}/cms/js/jwplayer.min.js" type="text/javascript"></script>
	 <script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script>
	 <script type="text/javascript">
	 $(function(){
	 	jwplayer("playerContent").setup({
				    flashplayer: '${pageContext.request.contextPath}/cms/js/Player.swf',			   
	                'file': '${url}',
					width: 640,
					height: 360,
					controlbar: 'bottom',
					image:'/images/bg2.png',
					provider: 'http',
					autostart: 'true'
	            });
	 }
	 );
	      
	</script>
</body>
</html>