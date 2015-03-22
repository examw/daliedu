<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  href="/main/css/style.css" rel="stylesheet" type="text/css" ></link>
<script type="text/javascript">
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
	MyGradeIDCookie = getCookie('grade');
	//alert(MyGradeIDCookie);
	//alert(MyPackageIDCookie);
	$(".bmbg[myclassid]").each(function(){
		if( MyGradeIDCookieTF($(this).attr("myclassid")) == true){
			$(this).attr("class","bmbg2");
		}
	});
});
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
<div class="blk20" ></div> 
<div class="kelb"><div class="kelb_btn01 jc"></div></div>
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