
function CourseSelect(myid,o){
	var len = 0,price = 0,obj = $(o),MyClassIDCookie = getCookie('WangXiao=MyClassID'),tit = "";
	if(obj.attr("class") == 'bmbg'){
		if(MyClassIDCookie==''){
			setCookie('WangXiao=MyClassID',myid,15);
		}else{
			setCookie('WangXiao=MyClassID',MyClassIDCookie+','+myid,15);
		}
		obj.attr("class","bmbg2")
		$("#gkbox_img").attr("class","chen").html("成功")
		tit = "课程已成功添加到购课车！"
	}else{
		var reg=new RegExp((myid+","),"g");
		MyClassIDCookie = (MyClassIDCookie+',').replace(reg,"");
		if(MyClassIDCookie.substr(MyClassIDCookie.length-1)==","){
			MyClassIDCookie = MyClassIDCookie.substr(0,MyClassIDCookie.length-1);
		}
		setCookie('WangXiao=MyClassID',MyClassIDCookie,15);
		obj.attr("class","bmbg")
		$("#gkbox_img").attr("class","dele").html("删除")
		tit = "该课程已成功从购物车删除！"
	}
	$("div.bmbg2[myclassid]").each(function(){
		len += 1
		price += parseInt($(this).attr("price"))
	})
	$("#gkbox_num").html(len)
	$("#gkbox_Price").html(price)
	$("#gkbox_tit").html(tit)
	$("#gkbox").css({ left: "" + (obj.offset().left - 342) + "px", top: "" + (obj.position().top - 40) + "px" }).show();
}
function MyClassIDCookieTF(mid){
	if((","+MyClassIDCookie+",").indexOf(","+mid+",")==-1){
		return false
	}else{
		return true
	}
}
function bdmCourse(o){
	var obj = $(o)
	$("#bdmbox").css({ left: "" + (obj.offset().left - 220) + "px", top: "" + (obj.position().top + 33) + "px" }).fadeIn().delay(3000).fadeOut();
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
			cookieValue = unescape(document.cookie.substring(offset, end))
		}
	}
	return unescape(cookieValue);
}
function ajaxurlCode(str){
	return encodeURIComponent(encodeURIComponent(str));
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
function notice(content, t) {//提示框
    dianotice = jQuery.dialog({ id: "notice", content: content, icon: "warning", lock: true, opacity: 0.1, time: t, title: false, fixed: true });
}
function succeed(content, t) {
    artdialog = jQuery.dialog({ id: "artdialog", content: content, icon: "succeed", lock: true, opacity: 0.1, time: t, fixed: true, title: false });
}


