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
function notice(content, t) {//ÌáÊ¾¿ò
    dianotice = jQuery.dialog({ id: "notice", content: content, icon: "warning", lock: true, opacity: 0.1, time: t, title: false, fixed: true });
}
function succeed(content, t) {
    artdialog = jQuery.dialog({ id: "artdialog", content: content, icon: "succeed", lock: true, opacity: 0.1, time: t, fixed: true, title: false });
}


