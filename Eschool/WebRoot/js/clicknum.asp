function getunionCookie(Name) 
{ 
    var search = Name + "=" ;
    if(document.cookie.length > 0) 
    { 
        offset = document.cookie.indexOf(search) 
        if(offset != -1) 
        { 
            offset += search.length 
            end = document.cookie.indexOf(";", offset) 
            if(end == -1) end = document.cookie.length 
            return unescape(document.cookie.substring(offset, end)) 
        } 
        else return ""; 
    } 
} 

(function(){
	var SiteName=location.hostname;
	if(SiteName=="px.frrc.com.cn"){window.location="http://px.frrc.com.cn/search/frrc/";}
	if(SiteName=="wx.hnjzpx.com"){window.location="http://wx.hnjzpx.com/search/hnjzpx/";}
	if(SiteName=="wx.kds100.com"){window.location="http://wx.kds100.com/search/kds100/";}
    //if(SiteName=="wx.examw.com"){window.location="http://wx.examw.com/search/union/";}
	var pageUrl,Parameter,part2='',a='',UnionREFERER;
    UnionREFERER = getunionCookie("UnionREFERER");
	pageUrl = window.location.href.toString();
	Parameter = pageUrl.split("?");
	part2 = Parameter[1]!=undefined?Parameter[1]:'';
	var Obj,oScript;
	Obj = document.getElementsByTagName("HEAD").item(0);
	oScript= document.createElement("script");
	oScript.type = "text/javascript";
	oScript.defer = "defer";
    var part3 = part2==''?"uref="+UnionREFERER:part2+"&uref="+UnionREFERER;
	oScript.src="/search/getUnionID.asp?"+part3;
	Obj.appendChild(oScript);	
	Obj = document.getElementsByTagName("HEAD").item(0);
	oScript= document.createElement("script");
	oScript.type = "text/javascript";
	oScript.defer = "defer";
	oScript.src="http://s4.cnzz.com/stat.php?id=1527823&web_id=1527823&show=pic1";
	Obj.appendChild(oScript);
})()