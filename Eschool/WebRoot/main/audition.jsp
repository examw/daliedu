<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
 <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
 <script  type="text/javascript">
  function SetCookie(objName, objValue, objHours) {
    var str = objName + "=" + escape(objValue);
    if (objHours > 0) {
        var date = new Date();
        var ms = objHours * 3600 * 1000;
        date.setTime(date.getTime() + ms);
        str += "; expires=" + date.toGMTString() + "";
    }
    document.cookie = str + ";path=/search/UserCenter/";
    document.cookie = str + ";path=/search/UserCenter/";
    }
    function GetCookie(objName) {
    var arrStr = document.cookie.split("; ");
    for (var i = 0; i < arrStr.length; i++) {
        var temp = arrStr[i].split("=");
        if (temp[0] == objName) return unescape(temp[1]);
    }
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
			};
		}else
		{
			if(MyGradeIDCookie==''){
				setCookie('grade',myid,15);
			}else{
				setCookie('grade',MyGradeIDCookie+','+myid,15);
			};
		};
	} 
</script>
	
<h2><a href="#audition" class="xz">课程试听</a><a href="#002">学员评价</a></h2>
      <ul class="center">
	  	<s:iterator value="gradeList" var="g">
          <li>
              <dl>
                  <dt><img src="images/t_st.jpg" width="171" height="107" /></dt>
                  <dd>
                    <span class="ms_kj_span1">${g.examCategory.examName}${g.gradeCategory.gtypeName}<br /></span>
                    <span class="ms_kj_span2"><em><a onclick="CourseSelect('${g.gradeId}',1);" href='/cart/cartList' target="_blank">报名>></a></em><a href="/main/gradeAudition?gradeId=${g.gradeId }" class="st" target="_blank">点击试听>></a></span>
                  </dd>
              </dl>
          </li>
		  </s:iterator> 
	</ul>
        
