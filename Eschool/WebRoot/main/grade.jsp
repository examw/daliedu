<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
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
<div class="kelb">
	<div class="kelb_btn01 jc"></div>
</div>
<div class="kelb_btn02">
<s:iterator value="e" var="c" status="col">
	<s:if test="#col.getIndex()==0">
	<div id="head_${col.index+1}" class="kb1" onmouseover="switchTag('head_','hd_list','${col.index+1}',<s:property value="e.size" />,'kb1','kb2');"><div class="klf"></div><div class="kcet">
		<s:iterator  value="#c" status="status" var="j">
    	<s:if test="#status.getIndex()==0">
       ${j.gradeCategory.gtypeName}
    	</s:if>
    	<s:else>
     	</s:else>   
     </s:iterator> 
	</div><div class="krt"></div></div>
	</s:if>
	<s:else>
		<div id="head_${col.index+1}" class="kb2" onmouseover="switchTag('head_','hd_list','${col.index+1}',<s:property value="e.size" />,'kb1','kb2');"><div class="klf"></div><div class="kcet">
		<s:iterator  value="#c" status="status" var="j">
    	<s:if test="#status.getIndex()==0">
       ${j.gradeCategory.gtypeName}
    	</s:if>
    	<s:else>
     	</s:else>   
     </s:iterator>
	</div><div class="krt"></div></div>
	</s:else>
</s:iterator>
</div>
<div  class="kelb_tab" >
	<s:iterator value="e" var="c" status="col">
	<s:if test="#col.getIndex()==0">
	<div id="hd_list${col.index+1}">
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
			<s:iterator value="#c" var="j" status="col">
			<s:if test="#col.getIndex()==0">
            <tr style="background-color: #AAE1DB">
                <td align="center" rowspan="<s:property value="#c.size" />" style=
                "background-color: #F6F6F6">
                    <div class="kebuyjg">
                        <img src="images/banji_1.gif">

                        <div class="chose">
                            600人选择该课程
                            <div class="chico"></div>
                        </div>
                    </div>
                </td>
                 <td align="center" style="background-color: #F6F6F6"><a href=
                "javascript:;">${j.examCategory.examName}${j.gradeCategory.gtypeName}</a></td>

                <td align="center" style="background-color: #F6F6F6"><a href="/main/teacherShow?tchId=${j.teacher.tchId}" target="_blank">${j.teacher.tchName}</a></td>

                <td align="center" style="background-color: #F6F6F6">${j.gradeTime}</td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="OldPrice">￥${j.gradeOPrice}</span></td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="GoodPrice">￥${j.gradeRPrice}</span></td>

                <td align="center" style="background-color: #F6F6F6"><a class=
                "audition" href=
                "/main/gradeAudition?gradeId=${j.gradeId }" target=
                "_blank"><img src="images/st.gif"></a></td>

                <td align="center" style="background-color: #F6F6F6">
                    <div class="bmbg" onclick="CourseSelect(${j.gradeId},this,1);" myclassid="${j.gradeId }" price="${j.gradeRPrice }"></div>
                </td>
            </tr>
			</s:if>
			<s:else>
            <tr style="background-color: #AAE1DB">
                <td align="center" style="background-color: #F6F6F6"><a href=
                "javascript:;">${j.examCategory.examName}${j.gradeCategory.gtypeName}</a></td>

                <td align="center" style="background-color: #F6F6F6"><a href="/main/teacherShow?tchId=${j.teacher.tchId}" target="_blank">${j.teacher.tchName}</a></td>

                <td align="center" style="background-color: #F6F6F6">${j.gradeTime}</td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="OldPrice">￥${j.gradeOPrice}</span></td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="GoodPrice">￥${j.gradeRPrice}</span></td>

                <td align="center" style="background-color: #F6F6F6"><a class=
                "audition" href=
                "/main/gradeAudition?gradeId=${j.gradeId }" target=
                "_blank"><img src="images/st.gif"></a></td>

                <td align="center" style="background-color: #F6F6F6">
                    <div class="bmbg" onclick="CourseSelect(${j.gradeId},this,1);" myclassid="${j.gradeId }" price="${j.gradeRPrice }"></div>
                </td>
            </tr>
            </s:else>
          	</s:iterator>       
        </tbody>
    </table>
	</div>
	</s:if>
	<s:else>
		<div id="hd_list${col.index+1}" style="display: none;">
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
			<s:iterator value="#c" var="j" status="col">
			<s:if test="#col.getIndex()==0">
            <tr style="background-color: #AAE1DB">
                <td align="center" rowspan="<s:property value="#c.size" />" style=
                "background-color: #F6F6F6">
                    <div class="kebuyjg">
                        <img src="images/banji_1.gif">

                        <div class="chose">
                            600人选择该课程

                            <div class="chico"></div>
                        </div>
                    </div>
                </td>
                <td align="center" style="background-color: #F6F6F6"><a href=
                "javascript:;"
                >${j.examCategory.examName}${j.gradeCategory.gtypeName}</a></td>

                <td align="center" style="background-color: #F6F6F6"><a href="/main/teacherShow?tchId=${j.teacher.tchId}" target="_blank">${j.teacher.tchName}</a></td>

                <td align="center" style="background-color: #F6F6F6">${j.gradeTime}</td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="OldPrice">￥${j.gradeOPrice}</span></td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="GoodPrice">￥${j.gradeRPrice}</span></td>

                <td align="center" style="background-color: #F6F6F6"><a class=
                "audition" href=
                "/main/gradeAudition?gradeId=${j.gradeId }" target="_blank"><img src="images/st.gif"></a></td>

                <td align="center" style="background-color: #F6F6F6">
                    <div class="bmbg" onclick="CourseSelect(${j.gradeId},this,1);" myclassid="${j.gradeId }" price="${j.gradeRPrice }"></div> 
            </tr>
            </s:if>
            <s:else>
            <tr style="background-color: #AAE1DB">
                <td align="center" style="background-color: #F6F6F6"><a href=
                "javascript:;"
                >${j.examCategory.examName}${j.gradeCategory.gtypeName}</a></td>

                <td align="center" style="background-color: #F6F6F6"><a href="/main/teacherShow?tchId=${j.teacher.tchId}" target="_blank">${j.teacher.tchName}</a></td>

                <td align="center" style="background-color: #F6F6F6">${j.gradeTime}</td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="OldPrice">￥${j.gradeOPrice}</span></td>

                <td align="center" style="background-color: #F6F6F6">
                <span class="GoodPrice">￥${j.gradeRPrice}</span></td>

                <td align="center" style="background-color: #F6F6F6"><a class=
                "audition" href=
                "/main/gradeAudition?gradeId=${j.gradeId }" target=
                "_blank"><img src="images/st.gif"></a></td>

                <td align="center" style="background-color: #F6F6F6">
                    <div class="bmbg" onclick="CourseSelect(${j.gradeId},this,1);" myclassid="${j.gradeId }" price="${j.gradeRPrice }"></div>
            </tr>
            </s:else>
          	</s:iterator>       
        </tbody>
    </table>
	</div>
	</s:else>
	</s:iterator>
</div>
