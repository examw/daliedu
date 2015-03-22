<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改头像  我的首页</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<link href="../js/jqueryui.css" rel="Stylesheet" type="text/css" /> 
<style type="text/css">
	.info .succ {border-bottom: 1px solid #CCCCCC;color: #00AA13;float: left;font-size: 14px;font-weight: bold;line-height: 22px;padding: 0 0 10px;width: 400px;}
	.info  .link {clear:both;float: left;line-height: 22px;margin: 5px 0;}
</style>
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript" src="../js/jqueryui1.8.js"></script> 
<script type="text/javascript" src="../js/cropzoom.js"></script> 
<script type="text/javascript">
	$(function() {
	$("#info_").addClass("hhover");
     var cropzoom = $('#crop_container2').cropzoom({
          width: 310,
          height: 310,
          bgColor: '#ccc',
          enableRotation: false,
          enableZoom: true,
          selector: {
			   w:125,
			   h:125,
			   showPositionsOnDrag:false,
			   showDimetionsOnDrag:false,
               centered: true,
			   bgInfoLayer:'#fff',
               borderColor: 'blue',
			   animated: false,
			   maxWidth:125,
			   maxHeight:125,
               borderColorHover: 'yellow'
           },
           image: {
               source: "../upload/temp/"+"${mfFileName}",
			   width: ${imgWidth},
               height: ${imgHeight},
               minZoom: 10,
               maxZoom: 150
             
            }
      });
	 $("#crop").click(function(){
		  cropzoom.send('../memberCenter/crop.jsp', 'POST', {}, function(imgRet) {
               //$("#generated").attr("src", imgRet);
               changeFace("../upload/userface/"+imgRet);
          });			   
	 });
	 $("#restore").click(function(){
		  $("#generated").attr("src", "tmp/head.gif");
		  cropzoom.restore();					  
	 });
});
	function changeFace(imgUrl)
	{
		$.ajax({
			async:true,
			type:"POST",
			dataType:'json',
			url:'../member/changeFace',
			data:{"imgUrl":imgUrl,"url":"../memberCenter/face.jsp"},
			success:function(data){
				if(data)
				{
					//alert("修改成功");
					//window.location.replace("../memberCenter/face.jsp");
					$("#listContent").html('<ul class="info"><li class="succ">修改成功</li><li class="link"></li><li class="link"><a href="../member/center">返回首页</a></li></ul>');
				}
			},
			error:function(){}
			
		})
	}
</script>
</head>

<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="../member/center">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="../memberCenter/info.jsp">个人信息</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">头像照片</a></p>
<div class="List">
  <div class="ListContent TopBorder" id='listContent'>
  <ul class="info">
  <li class="ctt_lfhre"><h1>个人资料：</h1></li>
  <li class="lfhre_sp">
  <ol>
  <li><a href="../memberCenter/info.jsp">个人资料</a></li>
  <li class="infoxz"><a href="#">头像照片</a></li>
  <li><a href="../memberCenter/modifyPwd.jsp">密码修改</a></li>
  <li><a href="../member/addressList">收货地址</a></li>
  <li><a href="#">安全验证</a></li>
  </ol>
  </li>
  <li id="con2">
	<div class="midtext3">
		<div class="top">裁切头像照片</div>
		<div class="intrF">
			<div class="depict">您可以拖动照片以裁剪满意的头像</div>
			<div>  <div id="Currentimages" style="overflow: auto;">
    <ul>
        <li>
            <div id="ctl00_cp1_currentImage">
            </div>
            <div id="div_HeadImageCut">
                <div id="crop_container2">
                <br />
            </div>
        </li>
        <li style="display:none">
        图片实际宽度： <input name="ctl00$cp1$txt_width" type="text" value="1" id="ctl00_cp1_txt_width" class="Hidden" /><br />
        图片实际高度： <input name="ctl00$cp1$txt_height" type="text" value="1" id="ctl00_cp1_txt_height" class="Hidden" /><br />
        距离顶部： <input name="ctl00$cp1$txt_top" type="text" value="1" id="ctl00_cp1_txt_top" class="Hidden" /><br />
        距离左边： <input name="ctl00$cp1$txt_left" type="text" value="1" id="ctl00_cp1_txt_left" class="Hidden" /><br />
        截取框的宽： <input name="ctl00$cp1$txt_DropWidth" type="text" value="1" id="ctl00_cp1_txt_DropWidth" class="Hidden" /><br />
        截取框的高： <input name="ctl00$cp1$txt_DropHeight" type="text" value="1" id="ctl00_cp1_txt_DropHeight" class="Hidden" /><br />
        放大倍数： <input name="ctl00$cp1$txt_Zoom" type="text" value="1" id="ctl00_cp1_txt_Zoom" class="Hidden" />
        </li>
    </ul>
</div></div>
			<div class="btn">
				<input type="submit" name="ctl00$cp1$btn_Image" value="保存头像" id="crop" class="btn2" /><input type="hidden" name="ctl00$cp1$hfFace" id="ctl00_cp1_hfFace" value="/upload/Img_{}temp,/6e42b69e-52b0-4e0c-a032-f8aae86a3806.jpg" /><div style="display:none">原尺寸：宽<label id="width" class="Hidden">
                  1024</label>px  高：<label id="height" class="Hidden">640px</label></div>
			</div>
		</div>
	</div>
	<div class="midtext3"  style="float:right">
		<div class="top">更新头像</div>
		<div class="intrF">
			<div>
				
			</div>
			<div>
				<div class="bb"><br /><a href="../memberCenter/face.jsp" class="blueLinkun">重新上传</a></div>
			</div>
			<div class="btn">
				
			</div>
			<div class="box">
				
			</div>
		</div>
	</div>

  </li>
  </ul>
  </div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
