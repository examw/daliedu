<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未支付课程</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
<script language="javascript">
function showDivById(did, divName, imgName) {
    var lessonDiv = $("#" + did);  
    if (arguments.length==3) {
        var img = $("#img_" + did); //图标    
        var divList = $("div[name='" + divName + "']");
        var imgList = $("img[name='" + imgName + "']");
        divList.each(function () {
            if ($(this).attr("id") != did) {
                $(this).hide(); //隐藏详细
                    //img.attr("src", "../../images/pic_011.gif"); 
                   // img.attr("alt", "展开");
                }
        });
        imgList.each(function () {
                $(this).attr("src", "../images/pic_011.gif");
                $(this).attr("alt", "展开");
        });

        if (lessonDiv.css("display") == "none") {
            lessonDiv.show(); //显示详细
            img.attr("alt", "缩起");
            img.attr("src", "../images/pic_010.gif");

        } else {
            lessonDiv.hide(); //隐藏详细
            img.attr("alt", "展开");
            img.attr("src", "../images/pic_011.gif");
        }        
    }else if (arguments.length==2) {
       
        var divList2 = $("div[name='" + divName + "']");
        divList2.each(function () {
            if ($(this).attr("id") != did.toString()) {
                $(this).hide(); //隐藏详细
            }
        });
        if (lessonDiv.css("display") == "none") {
            lessonDiv.show(); //显示详细
        } else {
            lessonDiv.hide(); //隐藏详细 
        }    
    }
    
}
	//myid:套餐或者班级id，o：dom对象，type:类型0是套餐，1是单班级
	function CourseSelect(myid,type){
	//套餐cookie
	var MyPackageIDCookie = getCookie('package');
	//班级cookie
	var MyGradeIDCookie = getCookie('grade');
		if(type==0)
		{
			if(MyPackageIDCookie==''){
				setCookie('package',myid,15);
			}else{
				setCookie('package',MyPackageIDCookie+','+myid,15);
			}	
		}else
		{
			if(MyGradeIDCookie==''){
				setCookie('grade',myid,15);
			}else{
				setCookie('grade',MyGradeIDCookie+','+myid,15);
			}
		}
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

function show_confirm(itemId)
{
var r=confirm("确认删除？");
if (r==true)
  {
  	$.post("/member/deleteItem",{itemId:itemId},function(data){
  		if (!data)
        {
            alert('删除失败!');
               } else
        {
            location.href ="/member/noPayLessons?stuId="+<s:property value="#session.student.stuId"/>;
         }
  	});
  }
}

$(function(){
   $("#class_").addClass("hhover");
});   
     
</script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="/memberCenter/member.jsp">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="/member/myLessons?stuId=<s:property value="#session.student.stuId"/>">网络课堂</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href='/member/noPayLessons?stuId=<s:property value="#session.student.stuId"/>'>未支付课程</a></p>
<div class="List">
<h1 class="ListTop">
<span>
<ul>
<li><a href='/member/myLessons'>我的课程</a></li>
<li  id="xz"><a href='/member/noPayLessons'>未支付课程</a></li>
<li><a href='/member/overLessons'>已过期课程</a></li>
<li><a href="/member/studyInfo">学习记录</a></li>
<li><a href="#">我的学分</a></li>
</ul>
</span>
</h1>
<div class="ListContent">
<table cellspacing="0" cellpadding="0" border="0" width="688">
<tbody>
 <tr>
  <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><p class="back_g"><strong>课程名称</strong></p></td>
  <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>下单时间</strong></td>
  <td bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>原&nbsp;价</strong></td>
  <td height="24" bgcolor="#f9f9f9" align="center" class="xxzx_ber_a"><strong>优惠价</strong></td>
  <td width="108" align="center" bgcolor="#f9f9f9" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
 </tr>
 <s:iterator value="myLesson.classPackages" var="cp" status="col">
 <tr>
   <td width="290" class="xxzx_ber_c font_14">
   &nbsp;<img style="cursor:pointer" onclick="showDivById('${col.index+1}','myDiv','myImg')" class="img_a" src="../images/pic_011.gif" alt="展开" id="img_${col.index+1}" name="myImg">&nbsp;<a title="${cp.pkgName}" target="_blank" href="/cart/cartList"  onclick="CourseSelect(${cp.pkgId},0);" >${cp.pkgName}</a>
   </td>
   <td align="center" width="114" class="xxzx_ber_c font_14"><fmt:formatDate value="${cp.orderTime}" pattern="yyyy-MM-dd" /></td>
   <td align="center" width="87" class="xxzx_ber_c font_14"><var>￥${cp.pkgOPrice}元</var></td>
   <td align="center" width="89" class="xxzx_ber_c font_14"><em>￥${cp.pkgRPrice}元</em></td>
   <td align="center" class="xxzx_ber_c font_a">
   <a target="_blank" href="/cart/cartList"  onclick="CourseSelect(${cp.pkgId},0);" >支 付</a>&nbsp;
   <a  href="javascript:;" id="ctl00_cp1_Repeater1_ctl00_lbtnDel" onclick="show_confirm(${cp.itemId})">取 消</a><br>
    </td>      
</tr>
<tr>
   <td class="xxzx_ber_d font_14" colspan="6">
   <div name="myDiv" class="wzgk_oned center" id="${col.index+1}" style="display: none;">
   <table cellspacing="0" cellpadding="0" border="0" width="680">
   <tbody>
   <tr>
     <td bgcolor="#fff3db" align="center" width="303" style="line-height:26px;"><p class="back_g">课程名称</p></td>
     <td bgcolor="#fff3db" align="center" width="102" style="line-height:26px;">下单时间</td>
     <td bgcolor="#fff3db" align="center" width="84" style="line-height:26px;">原&nbsp;价</td>
     <td height="26" bgcolor="#fff3db" align="center" width="99" style="line-height:26px;">优惠价</td>
     <td height="26" bgcolor="#fff3db" align="center" width="92" style="line-height:26px;">操&nbsp;作</td>
   </tr>
   <s:iterator value="#cp.grade" var="g" status="status">
   <tr>
    <td class="font_14">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" title="${g.examCategory.examName}${g.gradeCategory.gtypeName}">${g.examCategory.examName}-${g.gradeCategory.gtypeName}</a></td>
    <td align="center">---</td>
    <td align="center" class="font_14">--</td>
    <td height="26" align="center" class="font_14"><em>--</em></td>
    <td height="26" align="center">---</td>
   </tr>
   </s:iterator>
   </tbody>
   </table>
   </div>
  </td>
</tr>
 
</s:iterator>
 <s:iterator value="myLesson.grade" var="g" status="col">
<tr>
                                                <td class="xxzx_ber_e font_14"
                                                width="344">&nbsp;<img src=
                                                "../images/pic_bh.gif" />&nbsp;
                                                <a title="${g.examCategory.examName}${status.index+1}" href='/cart/cartList' onclick="CourseSelect(${g.gradeId},1);"target="_blank">${g.examCategory.examName}-${g.gradeCategory.gtypeName}</a></td>

                                                <td align="center" class=
                                                "xxzx_ber_e font_14" width=
                                                "110"><fmt:formatDate value="${g.orderTime}" pattern="yyyy-MM-dd" /></td>

                                                <td align="center" class=
                                                "xxzx_ber_e font_14" width=
                                                "92"><var>￥${g.gradeOPrice}元</var></td>

                                                <td align="center" class=
                                                "xxzx_ber_e font_14" width=
                                                "113"><em>￥${g.gradeRPrice}元</em></td>
                                                <td align="center" class=
                                                "xxzx_ber_e font_a"><a href=
                                                '/cart/cartList'
                                                 onclick="CourseSelect(${g.gradeId},1);"
                                                target="_blank">支 付</a> &nbsp;
                                                <a href=""  id="ctl00_cp1_Repeater2_ctl00_lbtnDel"
                                                 onclick="show_confirm(${g.itemId})">取
                                                消</a><br /></td>
   </tr>
  </s:iterator>
</tbody>
</table>
<s:if test="myLesson.grade.size==0&&myLesson.classPackages.size==0">
	<div class="emptyDiv2">
    <span class="no">&nbsp;</span>
	</div>
</s:if>
</div>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
