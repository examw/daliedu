<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2013年${exam.examName},助你一次通关取证!</title>
<META name="ROBOTS" content="All"/>
<link  href="css/style.css" rel="stylesheet" type="text/css" ></link>
<script src="/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="/js/shop.js" type="text/javascript"></script>
<script src="/artDialog/jquery.artDialog.js?skin=default" type="text/javascript"></script> 
<style>
.shopping {
    background: url("../main/images/shopping.gif") no-repeat scroll 0 0 transparent;
    color: #1066B9;
    display: block;
    height: 55px;
    line-height: 13px;
    margin-right: -23px;
    margin-top: -510px;
    padding-top: 16px;
    position: absolute;
    right: 0;
    text-align: center;
    top: 0;
    width: 21px;
}

.fd_content {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    width: 950px;
}

#bmbox table th {
    background: none repeat scroll 0 0 #F3F3F3;
    color: #333333;
    font-weight: normal;
    height: 26px;
}

#bmbox table th, #bmbox table td {
    text-align: center;
}

</style>
<script language="javascript">
var MyPackageIDCookie,MyGradeIDCookie, username="guestxx";
function userName() {
	return username;
}
function switchTag(tag,content,k,n,stylea,styleb){	 
	for(var i=1;i<=n;i++){
		if (i==k){
			document.getElementById(tag+i).className=stylea;
			document.getElementById(content+i).style.display="block";
		}else{
			document.getElementById(tag+i).className=styleb;
			document.getElementById(content+i).style.display="none";
		}
	}
}
$(function(){
			//发送ajax请求,加载new.jsp信息		
			$("#top").load("../common/head1.jsp?date="+Math.random());		
			//$("#grade").load("/main/grade/grade${exam.examId}.html"); 
			$("#grade").load("/main/examGrade?examId=${exam.examId}"); 
			$("#taocan").load("/main/package/package${exam.examId}.html");
			$("#foot").load("/common/foot1.html");
	});
</script>
</head>
<body>
<div class="top" id="top">
</div>
<div class="loginStr" id="wxlogbox" style="height:249px;display:none;"></div>
<div class="logingc" id="wxregistbox" style="height:530px;display:none;"></div>
<div class="main">
<div class="ztmain">
  <div class="zttext"><a name="yhst" id="yhst"></a>${exam.examDescription}</div>
  <div style="clear:both;"></div>
</div>
<div class="ztmain">
  <div class="ztsttop"><img src="images/top1.png" /></div>
  <div class="ztstcer">
    <div class="ztstconl">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" >
            <tr>
                <td id="hdvplayer" style="width: 860px; height: 446px;">
                    <div id="playerContent"></div>
                </td>
                <td>
                </td>
            </tr>
        </table>
     <div class="free"><img src="images/free48.png" /></div>
    </div>
    <div class="ztstconr">
<div class="vidlf">
    <div class="btcont">
    	<s:iterator value="listPc" var="pc" status="status"><a onclick="bmbox(${pc.ptypeId},'${pc.ptypeName}');" href="javascript:void(0);"><div class="buyvip" style="width:277px;height:50px; background:url(images/bg02.png);"><div  style="margin-left: 5px;margin-bottom: 8px;margin-top: 15px; "><h2 style="color: white;">${pc.ptypeName}</h2></div></div></a>
		<div class="buy_txt">${pc.ptypeDescription}</div></s:iterator>
    </div>
</div>
    </div>
    <div class="kc">
    <div class="kctitle">
    </div>
  </div>
  </div>
  <div class="ztstbottom"></div>
</div>
<div class="pictop"><img src="http://drmcmm.baidu.com/media/id=nH0zPHczrjf4&gp=401&time=nHndPHfYrHn4Ps.gif" width="1030"/></div>
<div class="bttit mar20"><span>多种辅导体系，满足不同的需求</span></div>
<div class="kelb"><div class="kelb_btn01"></div><div class="phone"></div></div>
<!-- 套餐模块 -->
<div  class="kelb_tab" id="taocan">
</div>
<div id="grade" >
</div> 
</div>
<div class="clear"></div>
<div class="foot" id="foot" >
</div>
<div id="gkbox" class="bmfl">
	<div class="tb-cart">
		<div class="tb-action-hint">
        	<a onClick="$('#gkbox').hide();" href="javascript:;" class="J_Close" title="关闭">关闭</a>
			<div class="chen" id="gkbox_img">成功</div>
			<div class="tb-txt"><h4 id="gkbox_tit">课程已成功添加到购课车！</h4><p>购物车共有<strong id="gkbox_num">0</strong>个课程，合计：<strong class="tb-price" id="gkbox_Price">0</strong>元</p><span class="tb-skin"><a href="../cart/cartList" target="_blank" class="tb-long-btn" title="去购课车结算">去购课车结算</a></span><span><a onClick="$('#gkbox').hide();" href="javascript:;" title="再逛逛" class="J_GuanBi">再逛逛</a></span></div>
		</div>
	</div>
</div>
<div id="bmbox" style="display:none;">
	<div class="bm_ke">
		<table width="98%" height="180" align="center" cellspacing="1" cellpadding="0" bgcolor="#efefef">
        	<tbody><tr><th width="300" >新版课程</th><th>课时</th><th>价格</th><th>免费体验</th><th>选课</th></tr></tbody>
        	<tbody id="bmlist"></tbody>
		</table>
	</div>
  <div class="bm_btn"><span class="zcbn"><a onclick="bmform(this)" target="_blank" href="javascript:;">立即报名</a></span></div>
</div>
<script src="../js/jquery-lazyload.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(".floating_box").float({
                delay: 600, //延迟
                position: "t" //位置
            });
            var p_pkg,p_grade,array1,array2;
    		p_pkg = getCookie('package');
    		p_grade = getCookie('grade');
    		array1 = new Array();
    		array2 = new Array();
    		array1 = p_pkg.split(",");
    		array2 = p_grade.split(",");
    		if(p_pkg!="")
    		$("#p_num").html(array1.length);
    		if(p_grade!="")
    		$("#p_num").html(Number($("#p_num").html())+array2.length);
        });
        function getCookie(name) {
			var cookieValue = "";
			var search = name + "=";
			if (document.cookie.length > 0) {
				offset = document.cookie.indexOf(search);
				if (offset != -1) {
					offset += search.length;
					end = document.cookie.indexOf(";", offset);
					if (end == -1) end = document.cookie.length;
					cookieValue = unescape(document.cookie.substring(offset, end));
				};
			}
			return unescape(cookieValue);
		}
	
	
</script>
<div class="floating_box" style="position: absolute; right: -130px; top: 1692px;">
        <div class="fd_content">
            <span class="shopping" style="margin-top: 300px;"><a style="color: #ffffff;" target="shoppingcart"
                href="../cart/cartList">购<br />
                物<br />
                车<br />
                <div class="pnum" id="p_num">
                </div>
            </a></span>
            </div>
</div>
<!--视频模块videoBg开始-->
 <script src="../js/jwplayer.min.js" type="text/javascript"></script>
    <script type="text/javascript">  
     jwplayer("playerContent").setup({
			    flashplayer: '/js/awDIY5.swf',			   
                'file': "3.flv",
				width: '100%',
				height: '100%',
				controlbar: 'bottom',
				"skin":"/js/stormtrooper.zip",	
				image:'/main/images/bg2.png',
				provider: 'http',
				repeat:"always",
				autostart: 'true'
            }); 
    //eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)d[e(c)]=k[c]||e(c);k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1;};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p;}('8("d").c({b:\'/1/e.h\',\'g\':"0://f.a.6:5/3.4",7:\'2%\',9:\'2%\',t:\'s\',"r":"/1/q.w",v:\'/u/k/l.i\',j:\'0\',o:"p",m:\'n\'});',33,33,'http|js|100||flv|8090|com|width|jwplayer|height|chuji8|flashplayer|setup|playerContent|Player|vps|file|swf|png|provider|images|bg2|autostart|true|repeat|always|stormtrooper|skin|bottom|controlbar|main|image|zip'.split('|'),0,{}))
    //eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'[0-2]'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('jwplayer("playerContent").setup({flashplayer:\'/0/youeclass.swf\',\'file\':"1://demo.examw.com:8090/3.flv",width:\'2%\',height:\'2%\',controlbar:\'bottom\',"skin":"/0/stormtrooper.zip",image:\'/main/images/bg2.png\',provider:\'1\',repeat:"always",autostart:\'true\'});',[],3,'js|http|100'.split('|'),0,{}))
    function bmbox(ptypeId,ptypeName){
	$.ajax({
		type:"get",
		scriptCharset: "utf-8",
		url:"/main/classPackageList",
		data:{ptypeId:ptypeId},
		dataType:"json",
		success:function(data){
			var _html = ""
			if(data.IsError == false){
				$.each(data.Data,function(i,n){
					_html += bmList_each(i,n)
				});
			}else{
				_html = data.Message
			}
			$("#bmlist").html(_html)
			art.dialog({ id: "MyDialogQb", content: $("#bmbox")[0], lock: true, padding: 10, opacity: 0.5, fixed: true, title: ptypeName });
		},
		error:function(data){
			$("#bmlist").html("加载出错了！")
			return false;
		},
		async:false,
		cache:false
	});
	return false;
	}
	function bmList_each(i,n){
		var _Temp = ""
		_Temp += "<tr align=\"center\">"
		_Temp += "<td><a href=\"javascript:;\">"+ unescape(n.pkgName) +"</a></td>"
		_Temp += "<td>"+ n.pkgTotalTime +"</td>"
		_Temp += "<td>"+ n.pkgRPrice +"</td>"
		_Temp += "<td><a target=\"_blank\" style=\"color:#F30;\" href=\"/main/audition?pkgId="+ n.pkgId +"\">免费试听</a></td>"
		_Temp += "<td class=\"check\"><input type=\"checkbox\" value=\""+ n.pkgId +"\" name=\"pkgId\"></td>"
		_Temp += "</tr>"
		
		return _Temp
	}
	function bmform(obj){
		var id = "";
		$("#bmlist input[name='pkgId']").each(function(){
			if($(this).prop("checked")){
				var MyPackageIDCookie = getCookie('package');
				if(MyPackageIDCookie==''){
				setCookie('package',$(this).val(),15);
				}else{
				setCookie('package',MyPackageIDCookie+','+$(this).val(),15);
				}
			}
			
		})
		$(obj).attr("href","../cart/cartList")
	}         
</script>
</body>
</html>
