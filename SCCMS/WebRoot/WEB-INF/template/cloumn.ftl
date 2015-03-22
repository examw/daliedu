<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2014年${exam.examName},助你一次通关取证!</title>
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
var MyPackageIDCookie,MyGradeIDCookie, username="guest";
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
			//$("#foot").load("/common/foot1.html");
	});
	
$(function(){
	MyGradeIDCookie = getCookie('grade');
	//alert(MyGradeIDCookie);
	//alert(MyPackageIDCookie);
	$(".bmbg[myclassid]").each(function(){
		if( MyGradeIDCookieTF($(this).attr("myclassid")) == true){
			$(this).attr("class","bmbg2");
		}
	});
});
function MyPackageIDCookieTF(mid){
	if((","+MyPackageIDCookie+",").indexOf(","+mid+",")==-1){
		return false;
	}else{
		return true;
	}
	}
	$(function(){
	MyPackageIDCookie = getCookie('package');
	$(".bmbg1[myclassid]").each(function(){
		if( MyPackageIDCookieTF($(this).attr("myclassid")) == true){
			$(this).attr("class","bmbg2");
		}
	});	});	
//myid:套餐或者班级id，o：dom对象，type:类型0是套餐，1是单班级
	function CourseSelect(myid,o,type){
	var len = 0,price = 0,obj = $(o),tit = "";
	//套餐cookie
	var MyPackageIDCookie = getCookie('package');
	//班级cookie
	var MyGradeIDCookie = getCookie('grade');
	if(obj.attr("class") == 'bmbg'||obj.attr("class")=='bmbg1'){
		if(type==0)
		{
			if(MyPackageIDCookie==''){
				setCookie('package',myid,15);
			}else{
				setCookie('package',MyPackageIDCookie+','+myid,15);
			}
			obj.attr("class","bmbg2");
			$("#gkbox_img").attr("class","chen").html("成功");
			tit = "课程已成功添加到购课车！";
		}else
		{
			if(MyGradeIDCookie==''){
				setCookie('grade',myid,15);
			}else{
				setCookie('grade',MyGradeIDCookie+','+myid,15);
			}
			obj.attr("class","bmbg2");
			$("#gkbox_img").attr("class","chen").html("成功");
			tit = "课程已成功添加到购课车！";
		}
	}else{
		if(type==0)
		{
			var reg=new RegExp((myid+","),"g");
			MyPackageIDCookie = (MyPackageIDCookie+',').replace(reg,"");
			if(MyPackageIDCookie.substr(MyPackageIDCookie.length-1)==","){
			MyPackageIDCookie = MyPackageIDCookie.substr(0,MyPackageIDCookie.length-1);
			}
			setCookie('package',MyPackageIDCookie,15);
			obj.attr("class","bmbg1");
			$("#gkbox_img").attr("class","dele").html("删除");
			tit = "该课程已成功从购物车删除！";
		}else
		{
			var reg=new RegExp((myid+","),"g");
			MyGradeIDCookie = (MyGradeIDCookie+',').replace(reg,"");
			if(MyGradeIDCookie.substr(MyGradeIDCookie.length-1)==","){
			MyGradeIDCookie = MyGradeIDCookie.substr(0,MyGradeIDCookie.length-1);
			}
			setCookie('grade',MyGradeIDCookie,15);
			obj.attr("class","bmbg");
			$("#gkbox_img").attr("class","dele").html("删除");
			tit = "该课程已成功从购物车删除！";
		}
	}
	$("div.bmbg2[myclassid]").each(function(){
		len += 1;
		price += parseInt($(this).attr("price"));
	});
	$("#gkbox_num").html(len);
	$("#p_num").html(len);
	$("#gkbox_Price").html(price);
	$("#gkbox_tit").html(tit);
	$("#gkbox").css({ left: "" + (obj.offset().left - 342) + "px", top: "" + (obj.position().top - 40) + "px" }).show();
}
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
function setCookie(cookieName,cookieValue,DayValue) {
	var expire = "";
	var day_value=1;
	if (DayValue != null) {
		day_value=DayValue;
	}
	expire = new Date((new Date()).getTime() + day_value * 86400000);
	expire = "; expires=" + expire.toGMTString();
	document.cookie = cookieName + "=" + escape(cookieValue) +";path=/"+ expire;
}
function MyPackageIDCookieTF(mid){
	if((","+MyPackageIDCookie+",").indexOf(","+mid+",")==-1){
		return false;
	}else{
		return true;
	}
}
function MyGradeIDCookieTF(mid){
	if((","+MyGradeIDCookie+",").indexOf(","+mid+",")==-1){
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
<div class="top" id="top">
</div>
<div class="loginStr" id="wxlogbox" style="height:249px;display:none;"></div>
<div class="logingc" id="wxregistbox" style="height:530px;display:none;"></div>
<div class="main">
<div class="ztmain">
  <div class="zttext"><a name="yhst" id="yhst"></a><#if exam.examDescription?exists>${exam.examDescription}</#if></div>
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
    	<#if listPc??><#list listPc as pc><a onclick="bmbox(${pc.ptypeId?c},'${pc.ptypeName}');" href="javascript:void(0);"><div class="buyvip" style="width:277px;height:50px; background:url(images/bg02.png);"><div  style="margin-left: 5px;margin-bottom: 8px;margin-top: 15px; "><h2 style="color: white;">${pc.ptypeName}</h2></div></div></a>
		<div class="buy_txt">${pc.ptypeDescription}</div></#list></#if>
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
	<table border="0" cellpadding="0" cellspacing="1" bgcolor="#e6e6e6" width="100%">
  <tbody>
  	<#if package??>
  	<#list package as c>
  	 <tr align="middle" class="tabbt">
      <td align="center" valign="middle">&nbsp;</td>
      <td align="center" valign="middle">课程专业名称</td>
      <td align="center" class="yellow">讲师</td>
      <td align="center" class="yellow">课时</td>
      <td align="center" class="yellow">原价</td>
      <td align="center" class="yellow">优惠价</td>
      <td align="center" valign="center" class="yellow">免费体验</td>
      <td align="center" valign="center" class="yellow">报名</td>
   </tr>
   <#list c as cp>
   		<#if cp_index==0>
   		<tr bgcolor="#AAE1DB" bordercolordark="#ffffff" bordercolorlight="#B9DBEA">
    	<td align="center" bgcolor="#f6f6f6" rowspan="${c?size}">
    		<div class="kebuyjg"><img src="images/package_${cp.ptypeId?c}.gif"><div class="chose">80% 的人选择该课程<div class="chico"></div>
    			</div>
    		</div>
    	</td>
    	<td align="center" bgcolor="#f6f6f6"><a  href="javascript:;">${cp.pkgName}</a></td>
    	<td align="center" bgcolor="#f6f6f6"><#list cp.tch as st><a href="/main/teacher/teacher${st.tchId?c}.html"target="_blank">${st.tchName}&nbsp;</a></#list></td>
    	<td align="center" bgcolor="#f6f6f6">${cp.pkgTotalTime}</td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="OldPrice">${cp.pkgRPrice?c}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="GoodPrice">${cp.pkgRPrice?c}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"><a href="/main/audition?pkgId=${cp.pkgId?c}" target="_blank" class="audition"><img src="images/st.gif"></a></td>
    	<td align="center" bgcolor="#f6f6f6"><div class="bmbg1" onclick="CourseSelect(${cp.pkgId?c},this,0);" myclassid="${cp.pkgId?c}" Price="${cp.pkgRPrice?c }"></div></td>  
    </tr>
   		</#if>
   		<#if cp_index!=0>
   		<tr bgcolor="#AAE1DB" bordercolordark="#ffffff" bordercolorlight="#B9DBEA">
    	<td align="center" bgcolor="#f6f6f6"><a	href="javascript:;">${cp.pkgName}</a></td>
    	<td align="center" bgcolor="#f6f6f6"><#list cp.tch as st><a href="/main/teacher/teacher${st.tchId?c}.html"target="_blank">${st.tchName}&nbsp;</a></#list></td>
    	<td align="center" bgcolor="#f6f6f6">${cp.pkgTotalTime}</td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="OldPrice">${cp.pkgOPrice?c}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="GoodPrice">${cp.pkgRPrice?c}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"><a href="/main/audition?pkgId=${cp.pkgId?c}" target="_blank" class="audition"><img src="images/st.gif"></a></td>
    	<td align="center" bgcolor="#f6f6f6"><div class="bmbg1" onclick="CourseSelect(${cp.pkgId?c},this,0);" myclassid="${cp.pkgId?c}" Price="${cp.pkgRPrice?c}"></div></td>
   		 </tr>
   		</#if>
   </#list>
  </#list>
  </#if>
      </tbody>
</table>
</div>
<div class="blk20" ></div> 
<div class="kelb"><div class="kelb_btn01 jc"></div>
</div>
<div class="kelb_btn02">	
	<#list list as c>
		<#if c_index==0>
			<div id="head_${c_index+1}" class="kb1" onmouseover="switchTag('head_','hd_list','${c_index+1}',${list?size},'kb1','kb2');"><div class="klf"></div><div class="kcet">
		<#list c as j>
			<#if j_index==0>
			${j.gradeCategory.gtypeName}
			</#if>
		</#list>
		</div><div class="krt"></div></div>
		</#if>
		<#if c_index!=0>
		<div id="head_${c_index+1}" class="kb2" onmouseover="switchTag('head_','hd_list','${c_index+1}',${list?size},'kb1','kb2');"><div class="klf"></div><div class="kcet">
		<#list c as j>
			<#if j_index==0>
			${j.gradeCategory.gtypeName}
			</#if>
		</#list>
		</div><div class="krt"></div></div>
		</#if>
	</#list>
</div>
<div  class="kelb_tab" >
	<#list list as c>
	<#if c_index==0>
	<div id="hd_list${c_index+1}">
    <table border="0" cellpadding="0" cellspacing="1" style=
    "background-color: #E6E6E6" width="100%">
        <tbody>
            <tr align="center" class="tabbt">
                <td align="center" valign="middle">&nbsp;</td>

                <td align="center" valign="middle">课程专业名称</td>

                <td align="center" class="yellow">讲师</td>

                <td align="center" class="yellow">课时</td>

                <td align="center" class="yellow">原价</td>

                <td align="center" class="yellow">优惠价</td>

                <td align="center" class="yellow" valign="center">免费体验</td>

                <td align="center" class="yellow" valign="center">报名</td>
            </tr>
            <#list c as j>
            	<#if j_index==0>
            		<tr style="background-color: #AAE1DB">
                <td align="center" rowspan="${c?size}" style=
                "background-color: #F6F6F6">
                    <div class="kebuyjg">
                        <h1 style="color:#000000 ;font-size: 30px">${j.gradeCategory.gtypeName}</h1>
                        
                    </div>
                </td>
                 <td align="center" style="background-color: #F6F6F6"><a href=
                "javascript:;">${j.examCategory.examName}${j.gradeCategory.gtypeName}</a></td>

                <td align="center" style="background-color: #F6F6F6"><a href="/main/teacher/teacher${j.teacher.tchId?c}.html" target="_blank">${j.teacher.tchName}</a></td>

                <td align="center" style="background-color: #F6F6F6">${j.gradeTime}</td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="OldPrice">￥${j.gradeOPrice?c}</span></td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="GoodPrice">￥${j.gradeRPrice?c}</span></td>

                <td align="center" style="background-color: #F6F6F6"><a class=
                "audition" href=
                "/main/gradeAudition?gradeId=${j.gradeId?c}" target=
                "_blank"><img src="images/st.gif"></a></td>

                <td align="center" style="background-color: #F6F6F6">
                    <div class="bmbg" onclick="CourseSelect(${j.gradeId?c},this,1);" myclassid="${j.gradeId?c}" price="${j.gradeRPrice?c}"></div>
                </td>
            </tr>
            	</#if>
            	<#if j_index!=0>
            		<tr style="background-color: #AAE1DB">
                <td align="center" style="background-color: #F6F6F6"><a href=
                "javascript:;">${j.examCategory.examName}${j.gradeCategory.gtypeName}</a></td>

                <td align="center" style="background-color: #F6F6F6"><a href="/main/teacher/teacher${j.teacher.tchId?c}.html" target="_blank">${j.teacher.tchName}</a></td>

                <td align="center" style="background-color: #F6F6F6">${j.gradeTime}</td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="OldPrice">￥${j.gradeOPrice?c}</span></td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="GoodPrice">￥${j.gradeRPrice?c}</span></td>

                <td align="center" style="background-color: #F6F6F6"><a class=
                "audition" href=
                "/main/gradeAudition?gradeId=${j.gradeId?c}" target=
                "_blank"><img src="images/st.gif"></a></td>

                <td align="center" style="background-color: #F6F6F6">
                    <div class="bmbg" onclick="CourseSelect(${j.gradeId?c},this,1);" myclassid="${j.gradeId?c}" price="${j.gradeRPrice?c }"></div>
                </td>
            </tr>
            	</#if>
            </#list>
            </tbody>
    </table>
	</div>
	</#if>
	<#if c_index!=0>
		<div id="hd_list${c_index+1}" style="display: none;">
    <table border="0" cellpadding="0" cellspacing="1" style="background-color: #E6E6E6" width="100%">
        <tbody>
            <tr align="center" class="tabbt">
                <td align="center" valign="middle">&nbsp;</td>

                <td align="center" valign="middle">课程专业名称</td>

                <td align="center" class="yellow">讲师</td>

                <td align="center" class="yellow">课时</td>

                <td align="center" class="yellow">原价</td>

                <td align="center" class="yellow">优惠价</td>

                <td align="center" class="yellow" valign="center">免费体验</td>

                <td align="center" class="yellow" valign="center">报名</td>
            </tr>
            <#list c as j>
            	<#if j_index==0>
            	<tr style="background-color: #AAE1DB">
                <td align="center" rowspan="${c?size}" style=
                "background-color: #F6F6F6">
                    <div class="kebuyjg">
                        <h1 style="color:#000000 ;font-size: 30px">${j.gradeCategory.gtypeName}</h1>
                    </div>
                </td>
                <td align="center" style="background-color: #F6F6F6"><a href=
                "javascript:;"
                >${j.examCategory.examName}${j.gradeCategory.gtypeName}</a></td>

                <td align="center" style="background-color: #F6F6F6"><a href="/main/teacher/teacher${j.teacher.tchId?c}.html" target="_blank">${j.teacher.tchName}</a></td>

                <td align="center" style="background-color: #F6F6F6">${j.gradeTime}</td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="OldPrice">￥${j.gradeOPrice?c}</span></td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="GoodPrice">￥${j.gradeRPrice?c}</span></td>

                <td align="center" style="background-color: #F6F6F6"><a class=
                "audition" href=
                "/main/gradeAudition?gradeId=${j.gradeId?c}" target="_blank"><img src="images/st.gif"></a></td>

                <td align="center" style="background-color: #F6F6F6">
                    <div class="bmbg" onclick="CourseSelect(${j.gradeId?c},this,1);" myclassid="${j.gradeId?c}" price="${j.gradeRPrice?c }"></div> 
            </tr>
            </#if>
           	<#if j_index!=0>
           	<tr style="background-color: #AAE1DB">
                <td align="center" style="background-color: #F6F6F6"><a href=
                "javascript:;"
                >${j.examCategory.examName}${j.gradeCategory.gtypeName}</a></td>

                <td align="center" style="background-color: #F6F6F6"><a href="/main/teacher/teacher${j.teacher.tchId?c}.html" target="_blank">${j.teacher.tchName}</a></td>

                <td align="center" style="background-color: #F6F6F6">${j.gradeTime}</td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="OldPrice">￥${j.gradeOPrice?c}</span></td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="GoodPrice">￥${j.gradeRPrice?c}</span></td>

                <td align="center" style="background-color: #F6F6F6"><a class=
                "audition" href=
                "/main/gradeAudition?gradeId=${j.gradeId?c}" target=
                "_blank"><img src="images/st.gif"></a></td>

                <td align="center" style="background-color: #F6F6F6">
                    <div class="bmbg" onclick="CourseSelect(${j.gradeId?c},this,1);" myclassid="${j.gradeId?c}" price="${j.gradeRPrice?c }"></div>
            </tr>
           	</#if>
            </#list>
              </tbody>
    </table>
	</div>
	</#if>
	</#list>
</div>
</div>
<div class="clear"></div>
<#include "foot1.ftl"/>
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
			    flashplayer: '/js/youeclass.swf',			   
                'file': "${exam.examUrl?default("http://demo.examw.com:8090/3.flv")}" ,
				width: '100%',
				height: '100%',
				controlbar: 'bottom',
				"skin":"/js/stormtrooper.zip",	
				image:'/main/images/bg2.png',
				provider: 'http',
				repeat:"always",
				autostart: 'true'
            }); 
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
		$(obj).attr("href","/cart/cartList")
	}         
</script>
</body>
</html>
